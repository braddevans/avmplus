#!/usr/bin/env python
# -*- Mode: Python; indent-tabs-mode: nil -*-
# vi: set ts=4 sw=4 expandtab:
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

from __future__ import print_function

import bisect
import optparse
import os
import pickle
import subprocess
import sys

scriptname = os.path.basename(os.path.normpath(os.path.abspath(sys.argv[0])))
standardHeader = """// This file was auto-generated, do not modify by hand.
// """ + scriptname + " generates this file.\n"


# ------------------------------------------------------------------------------
# Process creation / execution
# ------------------------------------------------------------------------------

def run_process(p, msg, ignore_errors=False):
    (stdoutdata, stderrdata) = p.communicate()
    if not ignore_errors:
        if not p.returncode == 0:
            if stderrdata:
                print(stderrdata)
            print(msg)
            sys.exit(1)
    return stdoutdata, stderrdata


def create_process(exe, args, verbose=False):
    cmdargs = [exe] + args

    if verbose:
        print("running: " + " ".join(cmdargs))

    return subprocess.Popen(cmdargs, executable=exe, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


# ------------------------------------------------------------------------------
# demangle
# ------------------------------------------------------------------------------

def get_type(t):
    t = t.strip()

    if t.startswith("avmplus::"):
        return t.replace("avmplus::", "")
    elif t.find("S*") != -1:
        return "".join(t.split("S*"))
    elif t.find("*") != -1:
        p = t.find("*")
        return get_type(t[0:p]) + t[p:len(t)]
    elif t == "unsigned int" or t == "uint32_t":
        return "uint32_t"
    elif t == "int":
        return "int32_t"
    else:
        return t


def demangle(n):
    (stdout, stderr) = run_process(create_process('c++filt', [u'-n', n], False), "Unable to demangle...")
    stdout = stdout.replace("((anonymous namespace)::LLVMSelectGetSetDelHasProperty)", "FAIL")
    (functype, args) = stdout.split("(");
    args = args.replace(")", "").split(",")
    functype = functype.replace("<", " ").replace(">", " ").replace(",", " ").replace("unsigned int", "uint32_t").split(
        " ")

    # we only care if its templated
    if len(functype) > 2:
        return "template %s %s(%s);" % (
            get_type(functype[0]), get_type(functype[1]), ", ".join(map(get_type, args)).strip())
    else:
        # print "# ignoring non-templated function: %s" % n
        return None


# ------------------------------------------------------------------------------
# Stub order optimisation
# ------------------------------------------------------------------------------

stuborder = {}
pickleFile = "AOTStubs.pickle"


def update_stub_order(fn):
    global stuborder
    count = 0
    for info in open(fn).read().splitlines():
        count += 1
        bits = info.split("|")
        n = demangle(bits[0].strip())
        try:
            stuborder[n] += int(bits[1])
        except KeyError:
            stuborder[n] = int(bits[1])
    print("# Found %d stubs in %s" % (count, fn))


def update_stub_ordering(files):
    global stuborder
    global pickleFile
    if os.path.exists(pickleFile):
        f = open(pickleFile, 'rb')
        stuborder = pickle.load(f)
        f.close()
    else:
        print("No stub ordering file found: '%s'" % os.path.abspath(pickleFile))

    if len(files) > 0:
        for fn in files:
            update_stub_order(fn)
        f = open(pickleFile, 'wb')
        pickle.dump(stuborder, f)
        f.close()


def dump_stub_order_info(files):
    global stuborder
    update_stub_ordering(files)

    for (s, c) in stuborder.iteritems():
        print("%s | %d" % (s, c))


def get_stub_sort_order(stub):
    global stuborder

    substubs = [stub]

    # CUIDADO! Be sure to get the number of spaces correct in the replacements
    if stub.find(" DOUBLE_ALLOCA_DECL") != -1:
        substubs.append(stub.replace(" DOUBLE_ALLOCA_DECL", ""))
        substubs.append(stub.replace(" DOUBLE_ALLOCA_DECL", ", double *"))

    for substub in substubs:
        try:
            return stuborder[substub]
        except KeyError:
            pass

    return 0


# ------------------------------------------------------------------------------
# Header Generation
# ------------------------------------------------------------------------------

stubs = []
currentfile = None
stubcount = 0
stubmax = 4000
numstubheaders = 30


def subgroups(xs, n):
    result = []
    s = len(xs) / n
    for i in range(n - 1):
        result.append(xs[:s])
        xs = xs[s:]
    if len(xs) > 0:
        result.append(xs)
    return result


def gen_cpp_files(stubs, filenum):
    for xs in subgroups(stubs, numstubheaders):

        hfile = "AOTStubs-%05d.cpp" % filenum
        hfile = open(hfile, "w")

        print(standardHeader, file=hfile)
        print("#include \"AOTStubs.h\"", file=hfile)
        for x in xs:
            print((x[1]), file=hfile)
        hfile.close()

        filenum += 1


# ------------------------------------------------------------------------------
# Stub Generation
# ------------------------------------------------------------------------------

argdesctypes = ["uint32_t", "char*"]
vectortypes = ["DoubleVectorObject*", "IntVectorObject*", "UIntVectorObject*", "ObjectVectorObject*"]
objecttypes = ["ScriptObject*", "ArrayObject*", "LLVMAtom"]
receivertypes = objecttypes + ["String*", "double"]
mosttypes = ["double", "int32_t", "uint32_t", "String*", "LLVMBool", "Namespace*", "QNameObject*"] + objecttypes
alltypes = ["void"] + mosttypes
multinameIndexTypes = ["LLVMMultinameIndex", "Multiname*"]
multinameIndexTypesWithInt = multinameIndexTypes + ["LLVMMultinameIndexMaybeInt", "LLVMMultinamePtrMaybeInt"]


def gen_perms(xs):
    if len(xs) == 0:
        return [[]]
    else:
        p = gen_perms(xs[1:])
        return [[x] + y for x in xs[0] for y in p]


def gen_stubs(name, types, filter_func=None):
    perms = gen_perms(types)
    if filter_func is not None:
        perms = filter_func(perms)
    if len(types) == 1:
        for p in perms:
            gen_call((p[0], name, ""))
    else:
        for p in perms:
            gen_call((p[0], name, ", ".join(p[1:])))


def gen_call(params):
    global stubs
    decl = "template %s %s(%s);" % params
    bisect.insort(stubs, (- get_stub_sort_order(decl), decl))


def gen_prop_related_with_int_opt_double(name, ret_types, arg_types=None):
    if arg_types is None:
        arg_types = [mosttypes]
    name_types = mosttypes + ["LLVMUnusedParam"]
    legal_uint_name_types = {"double", "int32_t", "uint32_t", "LLVMAtom"}
    legal_uint_object_types = set(objecttypes)
    # perm: 0:retType, 1: MethodEnv*, 2:multinameIndex, 3:n, 4:ns, 5:obj
    filter_int_permutations = lambda perms: filter(lambda perm: (perm[2] in multinameIndexTypes) or (
            (perm[3] in legal_uint_name_types) and (perm[4] == "LLVMUnusedParam") and (
            perm[5] in legal_uint_object_types)), perms)
    gen_stubs(name,
              [ret_types, ["MethodEnv* DOUBLE_ALLOCA_DECL"], multinameIndexTypesWithInt, name_types,
               name_types] + arg_types,
              filter_int_permutations)


def gen_prop_related_with_vector_opts(name, retTypes, argTypes):
    name_types = mosttypes + ["LLVMUnusedParam"]
    legal_uint_name_types = {"double", "int32_t", "uint32_t", "LLVMAtom"}
    legal_uint_object_types = set(objecttypes + vectortypes)
    # perm: 0:retType, 1: MethodEnv*, 2:multinameIndex, 3:n, 4:ns, 5:obj
    filterIntPermutations = lambda perms: filter(lambda perm: (perm[2] in multinameIndexTypes) or (
            (perm[3] in legal_uint_name_types) and (perm[4] == "LLVMUnusedParam") and (
            perm[5] in legal_uint_object_types)), perms)
    gen_stubs(name,
              [retTypes, ["MethodEnv* DOUBLE_ALLOCA_DECL"], multinameIndexTypesWithInt, name_types,
               name_types] + argTypes,
              filterIntPermutations)


def gen_prop_related_with_int(name, ret_types, arg_types=None):
    if arg_types is None:
        arg_types = [mosttypes]
    name_types = mosttypes + ["LLVMUnusedParam"]
    legal_uint_name_types = {"double", "int32_t", "uint32_t", "LLVMAtom"}
    legal_uint_object_types = set(objecttypes)
    # perm: 0:retType, 1: MethodEnv*, 2:multinameIndex, 3:n, 4:ns, 5:obj
    filter_int_permutations = lambda perms: filter(lambda perm: (perm[2] in multinameIndexTypes) or (
            (perm[3] in legal_uint_name_types) and (perm[4] == "LLVMUnusedParam") and (
            perm[5] in legal_uint_object_types)), perms)
    gen_stubs(name, [ret_types, ["MethodEnv*"], multinameIndexTypesWithInt, name_types, name_types] + arg_types,
              filter_int_permutations)


def gen_prop_related(name, ret_types, arg_types=None):
    if arg_types is None:
        arg_types = [mosttypes]
    name_types = mosttypes + ["LLVMUnusedParam"]
    gen_stubs(name, [ret_types, ["MethodEnv*"], multinameIndexTypes, name_types, name_types] + arg_types)


# ------------------------------------------------------------------------------
# Main Entrypoint
# ------------------------------------------------------------------------------

if __name__ == "__main__":
    import os.path

    optParser = optparse.OptionParser(usage='usage: %prog [ options ] file1.abc ... fileN.abc')
    optParser.set_defaults()
    optParser.allow_interspersed_args = True
    optParser.add_option('-d', '--dump', dest="dump", default=False)
    optParser.add_option('-n', '--numstubheaders', dest="numstubheaders", default=30)
    optParser.add_option('-p', '--picklefile', dest="pickleFile", default=None)

    (opts, args) = optParser.parse_args()

    if opts.dump:
        dump_stub_order_info(args)
        sys.exit(0)
    if opts.pickleFile:
        pickleFile = opts.pickleFile
    update_stub_ordering(args)

    gen_stubs("abcOP_si8", [["void"], ["MethodEnv*"], ["uint32_t", "int32_t", "LLVMAtom"],
                            ["uint32_t", "int32_t", "double", "LLVMAtom"]])
    gen_stubs("abcOP_si16", [["void"], ["MethodEnv*"], ["uint32_t", "int32_t", "LLVMAtom"],
                             ["uint32_t", "int32_t", "double", "LLVMAtom"]])
    gen_stubs("abcOP_si32", [["void"], ["MethodEnv*"], ["uint32_t", "int32_t", "LLVMAtom"],
                             ["uint32_t", "int32_t", "double", "LLVMAtom"]])
    gen_stubs("abcOP_sf32", [["void"], ["MethodEnv*"], ["double", "int32_t", "LLVMAtom"],
                             ["uint32_t", "int32_t", "double", "LLVMAtom"]])
    gen_stubs("abcOP_sf64", [["void"], ["MethodEnv*"], ["double", "int32_t", "LLVMAtom"],
                             ["uint32_t", "int32_t", "double", "LLVMAtom"]])

    gen_stubs("abcOP_li8", [["uint32_t", "int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_li16", [["uint32_t", "int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_li32", [["uint32_t", "int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_lf32", [["double"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_lf64", [["double"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_sxi1", [["uint32_t", "int32_t", "LLVMAtom"], ["MethodEnv*"], ["uint32_t", "int32_t", "LLVMAtom"]])
    gen_stubs("abcOP_sxi8", [["uint32_t", "int32_t", "LLVMAtom"], ["MethodEnv*"], ["uint32_t", "int32_t", "LLVMAtom"]])
    gen_stubs("abcOP_sxi16", [["uint32_t", "int32_t", "LLVMAtom"], ["MethodEnv*"], ["uint32_t", "int32_t", "LLVMAtom"]])

    gen_prop_related_with_int("abcOP_deleteproperty", ["LLVMBool"])
    gen_prop_related_with_vector_opts("abcOP_getproperty", mosttypes, argTypes=[mosttypes + vectortypes])
    gen_prop_related_with_vector_opts("abcOP_getproperty_nonc", mosttypes, argTypes=[mosttypes + vectortypes])
    gen_prop_related_with_vector_opts("abcOP_setproperty", ["void"], argTypes=[mosttypes + vectortypes, mosttypes])
    gen_prop_related_with_vector_opts("abcOP_setproperty_nonc", ["void"], argTypes=[mosttypes + vectortypes, mosttypes])
    gen_prop_related("abcOP_initproperty", ["void"], arg_types=[mosttypes, mosttypes])
    gen_prop_related("abcOP_callproperty", alltypes, arg_types=[mosttypes, argdesctypes, ["..."]])

    gen_prop_related("abcOP_constructprop", mosttypes, arg_types=[argdesctypes, ["..."]])
    gen_prop_related("abcOP_getdescendants", mosttypes, arg_types=[mosttypes])
    gen_prop_related("abcOP_getsuper", mosttypes, arg_types=[mosttypes])
    gen_prop_related("abcOP_setsuper", ["void"], arg_types=[mosttypes, mosttypes])

    gen_prop_related("abcOP_findproperty", mosttypes, arg_types=[["LLVMAtom*"], ["int32_t"], ["int32_t"]])
    gen_prop_related("abcOP_findpropstrict", mosttypes, arg_types=[["LLVMAtom*"], ["int32_t"], ["int32_t"]])
    gen_stubs("abcOP_finddef", [objecttypes, ["MethodEnv*"], multinameIndexTypes])

    gen_stubs("abcOP_methodEnvFromDispId", [["MethodEnv*"], ["MethodEnv*"], mosttypes, ["int32_t"]])
    gen_stubs("abcOP_methodEnvFromBaseDispId", [["MethodEnv*"], ["MethodEnv*"], mosttypes, ["int32_t"]])
    gen_stubs("abcOP_handlerFromMethodEnv", [["int32_t*"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_call", [mosttypes, ["MethodEnv*"], objecttypes, argdesctypes, ["..."]])
    gen_stubs("abcOP_callmethod", [alltypes, ["MethodEnv*"], mosttypes, ["int32_t"], argdesctypes, ["..."]])
    gen_stubs("abcOP_callstatic", [alltypes, ["MethodEnv*"], ["AbcEnv*"], ["int32_t"], argdesctypes, ["..."]])
    gen_prop_related("abcOP_callsuper", alltypes, arg_types=[argdesctypes, ["..."]])

    gen_stubs("abcOP_throwCallOfNonFunctionError", [alltypes, ["MethodEnv*"]])

    gen_stubs("abcOP_construct", [mosttypes, ["MethodEnv*"], mosttypes, argdesctypes, ["..."]])

    gen_stubs("abcOP_getglobalscope", [mosttypes, ["MethodEnv*"]])

    gen_stubs("abcOP_findInterfaceBinding", [["int32_t"], ["int32_t"], ["const uint32_t*", "const uint16_t*"]])

    gen_stubs("abcOP_not", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_increment", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_decrement", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_increment_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_decrement_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_add", [mosttypes, ["MethodEnv* DOUBLE_ALLOCA_DECL"], mosttypes, mosttypes])
    gen_stubs("abcOP_add_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_subtract", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_subtract_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_multiply", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_multiply_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_divide", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_modulo", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_bitand", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_bitor", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_bitxor", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_bitnot", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_lshift", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_rshift", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_urshift", [["uint32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_negate", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_negate_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_true", [["LLVMBool", "LLVMAtom", "int32_t"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_equals", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_strictequals", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_lessthan", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_greaterthan", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_greaterequals", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_lessequals", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_istype", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], ["Traits**"], mosttypes])
    gen_stubs("abcOP_astype", [mosttypes, ["MethodEnv*"], multinameIndexTypes, mosttypes])
    gen_stubs("abcOP_istypelate", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_astypelate", [mosttypes, ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_applytype", [mosttypes, ["MethodEnv*"], mosttypes, argdesctypes, ["..."]])

    gen_stubs("abcOP_typeof", [["String*", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_instanceof", [mosttypes, ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_in", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_coerce", [mosttypes, ["MethodEnv*"], ["Traits**"], mosttypes])
    gen_stubs("abcOP_coerce_s", [["String*", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_coerce_a", [["LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_coerce_o", [["LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_nullcheck", [["void"], ["MethodEnv*"], mosttypes + ["AbcEnv*"]])

    gen_stubs("abcOP_convert_o", [["ScriptObject*", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_convert_b", [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_convert_i", [["int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_convert_u", [["uint32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_convert_s", [["String*", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_convert_d", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_convert_ns", [["Namespace*", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_loadstring", [["String*", "LLVMAtom"], ["MethodEnv*"], ["uint32_t"]])
    gen_stubs("abcOP_loadnamespace", [["ScriptObject*", "Namespace*", "LLVMAtom"], ["MethodEnv*"], ["uint32_t"]])

    gen_stubs("abcOP_loadundefined", [mosttypes, ["MethodEnv*"]])
    gen_stubs("abcOP_loadnull", [mosttypes, ["MethodEnv*"]])
    gen_stubs("abcOP_loadnan", [mosttypes, ["MethodEnv*"]])
    gen_stubs("abcOP_loadtrue", [mosttypes, ["MethodEnv*"]])
    gen_stubs("abcOP_loadfalse", [mosttypes, ["MethodEnv*"]])

    gen_stubs("abcOP_setcallee", [["void"], ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_getslot", [mosttypes, ["MethodEnv*"], ["char*"], ["ScriptObject*"]])
    gen_stubs("abcOP_setslot", [["void"], ["MethodEnv*"], ["char*"], ["ScriptObject*"], mosttypes])

    gen_stubs("abcOP_getslot_nonc", [mosttypes, ["MethodEnv*"], ["char*"], ["ScriptObject*"]])
    gen_stubs("abcOP_setslot_nonc", [["void"], ["MethodEnv*"], ["char*"], ["ScriptObject*"], mosttypes])

    gen_stubs("abcOP_pushscope", [["void"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_pushwith", [["void"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_newactivation", [objecttypes, ["MethodEnv*"]])
    gen_stubs("abcOP_newobject", [objecttypes, ["MethodEnv*"], argdesctypes, ["..."]])
    gen_stubs("abcOP_newarray", [objecttypes, ["MethodEnv*"], argdesctypes, ["..."]])
    gen_stubs("abcOP_newcatch", [objecttypes, ["MethodEnv*"], ["int32_t"], ["char*"]])
    gen_stubs("abcOP_newfunction",
              [objecttypes, ["MethodEnv*"], ["Traits**"], ["Traits***"], ["uint32_t"], ["uint32_t"], ["LLVMAtom*"],
               ["uint32_t"]])
    gen_stubs("abcOP_newclass",
              [objecttypes, ["MethodEnv*"], ["Traits**"], ["Traits**"], ["Traits***"], ["uint32_t"], ["uint32_t"],
               ["LLVMAtom*"], ["ScriptObject*"], ["uint32_t"]])

    gen_stubs("abcOP_throw", [["void"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_xarg", [mosttypes, ["MethodEnv*"], ["ExceptionFrame*"]])

    gen_stubs("abcOP_hasnext", [["LLVMBool", "int32_t", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_hasnext2",
              [["LLVMBool", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes, ["int32_t*"], ["LLVMAtom*"]])
    gen_stubs("abcOP_nextname", [mosttypes, ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_nextvalue", [mosttypes, ["MethodEnv*"], mosttypes, mosttypes])

    gen_stubs("abcOP_dxnslate", [["void"], ["MethodEnv*"], ["AOTMethodFrame*"], mosttypes])

    gen_stubs("abcOP_checkfilter", [["void"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_esc_xattr", [["String*", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_esc_xelem", [["String*", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    gen_stubs("abcOP_upcast", [mosttypes, ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_getouterscope", [["ScriptObject*"], ["MethodEnv*"], ["uint32_t"]])

    # math functions
    gen_stubs("abcOP_Math_abs", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_acos", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_asin", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_atan", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_atan2", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_Math_ceil", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_cos", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_exp", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_floor", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_log", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_pow", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes, mosttypes])
    gen_stubs("abcOP_Math_round", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_sin", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_sqrt", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])
    gen_stubs("abcOP_Math_tan", [["double", "LLVMAtom"], ["MethodEnv*"], mosttypes])

    # string functions
    gen_stubs("abcOP_String_charAt", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_charAt", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"]])
    gen_stubs("abcOP_String_charCodeAt", [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_charCodeAt", [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"]])
    gen_stubs("abcOP_String_concat",
              [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], ["LLVMAtom"], ["int32_t"], ["ArrayObject*"]])
    gen_stubs("abcOP_String_fromCharCode",
              [["String*", "LLVMAtom"], ["MethodEnv*"], ["LLVMAtom"], ["int32_t"], ["ArrayObject*"]])
    gen_stubs("abcOP_String_indexOf",
              [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_indexOf", [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_lastIndexOf",
              [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_lastIndexOf", [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_localeCompare", [["int32_t", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_match", [["ArrayObject*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_replace", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_search", [["int32_t", "double", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_slice", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_slice", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_split", [["ArrayObject*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_split", [["ArrayObject*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_substr", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_substr", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_substring", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes, mosttypes])
    gen_stubs("abcOP_String_substring", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"], mosttypes])
    gen_stubs("abcOP_String_toLowerCase", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"]])
    gen_stubs("abcOP_String_toUpperCase", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"]])
    gen_stubs("abcOP_String_toLocaleLowerCase", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"]])
    gen_stubs("abcOP_String_toLocaleUpperCase", [["String*", "LLVMAtom"], ["MethodEnv*"], ["String*"]])

    # support for numstubheaders
    numstubheaders = int(opts.numstubheaders)
    stubmax = len(stubs) / int(opts.numstubheaders)
    if (len(stubs) % int(opts.numstubheaders)) == 0:
        stubmax = stubmax - 1

    gen_cpp_files(stubs, 0)
