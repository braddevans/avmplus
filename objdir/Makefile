topsrcdir=..
HOST_OS=linux
TARGET_OS=linux
TARGET_CPU=x86_64
I_SUFFIX=i
II_SUFFIX=ii
OBJ_SUFFIX=o
PCH_SUFFIX=gch
LIB_PREFIX=lib
LIB_SUFFIX=a
DLL_SUFFIX=so
PROGRAM_SUFFIX=
USE_COMPILER_DEPS=1
USE_GCC_PRECOMPILED_HEADERS=1
EXPAND_LIBNAME=-l$(1)
EXPAND_DLLNAME=-l$(1)
OUTOPTION=-o 
LIBPATH=-L
MASM=ml64.exe -nologo -c 
CPPFLAGS=
CXX=g++
CXXFLAGS=
CC=gcc
CFLAGS=
DLL_CFLAGS=-fPIC
LD=ar
LDFLAGS=
AR=ar
MKSTATICLIB=$(AR) cr $(1)
MKDLL=$(CXX) -shared -o $(1)
MKPROGRAM=$(CXX) -o $(1)
COMPILER=GCC
ENABLE_TAMARIN=1
ENABLE_SHELL=1
BUILTIN_BUILDFLAGS=-config CONFIG::VMCFG_FLOAT=false
AVMPLUS_DESC=
APP_CPPFLAGS=-DAVMSHELL_BUILD -I$(topsrcdir)/other-licenses -DAVMFEATURE_HALFMOON_AOT_RUNTIME=0 -DAVMFEATURE_HALFMOON_AOT_COMPILER=0 -DAVMPLUS_DESC="${AVMPLUS_DESC}" -DUNIX -DAVMPLUS_UNIX 
APP_CXXFLAGS=-Wall -Wcast-align -Wdisabled-optimization -Wextra -Wformat=2 -Winit-self -Winvalid-pch -Wno-invalid-offsetof -Wno-switch -Wparentheses -Wpointer-arith -Wreorder -Wsign-compare -Wunused-parameter -Wwrite-strings -Wno-ctor-dtor-privacy -Wno-unused-local-typedefs -Woverloaded-virtual -Wsign-promo -Wno-char-subscripts -fmessage-length=0 -fno-exceptions -fsigned-char  -Wall -Wcast-align -Wdisabled-optimization -Wextra -Wformat=2 -Winit-self -Winvalid-pch -Wno-invalid-offsetof -Wno-switch -Wparentheses -Wpointer-arith -Wreorder -Wsign-compare -Wunused-parameter -Wwrite-strings -Wno-ctor-dtor-privacy -Wno-unused-local-typedefs -Woverloaded-virtual -Wsign-promo -Wno-char-subscripts -fmessage-length=0 -fno-exceptions -fsigned-char  -Wstrict-null-sentinel -Wno-narrowing -Wempty-body -Wno-logical-op -Wmissing-field-initializers -Wstrict-aliasing=3 -Wno-array-bounds -Wno-clobbered -Wstrict-overflow=0 -funit-at-a-time  -fno-check-new -fno-rtti -fstrict-aliasing -Wuninitialized 
APP_CFLAGS=
OPT_CPPFLAGS=
OPT_CXXFLAGS=-O3 
DEBUG_CPPFLAGS=-DDEBUG -D_DEBUG 
DEBUG_CXXFLAGS=-g 
DEBUG_LDFLAGS=-g 
OS_LIBS=pthread
OS_LDFLAGS=
MMGC_CPPFLAGS=-DAVMSHELL_BUILD 
AVMSHELL_CPPFLAGS=
AVMSHELL_LDFLAGS=$(call EXPAND_LIBNAME,zlib) $(call EXPAND_LIBNAME,lzma)
MMGC_DYNAMIC=


include $(topsrcdir)/build/config.mk
include $(topsrcdir)/manifest.mk
include $(topsrcdir)/build/rules.mk
