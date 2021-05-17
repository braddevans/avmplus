/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

// var SECTION = "4.6.3";
// var VERSION = "AS3";
// var TITLE   = "Component accesses";


var flt4: float4 = new float4(0
f, 1
f, 2
f, 3
f
)



var component: Array = ['x', 'y', 'z', 'w'];
var input: String = "";
var output: String = "";
for (var levelA in component) {
    for (var levelB in component) {
        for (var levelC in component) {
            for (var levelD in component) {
                output = "new float4(" + levelA + "f, " + levelB + "f, " + levelC + "f, " + levelD + "f)";
                input = component[levelA] + "" + component[levelB] + "" + component[levelC] + "" + component[levelD];
                AddStrictTestCase("float4['" + input + "'] as a getter", new float4(float(levelA), float(levelB), float(levelC), float(levelD)), flt4[input]);
                // Use this code to regenerate all of the Assert.expectEq() calls below if necessary
                //print('AddStrictTestCase("float4.'+input+' as a getter", '+output+', flt4.'+input+');')
            }
        }
    }
}

AddStrictTestCase("float4.xxxx as a getter", new float4(0
f, 0
f, 0
f, 0
f
),
flt4.xxxx
)

AddStrictTestCase("float4.xxxy as a getter", new float4(0
f, 0
f, 0
f, 1
f
),
flt4.xxxy
)

AddStrictTestCase("float4.xxxz as a getter", new float4(0
f, 0
f, 0
f, 2
f
),
flt4.xxxz
)

AddStrictTestCase("float4.xxxw as a getter", new float4(0
f, 0
f, 0
f, 3
f
),
flt4.xxxw
)

AddStrictTestCase("float4.xxyx as a getter", new float4(0
f, 0
f, 1
f, 0
f
),
flt4.xxyx
)

AddStrictTestCase("float4.xxyy as a getter", new float4(0
f, 0
f, 1
f, 1
f
),
flt4.xxyy
)

AddStrictTestCase("float4.xxyz as a getter", new float4(0
f, 0
f, 1
f, 2
f
),
flt4.xxyz
)

AddStrictTestCase("float4.xxyw as a getter", new float4(0
f, 0
f, 1
f, 3
f
),
flt4.xxyw
)

AddStrictTestCase("float4.xxzx as a getter", new float4(0
f, 0
f, 2
f, 0
f
),
flt4.xxzx
)

AddStrictTestCase("float4.xxzy as a getter", new float4(0
f, 0
f, 2
f, 1
f
),
flt4.xxzy
)

AddStrictTestCase("float4.xxzz as a getter", new float4(0
f, 0
f, 2
f, 2
f
),
flt4.xxzz
)

AddStrictTestCase("float4.xxzw as a getter", new float4(0
f, 0
f, 2
f, 3
f
),
flt4.xxzw
)

AddStrictTestCase("float4.xxwx as a getter", new float4(0
f, 0
f, 3
f, 0
f
),
flt4.xxwx
)

AddStrictTestCase("float4.xxwy as a getter", new float4(0
f, 0
f, 3
f, 1
f
),
flt4.xxwy
)

AddStrictTestCase("float4.xxwz as a getter", new float4(0
f, 0
f, 3
f, 2
f
),
flt4.xxwz
)

AddStrictTestCase("float4.xxww as a getter", new float4(0
f, 0
f, 3
f, 3
f
),
flt4.xxww
)

AddStrictTestCase("float4.xyxx as a getter", new float4(0
f, 1
f, 0
f, 0
f
),
flt4.xyxx
)

AddStrictTestCase("float4.xyxy as a getter", new float4(0
f, 1
f, 0
f, 1
f
),
flt4.xyxy
)

AddStrictTestCase("float4.xyxz as a getter", new float4(0
f, 1
f, 0
f, 2
f
),
flt4.xyxz
)

AddStrictTestCase("float4.xyxw as a getter", new float4(0
f, 1
f, 0
f, 3
f
),
flt4.xyxw
)

AddStrictTestCase("float4.xyyx as a getter", new float4(0
f, 1
f, 1
f, 0
f
),
flt4.xyyx
)

AddStrictTestCase("float4.xyyy as a getter", new float4(0
f, 1
f, 1
f, 1
f
),
flt4.xyyy
)

AddStrictTestCase("float4.xyyz as a getter", new float4(0
f, 1
f, 1
f, 2
f
),
flt4.xyyz
)

AddStrictTestCase("float4.xyyw as a getter", new float4(0
f, 1
f, 1
f, 3
f
),
flt4.xyyw
)

AddStrictTestCase("float4.xyzx as a getter", new float4(0
f, 1
f, 2
f, 0
f
),
flt4.xyzx
)

AddStrictTestCase("float4.xyzy as a getter", new float4(0
f, 1
f, 2
f, 1
f
),
flt4.xyzy
)

