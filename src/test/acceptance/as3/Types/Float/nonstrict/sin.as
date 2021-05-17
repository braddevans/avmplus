/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Utils;

/*
Returns an implementation-dependent approximation to the sine of x. The argument
is expressed in radians.
*/

// var SECTION = "4.5.30";
// var VERSION = "AS3";
// var TITLE   = "public function sin(x:float):float";


Assert.expectError("float.sin() with no args", Utils.ARGUMENTERROR + 1063, function () {
    float.sin();
});

// If x is NaN, the result is NaN.
AddStrictTestCase("float.sin(string)", float.NaN, float.sin("string"));
AddStrictTestCase("float.sin(undefined)", float.NaN, float.sin(undefined));

// If x is +0, the result is +0.
AddStrictTestCase("float.sin('0')", 0
f, float.sin('0')
)

AddStrictTestCase("float.sin(false)", 0
f, float.sin(false)
)



