/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

// var SECTION = "6.10";
// var VERSION = "AS3";
// var TITLE   = "The binary logical operators augmented by float values";


var neg_onef: float = -1
f;
var zerof: float = 0
f;
var onef: float = 1
f;
var ninef: float = 9
f;
var tenf: float = 10
f;

AddStrictTestCase("void 0 && 1f", undefined, void 0 && onef);
AddStrictTestCase("void 0 && 1f FloatLiteral", undefined, void 0 && 1
f
)

AddStrictTestCase("null && 1f", null, null && onef);
AddStrictTestCase("null && 1f FloatLiteral", null, null && 1
f
)

AddStrictTestCase("1f && void 0", undefined, onef && void 0);
AddStrictTestCase("1f FloatLiteral && void 0", undefined, 1
f && void 0
)

AddStrictTestCase("1f && null", null, onef && null);
AddStrictTestCase("1f FloatLiteral && null", null, 1
f && null
)


AddStrictTestCase("0f && 0f", 0
f, zerof && zerof
)

AddStrictTestCase("0f FloatLiteral && 0f FloatLiteral", 0
f, 0
f && 0
f
)

AddStrictTestCase("1f && 1f", 1
f, onef && onef
)

AddStrictTestCase("1f FloatLiteral && 1f FloatLiteral", 1
f, 1
f && 1
f
)

AddStrictTestCase("-1f && -1f", -1
f, neg_onef && neg_onef
)

AddStrictTestCase("-1f FloatLiteral && -1f FloatLiteral", -1
f, -1
f && -1
f
)


AddStrictTestCase("10f && 9f", 9
f, tenf && ninef
)

AddStrictTestCase("10f FloatLiteral && 9f FloatLiteral", 9
f, 10
f && 9
f
)



AddStrictTestCase("0f && true", 0
f, zerof && true
)

AddStrictTestCase("0f FloatLiteral && true", 0
f, 0
f && true
)

AddStrictTestCase("true && 0f", 0
f, true && zerof
)

AddStrictTestCase("true && 0f FloatLiteral", 0
f, true && 0
f
)

AddStrictTestCase("true && 1f", 1
f, true && onef
)

AddStrictTestCase("true && 1f FloatLiteral", 1
f, true && 1
f
)

AddStrictTestCase("1f && true", true, onef && true);
AddStrictTestCase("1f FloatLiteral && true", true, 1
f && true
)

AddStrictTestCase("-1f && true", true, neg_onef && true);
AddStrictTestCase("-1f FloatLiteral && true", true, -1
f && true
)

AddStrictTestCase("true && -1f", -1
f, true && neg_onef
)

AddStrictTestCase("true && -1f FloatLiteral", -1
f, true && -1
f
)

AddStrictTestCase("true && 10f", 10
f, true && tenf
)

AddStrictTestCase("true && 10f FloatLiteral", 10
f, true && 10
f
)

AddStrictTestCase("10f && true", true, tenf && true);
AddStrictTestCase("10f FloatLiteral && true", true, 10
f && true
)

AddStrictTestCase("-1f && true", true, neg_onef && true);
AddStrictTestCase("-1f FloatLiteral && true", true, -1
f && true
)

AddStrictTestCase("true && float.POSITIVE_INFINITY", float.POSITIVE_INFINITY, true && float.POSITIVE_INFINITY);
AddStrictTestCase("float.NEGATIVE_INFINITY && true", true, float.NEGATIVE_INFINITY && true);
Assert.expectEq("float.NaN && float.NaN", float.NaN, float.NaN && float.NaN);
Assert.expectEq("float.NaN && 0f", float.NaN, float.NaN && 0
f
)

Assert.expectEq("0f && float.NaN", 0
f, 0
f && float.NaN
)

Assert.expectEq("flaot.NaN && float.POSITIVE_INFINITY", float.NaN, float.NaN && float.POSITIVE_INFINITY);
Assert.expectEq("float.POSITIVE_INFINITY && float.NaN", float.NaN, float.POSITIVE_INFINITY && float.NaN);