AddStrictTestCase("float4.xyzz as a getter", new float4(0
f, 1
f, 2
f, 2
f
),
flt4.xyzz
)

AddStrictTestCase("float4.xyzw as a getter", new float4(0
f, 1
f, 2
f, 3
f
),
flt4.xyzw
)

AddStrictTestCase("float4.xywx as a getter", new float4(0
f, 1
f, 3
f, 0
f
),
flt4.xywx
)

AddStrictTestCase("float4.xywy as a getter", new float4(0
f, 1
f, 3
f, 1
f
),
flt4.xywy
)

AddStrictTestCase("float4.xywz as a getter", new float4(0
f, 1
f, 3
f, 2
f
),
flt4.xywz
)

AddStrictTestCase("float4.xyww as a getter", new float4(0
f, 1
f, 3
f, 3
f
),
flt4.xyww
)

AddStrictTestCase("float4.xzxx as a getter", new float4(0
f, 2
f, 0
f, 0
f
),
flt4.xzxx
)

AddStrictTestCase("float4.xzxy as a getter", new float4(0
f, 2
f, 0
f, 1
f
),
flt4.xzxy
)

AddStrictTestCase("float4.xzxz as a getter", new float4(0
f, 2
f, 0
f, 2
f
),
flt4.xzxz
)

AddStrictTestCase("float4.xzxw as a getter", new float4(0
f, 2
f, 0
f, 3
f
),
flt4.xzxw
)

AddStrictTestCase("float4.xzyx as a getter", new float4(0
f, 2
f, 1
f, 0
f
),
flt4.xzyx
)

AddStrictTestCase("float4.xzyy as a getter", new float4(0
f, 2
f, 1
f, 1
f
),
flt4.xzyy
)

AddStrictTestCase("float4.xzyz as a getter", new float4(0
f, 2
f, 1
f, 2
f
),
flt4.xzyz
)

AddStrictTestCase("float4.xzyw as a getter", new float4(0
f, 2
f, 1
f, 3
f
),
flt4.xzyw
)

AddStrictTestCase("float4.xzzx as a getter", new float4(0
f, 2
f, 2
f, 0
f
),
flt4.xzzx
)

AddStrictTestCase("float4.xzzy as a getter", new float4(0
f, 2
f, 2
f, 1
f
),
flt4.xzzy
)

AddStrictTestCase("float4.xzzz as a getter", new float4(0
f, 2
f, 2
f, 2
f
),
flt4.xzzz
)

AddStrictTestCase("float4.xzzw as a getter", new float4(0
f, 2
f, 2
f, 3
f
),
flt4.xzzw
)

AddStrictTestCase("float4.xzwx as a getter", new float4(0
f, 2
f, 3
f, 0
f
),
flt4.xzwx
)

AddStrictTestCase("float4.xzwy as a getter", new float4(0
f, 2
f, 3
f, 1
f
),
flt4.xzwy
)

AddStrictTestCase("float4.xzwz as a getter", new float4(0
f, 2
f, 3
f, 2
f
),
flt4.xzwz
)

AddStrictTestCase("float4.xzww as a getter", new float4(0
f, 2
f, 3
f, 3
f
),
flt4.xzww
)

AddStrictTestCase("float4.xwxx as a getter", new float4(0
f, 3
f, 0
f, 0
f
),
flt4.xwxx
)

AddStrictTestCase("float4.xwxy as a getter", new float4(0
f, 3
f, 0
f, 1
f
),
flt4.xwxy
)

AddStrictTestCase("float4.xwxz as a getter", new float4(0
f, 3
f, 0
f, 2
f
),
flt4.xwxz
)

AddStrictTestCase("float4.xwxw as a getter", new float4(0
f, 3
f, 0
f, 3
f
),
flt4.xwxw
)

AddStrictTestCase("float4.xwyx as a getter", new float4(0
f, 3
f, 1
f, 0
f
),
flt4.xwyx
)

AddStrictTestCase("float4.xwyy as a getter", new float4(0
f, 3
f, 1
f, 1
f
),
flt4.xwyy
)

AddStrictTestCase("float4.xwyz as a getter", new float4(0
f, 3
f, 1
f, 2
f
),
flt4.xwyz
)

AddStrictTestCase("float4.xwyw as a getter", new float4(0
f, 3
f, 1
f, 3
f
),
flt4.xwyw
)

AddStrictTestCase("float4.xwzx as a getter", new float4(0
f, 3
f, 2
f, 0
f
),
flt4.xwzx
)

AddStrictTestCase("float4.xwzy as a getter", new float4(0
f, 3
f, 2
f, 1
f
),
flt4.xwzy
)

