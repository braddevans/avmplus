/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

// var SECTION = "4.4.16.30";
// var VERSION = "AS3";
// var TITLE   = "Math and geometric methods public function distance3(arg1:float4, arg2:float4):float";


var flt4: float4 = new float4(1
f
)

Assert.expectEq("float4.distance3() returns a float", "float", getQualifiedClassName(float4.distance3(flt4, flt4)));
Assert.expectEq("float4.distance3() length is 2", 2, float4.distance3.length);

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

AddStrictTestCase("float4.distance3((1f, 2f, 3f, 4f), (4f, 3f, 2f, 1f))", float4.magnitude3(flt4_a - flt4_b), float4.distance3(flt4_a, flt4_b));