AddStrictTestCase("void 0 || 1f", 1
f, void 0 || onef
)

AddStrictTestCase("void 0 || 1f FloatLiteral", 1
f, void 0 || 1
f
)

AddStrictTestCase("null || 1f", 1
f, null || onef
)

AddStrictTestCase("null || 1f FloatLiteral", 1
f, null || 1
f
)

AddStrictTestCase("1f || void 0", 1
f, onef || void 0
)

AddStrictTestCase("1f FloatLiteral || void 0", 1
f, 1
f || void 0
)

AddStrictTestCase("1f || null", 1
f, onef || null
)

AddStrictTestCase("1f FloatLiteral || null", 1
f, 1
f || null
)


AddStrictTestCase("0f || 0f", 0
f, zerof || zerof
)

AddStrictTestCase("0f FloatLiteral || 0f FloatLiteral", 0
f, 0
f || 0
f
)

AddStrictTestCase("1f || 1f", 1
f, onef || onef
)

AddStrictTestCase("1f FloatLiteral || 1f FloatLiteral", 1
f, 1
f || 1
f
)

AddStrictTestCase("-1f || -1f", -1
f, neg_onef || neg_onef
)

AddStrictTestCase("-1f FloatLiteral || -1f FloatLiteral", -1
f, -1
f || -1
f
)


AddStrictTestCase("10f || 9f", 10
f, tenf || ninef
)

AddStrictTestCase("10f FloatLiteral || 9f FloatLiteral", 10
f, 10
f || 9
f
)



AddStrictTestCase("1f || true", 1
f, onef || true
)

AddStrictTestCase("1f FloatLiteral || true", 1
f, 1
f || true
)

AddStrictTestCase("0f || true", true, zerof || true);
AddStrictTestCase("0f FloatLiteral || true", true, 0
f || true
)

AddStrictTestCase("true || 0f", true, true || zerof);
AddStrictTestCase("true || 0f FloatLiteral", true, true || 0
f
)

AddStrictTestCase("true || 1f", true, true || onef);
AddStrictTestCase("true || 1f FloatLiteral", true, true || 1
f
)

AddStrictTestCase("1f || true", 1
f, onef || true
)

AddStrictTestCase("1f FloatLiteral || true", 1
f, 1
f || true
)

AddStrictTestCase("-1f || true", -1
f, neg_onef || true
)

AddStrictTestCase("-1f FloatLiteral || true", -1
f, -1
f || true
)

AddStrictTestCase("true || -1f", true, true || neg_onef);
AddStrictTestCase("true || -1f FloatLiteral", true, true || -1
f
)

AddStrictTestCase("true || 10f", true, true || tenf);
AddStrictTestCase("true || 10f FloatLiteral", true, true || 10
f
)

AddStrictTestCase("10f || true", 10
f, tenf || true
)

AddStrictTestCase("10f FloatLiteral || true", 10
f, 10
f || true
)

AddStrictTestCase("-1f || true", -1
f, neg_onef || true
)

AddStrictTestCase("-1f FloatLiteral || true", -1
f, -1
f || true
)

AddStrictTestCase("true || float.POSITIVE_INFINITY", true, true || float.POSITIVE_INFINITY);
AddStrictTestCase("float.NEGATIVE_INFINITY || true", float.NEGATIVE_INFINITY, float.NEGATIVE_INFINITY || true);
AddStrictTestCase("float.NaN || float.NaN", float.NaN, float.NaN || float.NaN);
AddStrictTestCase("float.NaN || 0f", 0
f, float.NaN || 0
f
)

AddStrictTestCase("0f || float.NaN", float.NaN, 0
f || float.NaN
)

AddStrictTestCase("flaot.NaN || float.POSITIVE_INFINITY", float.POSITIVE_INFINITY, float.NaN || float.POSITIVE_INFINITY);
AddStrictTestCase("float.POSITIVE_INFINITY || float.NaN", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY || float.NaN);