AddStrictTestCase("float4.xwzz as a getter", new float4(0
f, 3
f, 2
f, 2
f
),
flt4.xwzz
)

AddStrictTestCase("float4.xwzw as a getter", new float4(0
f, 3
f, 2
f, 3
f
),
flt4.xwzw
)

AddStrictTestCase("float4.xwwx as a getter", new float4(0
f, 3
f, 3
f, 0
f
),
flt4.xwwx
)

AddStrictTestCase("float4.xwwy as a getter", new float4(0
f, 3
f, 3
f, 1
f
),
flt4.xwwy
)

AddStrictTestCase("float4.xwwz as a getter", new float4(0
f, 3
f, 3
f, 2
f
),
flt4.xwwz
)

AddStrictTestCase("float4.xwww as a getter", new float4(0
f, 3
f, 3
f, 3
f
),
flt4.xwww
)

AddStrictTestCase("float4.yxxx as a getter", new float4(1
f, 0
f, 0
f, 0
f
),
flt4.yxxx
)

AddStrictTestCase("float4.yxxy as a getter", new float4(1
f, 0
f, 0
f, 1
f
),
flt4.yxxy
)

AddStrictTestCase("float4.yxxz as a getter", new float4(1
f, 0
f, 0
f, 2
f
),
flt4.yxxz
)

AddStrictTestCase("float4.yxxw as a getter", new float4(1
f, 0
f, 0
f, 3
f
),
flt4.yxxw
)

AddStrictTestCase("float4.yxyx as a getter", new float4(1
f, 0
f, 1
f, 0
f
),
flt4.yxyx
)

AddStrictTestCase("float4.yxyy as a getter", new float4(1
f, 0
f, 1
f, 1
f
),
flt4.yxyy
)

AddStrictTestCase("float4.yxyz as a getter", new float4(1
f, 0
f, 1
f, 2
f
),
flt4.yxyz
)

AddStrictTestCase("float4.yxyw as a getter", new float4(1
f, 0
f, 1
f, 3
f
),
flt4.yxyw
)

AddStrictTestCase("float4.yxzx as a getter", new float4(1
f, 0
f, 2
f, 0
f
),
flt4.yxzx
)

AddStrictTestCase("float4.yxzy as a getter", new float4(1
f, 0
f, 2
f, 1
f
),
flt4.yxzy
)

AddStrictTestCase("float4.yxzz as a getter", new float4(1
f, 0
f, 2
f, 2
f
),
flt4.yxzz
)

AddStrictTestCase("float4.yxzw as a getter", new float4(1
f, 0
f, 2
f, 3
f
),
flt4.yxzw
)

AddStrictTestCase("float4.yxwx as a getter", new float4(1
f, 0
f, 3
f, 0
f
),
flt4.yxwx
)

AddStrictTestCase("float4.yxwy as a getter", new float4(1
f, 0
f, 3
f, 1
f
),
flt4.yxwy
)

AddStrictTestCase("float4.yxwz as a getter", new float4(1
f, 0
f, 3
f, 2
f
),
flt4.yxwz
)

AddStrictTestCase("float4.yxww as a getter", new float4(1
f, 0
f, 3
f, 3
f
),
flt4.yxww
)

AddStrictTestCase("float4.yyxx as a getter", new float4(1
f, 1
f, 0
f, 0
f
),
flt4.yyxx
)

AddStrictTestCase("float4.yyxy as a getter", new float4(1
f, 1
f, 0
f, 1
f
),
flt4.yyxy
)

AddStrictTestCase("float4.yyxz as a getter", new float4(1
f, 1
f, 0
f, 2
f
),
flt4.yyxz
)

AddStrictTestCase("float4.yyxw as a getter", new float4(1
f, 1
f, 0
f, 3
f
),
flt4.yyxw
)

AddStrictTestCase("float4.yyyx as a getter", new float4(1
f, 1
f, 1
f, 0
f
),
flt4.yyyx
)

AddStrictTestCase("float4.yyyy as a getter", new float4(1
f, 1
f, 1
f, 1
f
),
flt4.yyyy
)

AddStrictTestCase("float4.yyyz as a getter", new float4(1
f, 1
f, 1
f, 2
f
),
flt4.yyyz
)

AddStrictTestCase("float4.yyyw as a getter", new float4(1
f, 1
f, 1
f, 3
f
),
flt4.yyyw
)

AddStrictTestCase("float4.yyzx as a getter", new float4(1
f, 1
f, 2
f, 0
f
),
flt4.yyzx
)

AddStrictTestCase("float4.yyzy as a getter", new float4(1
f, 1
f, 2
f, 1
f
),
flt4.yyzy
)

AddStrictTestCase("float4.yyzz as a getter", new float4(1
f, 1
f, 2
f, 2
f
),
flt4.yyzz
)

