/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

// var SECTION = "4.4.16.22";
// var VERSION = "AS3";
// var TITLE   = "Math and geometric methods public function cross(arg1:float4, arg2:float4):float4";


var flt4: float4 = new float4(1
f
)

Assert.expectEq("float4.cross() returns a float4", "float4", getQualifiedClassName(float4.cross(flt4, flt4)));
Assert.expectEq("float4.cross() length is 2", 2, float4.cross.length);

var flt4_a: float4 = new float4(1
f, 2
f, 3
f, 4
f
)

var flt4_b: float4 = new float4(4
f, 3
f, 2
f, 1
f
)

AddStrictTestCase("float4.cross((1f, 2f, 3f, 4f), (4f, 3f, 2f, 1f))", new float4(-5
f, 10
f, -5
f, 0
f
),
float4.cross(flt4_a, flt4_b)
)