AddStrictTestCase("float4.yyzw as a getter", new float4(1
f, 1
f, 2
f, 3
f
),
flt4.yyzw
)

AddStrictTestCase("float4.yywx as a getter", new float4(1
f, 1
f, 3
f, 0
f
),
flt4.yywx
)

AddStrictTestCase("float4.yywy as a getter", new float4(1
f, 1
f, 3
f, 1
f
),
flt4.yywy
)

AddStrictTestCase("float4.yywz as a getter", new float4(1
f, 1
f, 3
f, 2
f
),
flt4.yywz
)

AddStrictTestCase("float4.yyww as a getter", new float4(1
f, 1
f, 3
f, 3
f
),
flt4.yyww
)

AddStrictTestCase("float4.yzxx as a getter", new float4(1
f, 2
f, 0
f, 0
f
),
flt4.yzxx
)

AddStrictTestCase("float4.yzxy as a getter", new float4(1
f, 2
f, 0
f, 1
f
),
flt4.yzxy
)

AddStrictTestCase("float4.yzxz as a getter", new float4(1
f, 2
f, 0
f, 2
f
),
flt4.yzxz
)

AddStrictTestCase("float4.yzxw as a getter", new float4(1
f, 2
f, 0
f, 3
f
),
flt4.yzxw
)

AddStrictTestCase("float4.yzyx as a getter", new float4(1
f, 2
f, 1
f, 0
f
),
flt4.yzyx
)

AddStrictTestCase("float4.yzyy as a getter", new float4(1
f, 2
f, 1
f, 1
f
),
flt4.yzyy
)

AddStrictTestCase("float4.yzyz as a getter", new float4(1
f, 2
f, 1
f, 2
f
),
flt4.yzyz
)

AddStrictTestCase("float4.yzyw as a getter", new float4(1
f, 2
f, 1
f, 3
f
),
flt4.yzyw
)

AddStrictTestCase("float4.yzzx as a getter", new float4(1
f, 2
f, 2
f, 0
f
),
flt4.yzzx
)

AddStrictTestCase("float4.yzzy as a getter", new float4(1
f, 2
f, 2
f, 1
f
),
flt4.yzzy
)

AddStrictTestCase("float4.yzzz as a getter", new float4(1
f, 2
f, 2
f, 2
f
),
flt4.yzzz
)

AddStrictTestCase("float4.yzzw as a getter", new float4(1
f, 2
f, 2
f, 3
f
),
flt4.yzzw
)

AddStrictTestCase("float4.yzwx as a getter", new float4(1
f, 2
f, 3
f, 0
f
),
flt4.yzwx
)

AddStrictTestCase("float4.yzwy as a getter", new float4(1
f, 2
f, 3
f, 1
f
),
flt4.yzwy
)

AddStrictTestCase("float4.yzwz as a getter", new float4(1
f, 2
f, 3
f, 2
f
),
flt4.yzwz
)

AddStrictTestCase("float4.yzww as a getter", new float4(1
f, 2
f, 3
f, 3
f
),
flt4.yzww
)

AddStrictTestCase("float4.ywxx as a getter", new float4(1
f, 3
f, 0
f, 0
f
),
flt4.ywxx
)

AddStrictTestCase("float4.ywxy as a getter", new float4(1
f, 3
f, 0
f, 1
f
),
flt4.ywxy
)

AddStrictTestCase("float4.ywxz as a getter", new float4(1
f, 3
f, 0
f, 2
f
),
flt4.ywxz
)

AddStrictTestCase("float4.ywxw as a getter", new float4(1
f, 3
f, 0
f, 3
f
),
flt4.ywxw
)

AddStrictTestCase("float4.ywyx as a getter", new float4(1
f, 3
f, 1
f, 0
f
),
flt4.ywyx
)

AddStrictTestCase("float4.ywyy as a getter", new float4(1
f, 3
f, 1
f, 1
f
),
flt4.ywyy
)

AddStrictTestCase("float4.ywyz as a getter", new float4(1
f, 3
f, 1
f, 2
f
),
flt4.ywyz
)

AddStrictTestCase("float4.ywyw as a getter", new float4(1
f, 3
f, 1
f, 3
f
),
flt4.ywyw
)

AddStrictTestCase("float4.ywzx as a getter", new float4(1
f, 3
f, 2
f, 0
f
),
flt4.ywzx
)

AddStrictTestCase("float4.ywzy as a getter", new float4(1
f, 3
f, 2
f, 1
f
),
flt4.ywzy
)

AddStrictTestCase("float4.ywzz as a getter", new float4(1
f, 3
f, 2
f, 2
f
),
flt4.ywzz
)

AddStrictTestCase("float4.ywzw as a getter", new float4(1
f, 3
f, 2
f, 3
f
),
flt4.ywzw
)

AddStrictTestCase("float4.ywwx as a getter", new float4(1
f, 3
f, 3
f, 0
f
),
flt4.ywwx
)

AddStrictTestCase("float4.ywwy as a getter", new float4(1
f, 3
f, 3
f, 1
f
),
flt4.ywwy
)

AddStrictTestCase("float4.ywwz as a getter", new float4(1
f, 3
f, 3
f, 2
f
),
flt4.ywwz
)

AddStrictTestCase("float4.ywww as a getter", new float4(1
f, 3
f, 3
f, 3
f
),
flt4.ywww
)

AddStrictTestCase("float4.zxxx as a getter", new float4(2
f, 0
f, 0
f, 0
f
),
flt4.zxxx
)

AddStrictTestCase("float4.zxxy as a getter", new float4(2
f, 0
f, 0
f, 1
f
),
flt4.zxxy
)

AddStrictTestCase("float4.zxxz as a getter", new float4(2
f, 0
f, 0
f, 2
f
),
flt4.zxxz
)

AddStrictTestCase("float4.zxxw as a getter", new float4(2
f, 0
f, 0
f, 3
f
),
flt4.zxxw
)

AddStrictTestCase("float4.zxyx as a getter", new float4(2
f, 0
f, 1
f, 0
f
),
flt4.zxyx
)

AddStrictTestCase("float4.zxyy as a getter", new float4(2
f, 0
f, 1
f, 1
f
),
flt4.zxyy
)

AddStrictTestCase("float4.zxyz as a getter", new float4(2
f, 0
f, 1
f, 2
f
),
flt4.zxyz
)

AddStrictTestCase("float4.zxyw as a getter", new float4(2
f, 0
f, 1
f, 3
f
),
flt4.zxyw
)

AddStrictTestCase("float4.zxzx as a getter", new float4(2
f, 0
f, 2
f, 0
f
),
flt4.zxzx
)

AddStrictTestCase("float4.zxzy as a getter", new float4(2
f, 0
f, 2
f, 1
f
),
flt4.zxzy
)

AddStrictTestCase("float4.zxzz as a getter", new float4(2
f, 0
f, 2
f, 2
f
),
flt4.zxzz
)

AddStrictTestCase("float4.zxzw as a getter", new float4(2
f, 0
f, 2
f, 3
f
),
flt4.zxzw
)

AddStrictTestCase("float4.zxwx as a getter", new float4(2
f, 0
f, 3
f, 0
f
),
flt4.zxwx
)

AddStrictTestCase("float4.zxwy as a getter", new float4(2
f, 0
f, 3
f, 1
f
),
flt4.zxwy
)

AddStrictTestCase("float4.zxwz as a getter", new float4(2
f, 0
f, 3
f, 2
f
),
flt4.zxwz
)

AddStrictTestCase("float4.zxww as a getter", new float4(2
f, 0
f, 3
f, 3
f
),
flt4.zxww
)

AddStrictTestCase("float4.zyxx as a getter", new float4(2
f, 1
f, 0
f, 0
f
),
flt4.zyxx
)

AddStrictTestCase("float4.zyxy as a getter", new float4(2
f, 1
f, 0
f, 1
f
),
flt4.zyxy
)

AddStrictTestCase("float4.zyxz as a getter", new float4(2
f, 1
f, 0
f, 2
f
),
flt4.zyxz
)

AddStrictTestCase("float4.zyxw as a getter", new float4(2
f, 1
f, 0
f, 3
f
),
flt4.zyxw
)

AddStrictTestCase("float4.zyyx as a getter", new float4(2
f, 1
f, 1
f, 0
f
),
flt4.zyyx
)

AddStrictTestCase("float4.zyyy as a getter", new float4(2
f, 1
f, 1
f, 1
f
),
flt4.zyyy
)

AddStrictTestCase("float4.zyyz as a getter", new float4(2
f, 1
f, 1
f, 2
f
),
flt4.zyyz
)

AddStrictTestCase("float4.zyyw as a getter", new float4(2
f, 1
f, 1
f, 3
f
),
flt4.zyyw
)

AddStrictTestCase("float4.zyzx as a getter", new float4(2
f, 1
f, 2
f, 0
f
),
flt4.zyzx
)

AddStrictTestCase("float4.zyzy as a getter", new float4(2
f, 1
f, 2
f, 1
f
),
flt4.zyzy
)

AddStrictTestCase("float4.zyzz as a getter", new float4(2
f, 1
f, 2
f, 2
f
),
flt4.zyzz
)

AddStrictTestCase("float4.zyzw as a getter", new float4(2
f, 1
f, 2
f, 3
f
),
flt4.zyzw
)

AddStrictTestCase("float4.zywx as a getter", new float4(2
f, 1
f, 3
f, 0
f
),
flt4.zywx
)

AddStrictTestCase("float4.zywy as a getter", new float4(2
f, 1
f, 3
f, 1
f
),
flt4.zywy
)

AddStrictTestCase("float4.zywz as a getter", new float4(2
f, 1
f, 3
f, 2
f
),
flt4.zywz
)

AddStrictTestCase("float4.zyww as a getter", new float4(2
f, 1
f, 3
f, 3
f
),
flt4.zyww
)

AddStrictTestCase("float4.zzxx as a getter", new float4(2
f, 2
f, 0
f, 0
f
),
flt4.zzxx
)

AddStrictTestCase("float4.zzxy as a getter", new float4(2
f, 2
f, 0
f, 1
f
),
flt4.zzxy
)

AddStrictTestCase("float4.zzxz as a getter", new float4(2
f, 2
f, 0
f, 2
f
),
flt4.zzxz
)

AddStrictTestCase("float4.zzxw as a getter", new float4(2
f, 2
f, 0
f, 3
f
),
flt4.zzxw
)

AddStrictTestCase("float4.zzyx as a getter", new float4(2
f, 2
f, 1
f, 0
f
),
flt4.zzyx
)

AddStrictTestCase("float4.zzyy as a getter", new float4(2
f, 2
f, 1
f, 1
f
),
flt4.zzyy
)

AddStrictTestCase("float4.zzyz as a getter", new float4(2
f, 2
f, 1
f, 2
f
),
flt4.zzyz
)

AddStrictTestCase("float4.zzyw as a getter", new float4(2
f, 2
f, 1
f, 3
f
),
flt4.zzyw
)

AddStrictTestCase("float4.zzzx as a getter", new float4(2
f, 2
f, 2
f, 0
f
),
flt4.zzzx
)

AddStrictTestCase("float4.zzzy as a getter", new float4(2
f, 2
f, 2
f, 1
f
),
flt4.zzzy
)

AddStrictTestCase("float4.zzzz as a getter", new float4(2
f, 2
f, 2
f, 2
f
),
flt4.zzzz
)

AddStrictTestCase("float4.zzzw as a getter", new float4(2
f, 2
f, 2
f, 3
f
),
flt4.zzzw
)

AddStrictTestCase("float4.zzwx as a getter", new float4(2
f, 2
f, 3
f, 0
f
),
flt4.zzwx
)

AddStrictTestCase("float4.zzwy as a getter", new float4(2
f, 2
f, 3
f, 1
f
),
flt4.zzwy
)

AddStrictTestCase("float4.zzwz as a getter", new float4(2
f, 2
f, 3
f, 2
f
),
flt4.zzwz
)

AddStrictTestCase("float4.zzww as a getter", new float4(2
f, 2
f, 3
f, 3
f
),
flt4.zzww
)

AddStrictTestCase("float4.zwxx as a getter", new float4(2
f, 3
f, 0
f, 0
f
),
flt4.zwxx
)

AddStrictTestCase("float4.zwxy as a getter", new float4(2
f, 3
f, 0
f, 1
f
),
flt4.zwxy
)

AddStrictTestCase("float4.zwxz as a getter", new float4(2
f, 3
f, 0
f, 2
f
),
flt4.zwxz
)

AddStrictTestCase("float4.zwxw as a getter", new float4(2
f, 3
f, 0
f, 3
f
),
flt4.zwxw
)

AddStrictTestCase("float4.zwyx as a getter", new float4(2
f, 3
f, 1
f, 0
f
),
flt4.zwyx
)

AddStrictTestCase("float4.zwyy as a getter", new float4(2
f, 3
f, 1
f, 1
f
),
flt4.zwyy
)

AddStrictTestCase("float4.zwyz as a getter", new float4(2
f, 3
f, 1
f, 2
f
),
flt4.zwyz
)

AddStrictTestCase("float4.zwyw as a getter", new float4(2
f, 3
f, 1
f, 3
f
),
flt4.zwyw
)

AddStrictTestCase("float4.zwzx as a getter", new float4(2
f, 3
f, 2
f, 0
f
),
flt4.zwzx
)

AddStrictTestCase("float4.zwzy as a getter", new float4(2
f, 3
f, 2
f, 1
f
),
flt4.zwzy
)

AddStrictTestCase("float4.zwzz as a getter", new float4(2
f, 3
f, 2
f, 2
f
),
flt4.zwzz
)

AddStrictTestCase("float4.zwzw as a getter", new float4(2
f, 3
f, 2
f, 3
f
),
flt4.zwzw
)

AddStrictTestCase("float4.zwwx as a getter", new float4(2
f, 3
f, 3
f, 0
f
),
flt4.zwwx
)

AddStrictTestCase("float4.zwwy as a getter", new float4(2
f, 3
f, 3
f, 1
f
),
flt4.zwwy
)

AddStrictTestCase("float4.zwwz as a getter", new float4(2
f, 3
f, 3
f, 2
f
),
flt4.zwwz
)

AddStrictTestCase("float4.zwww as a getter", new float4(2
f, 3
f, 3
f, 3
f
),
flt4.zwww
)

AddStrictTestCase("float4.wxxx as a getter", new float4(3
f, 0
f, 0
f, 0
f
),
flt4.wxxx
)

AddStrictTestCase("float4.wxxy as a getter", new float4(3
f, 0
f, 0
f, 1
f
),
flt4.wxxy
)

AddStrictTestCase("float4.wxxz as a getter", new float4(3
f, 0
f, 0
f, 2
f
),
flt4.wxxz
)

AddStrictTestCase("float4.wxxw as a getter", new float4(3
f, 0
f, 0
f, 3
f
),
flt4.wxxw
)

AddStrictTestCase("float4.wxyx as a getter", new float4(3
f, 0
f, 1
f, 0
f
),
flt4.wxyx
)

AddStrictTestCase("float4.wxyy as a getter", new float4(3
f, 0
f, 1
f, 1
f
),
flt4.wxyy
)

AddStrictTestCase("float4.wxyz as a getter", new float4(3
f, 0
f, 1
f, 2
f
),
flt4.wxyz
)

AddStrictTestCase("float4.wxyw as a getter", new float4(3
f, 0
f, 1
f, 3
f
),
flt4.wxyw
)

AddStrictTestCase("float4.wxzx as a getter", new float4(3
f, 0
f, 2
f, 0
f
),
flt4.wxzx
)

AddStrictTestCase("float4.wxzy as a getter", new float4(3
f, 0
f, 2
f, 1
f
),
flt4.wxzy
)

AddStrictTestCase("float4.wxzz as a getter", new float4(3
f, 0
f, 2
f, 2
f
),
flt4.wxzz
)

AddStrictTestCase("float4.wxzw as a getter", new float4(3
f, 0
f, 2
f, 3
f
),
flt4.wxzw
)

AddStrictTestCase("float4.wxwx as a getter", new float4(3
f, 0
f, 3
f, 0
f
),
flt4.wxwx
)

AddStrictTestCase("float4.wxwy as a getter", new float4(3
f, 0
f, 3
f, 1
f
),
flt4.wxwy
)

AddStrictTestCase("float4.wxwz as a getter", new float4(3
f, 0
f, 3
f, 2
f
),
flt4.wxwz
)

AddStrictTestCase("float4.wxww as a getter", new float4(3
f, 0
f, 3
f, 3
f
),
flt4.wxww
)

AddStrictTestCase("float4.wyxx as a getter", new float4(3
f, 1
f, 0
f, 0
f
),
flt4.wyxx
)

AddStrictTestCase("float4.wyxy as a getter", new float4(3
f, 1
f, 0
f, 1
f
),
flt4.wyxy
)

AddStrictTestCase("float4.wyxz as a getter", new float4(3
f, 1
f, 0
f, 2
f
),
flt4.wyxz
)

AddStrictTestCase("float4.wyxw as a getter", new float4(3
f, 1
f, 0
f, 3
f
),
flt4.wyxw
)

AddStrictTestCase("float4.wyyx as a getter", new float4(3
f, 1
f, 1
f, 0
f
),
flt4.wyyx
)

AddStrictTestCase("float4.wyyy as a getter", new float4(3
f, 1
f, 1
f, 1
f
),
flt4.wyyy
)

AddStrictTestCase("float4.wyyz as a getter", new float4(3
f, 1
f, 1
f, 2
f
),
flt4.wyyz
)

AddStrictTestCase("float4.wyyw as a getter", new float4(3
f, 1
f, 1
f, 3
f
),
flt4.wyyw
)

AddStrictTestCase("float4.wyzx as a getter", new float4(3
f, 1
f, 2
f, 0
f
),
flt4.wyzx
)

AddStrictTestCase("float4.wyzy as a getter", new float4(3
f, 1
f, 2
f, 1
f
),
flt4.wyzy
)

AddStrictTestCase("float4.wyzz as a getter", new float4(3
f, 1
f, 2
f, 2
f
),
flt4.wyzz
)

AddStrictTestCase("float4.wyzw as a getter", new float4(3
f, 1
f, 2
f, 3
f
),
flt4.wyzw
)

AddStrictTestCase("float4.wywx as a getter", new float4(3
f, 1
f, 3
f, 0
f
),
flt4.wywx
)

AddStrictTestCase("float4.wywy as a getter", new float4(3
f, 1
f, 3
f, 1
f
),
flt4.wywy
)

AddStrictTestCase("float4.wywz as a getter", new float4(3
f, 1
f, 3
f, 2
f
),
flt4.wywz
)

AddStrictTestCase("float4.wyww as a getter", new float4(3
f, 1
f, 3
f, 3
f
),
flt4.wyww
)

AddStrictTestCase("float4.wzxx as a getter", new float4(3
f, 2
f, 0
f, 0
f
),
flt4.wzxx
)

AddStrictTestCase("float4.wzxy as a getter", new float4(3
f, 2
f, 0
f, 1
f
),
flt4.wzxy
)

AddStrictTestCase("float4.wzxz as a getter", new float4(3
f, 2
f, 0
f, 2
f
),
flt4.wzxz
)

AddStrictTestCase("float4.wzxw as a getter", new float4(3
f, 2
f, 0
f, 3
f
),
flt4.wzxw
)

AddStrictTestCase("float4.wzyx as a getter", new float4(3
f, 2
f, 1
f, 0
f
),
flt4.wzyx
)

AddStrictTestCase("float4.wzyy as a getter", new float4(3
f, 2
f, 1
f, 1
f
),
flt4.wzyy
)

AddStrictTestCase("float4.wzyz as a getter", new float4(3
f, 2
f, 1
f, 2
f
),
flt4.wzyz
)

AddStrictTestCase("float4.wzyw as a getter", new float4(3
f, 2
f, 1
f, 3
f
),
flt4.wzyw
)

AddStrictTestCase("float4.wzzx as a getter", new float4(3
f, 2
f, 2
f, 0
f
),
flt4.wzzx
)

AddStrictTestCase("float4.wzzy as a getter", new float4(3
f, 2
f, 2
f, 1
f
),
flt4.wzzy
)

AddStrictTestCase("float4.wzzz as a getter", new float4(3
f, 2
f, 2
f, 2
f
),
flt4.wzzz
)

AddStrictTestCase("float4.wzzw as a getter", new float4(3
f, 2
f, 2
f, 3
f
),
flt4.wzzw
)

AddStrictTestCase("float4.wzwx as a getter", new float4(3
f, 2
f, 3
f, 0
f
),
flt4.wzwx
)

AddStrictTestCase("float4.wzwy as a getter", new float4(3
f, 2
f, 3
f, 1
f
),
flt4.wzwy
)

AddStrictTestCase("float4.wzwz as a getter", new float4(3
f, 2
f, 3
f, 2
f
),
flt4.wzwz
)

AddStrictTestCase("float4.wzww as a getter", new float4(3
f, 2
f, 3
f, 3
f
),
flt4.wzww
)

AddStrictTestCase("float4.wwxx as a getter", new float4(3
f, 3
f, 0
f, 0
f
),
flt4.wwxx
)

AddStrictTestCase("float4.wwxy as a getter", new float4(3
f, 3
f, 0
f, 1
f
),
flt4.wwxy
)

AddStrictTestCase("float4.wwxz as a getter", new float4(3
f, 3
f, 0
f, 2
f
),
flt4.wwxz
)

AddStrictTestCase("float4.wwxw as a getter", new float4(3
f, 3
f, 0
f, 3
f
),
flt4.wwxw
)

AddStrictTestCase("float4.wwyx as a getter", new float4(3
f, 3
f, 1
f, 0
f
),
flt4.wwyx
)

AddStrictTestCase("float4.wwyy as a getter", new float4(3
f, 3
f, 1
f, 1
f
),
flt4.wwyy
)

AddStrictTestCase("float4.wwyz as a getter", new float4(3
f, 3
f, 1
f, 2
f
),
flt4.wwyz
)

AddStrictTestCase("float4.wwyw as a getter", new float4(3
f, 3
f, 1
f, 3
f
),
flt4.wwyw
)

AddStrictTestCase("float4.wwzx as a getter", new float4(3
f, 3
f, 2
f, 0
f
),
flt4.wwzx
)

AddStrictTestCase("float4.wwzy as a getter", new float4(3
f, 3
f, 2
f, 1
f
),
flt4.wwzy
)

AddStrictTestCase("float4.wwzz as a getter", new float4(3
f, 3
f, 2
f, 2
f
),
flt4.wwzz
)

AddStrictTestCase("float4.wwzw as a getter", new float4(3
f, 3
f, 2
f, 3
f
),
flt4.wwzw
)

AddStrictTestCase("float4.wwwx as a getter", new float4(3
f, 3
f, 3
f, 0
f
),
flt4.wwwx
)

AddStrictTestCase("float4.wwwy as a getter", new float4(3
f, 3
f, 3
f, 1
f
),
flt4.wwwy
)

AddStrictTestCase("float4.wwwz as a getter", new float4(3
f, 3
f, 3
f, 2
f
),
flt4.wwwz
)

AddStrictTestCase("float4.wwww as a getter", new float4(3
f, 3
f, 3
f, 3
f
),
flt4.wwww
)


