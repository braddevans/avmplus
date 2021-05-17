/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

/*
Returns the smallest (closest to -Infinity) float value that is not less than x
and is equal to a mathematical integer. If x is already an integer, the result is x.
*/

// var SECTION = "4.5.20";
// var VERSION = "AS3";
// var TITLE   = "public function ceil(x:float):float";


function check(param: float): float {
    return float.ceil(param);
}

AddStrictTestCase("float.ceil() returns a float", "float", getQualifiedClassName(float.ceil(0
f
)))

AddStrictTestCase("float.ceil() length is 1", 1, float.ceil.length);

// If x is NaN, the result is NaN.
AddStrictTestCase("float.ceil(NaN)", float.NaN, float.ceil(float.NaN));
AddStrictTestCase("float.ceil(NaN) check()", float.NaN, check(float.NaN));

// If x is +0, the result is +0.
AddStrictTestCase("float.ceil(0f)", 0
f, float.ceil(0
f
))

AddStrictTestCase("float.ceil(0f) sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(0
f
))

AddStrictTestCase("float.ceil(0f) check()", 0
f, check(0
f
))

AddStrictTestCase("float.ceil(0f) check() sign check", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY / check(0
f
))


// If x is -0, the result is -0.
AddStrictTestCase("float.ceil(-0f)", -0
f, float.ceil(-0
f
))

AddStrictTestCase("float.ceil(-0f) sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(-0
f
))

AddStrictTestCase("float.ceil(-0f) check()", -0
f, check(-0
f
))

AddStrictTestCase("float.ceil(-0f) check() sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / check(-0
f
))


// If x is +Infinity, the result is +Infinty.
AddStrictTestCase("float.ceil(float.POSITIVE_INFINITY)", float.POSITIVE_INFINITY, float.ceil(float.POSITIVE_INFINITY));
AddStrictTestCase("float.ceil(float.POSITIVE_INFINITY) check()", float.POSITIVE_INFINITY, check(float.POSITIVE_INFINITY));

// If x is -Infinity, the result is -Infinity.
AddStrictTestCase("float.ceil(float.NEGATIVE_INFINITY)", float.NEGATIVE_INFINITY, float.ceil(float.NEGATIVE_INFINITY));
AddStrictTestCase("float.ceil(float.NEGATIVE_INFINITY) check()", float.NEGATIVE_INFINITY, check(float.NEGATIVE_INFINITY));

// If x is less than 0 but greater than -1, the result is -0.
AddStrictTestCase("float.ceil(-0.1f)", float(-0), float.ceil(-0.1
f
))

AddStrictTestCase("float that float.ceil(-0.1f) returns -0f", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(-0.1
f
))

AddStrictTestCase("float.ceil(-0.5f)", -0
f, float.ceil(-0.5
f
))

AddStrictTestCase("float.ceil(-0.5f) sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(-0.5
f
))

AddStrictTestCase("float.ceil(-0.999f)", -0
f, float.ceil(-0.999
f
))

AddStrictTestCase("float.ceil(-0.999f) sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(-0.999
f
))

AddStrictTestCase("float.ceil(-0.5f) check()", -0
f, check(-0.5
f
))

AddStrictTestCase("float.ceil(-0.5f) check() sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / check(-0.5
f
))

AddStrictTestCase("float.ceil(-0.999f) check()", -0
f, check(-0.999
f
))

AddStrictTestCase("float.ceil(-0.999f) check() sign check", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / check(-0.999
f
))


// The value of float.ceil(x) is the same as the value of -float.floor(-x).
AddStrictTestCase("float.ceil(3.124f) == -float.floor(-3.124f)", -float.floor(-3.124
f
),
float.ceil(3.124
f
))


AddStrictTestCase("float.ceil(null)", 0
f, float.ceil(null)
)


AddStrictTestCase("float.ceil(float.MAX_VALUE)", float.MAX_VALUE, float.ceil(float.MAX_VALUE));
AddStrictTestCase("float.ceil(float.MAX_VALUE+3.40282346638528e+31f)", float.POSITIVE_INFINITY, float.ceil(float.MAX_VALUE + 3.40282346638528e+31
f
))

AddStrictTestCase("float.ceil(float.MIN_VALUE)", 1
f, float.ceil(float.MIN_VALUE)
)



var myfloat: float = 1
f;
AddStrictTestCase("float.ceil(myfloat=1f)", float(1
f
),
float.ceil(myfloat)
)

myfloat = 0
f;
AddStrictTestCase("float.ceil(myfloat=0f)", float(0), float.ceil(myfloat));
Assert.expectEq("float.INFINITY/float.ceil(myfloat=0f)", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(myfloat));
myfloat = -0
f;
AddStrictTestCase("float.ceil(myfloat=-0f)", -float(0), float.ceil(myfloat));
AddStrictTestCase("float.INFINITY/float.ceil(myfloat=-0f)", float.NEGATIVE_INFINITY, float.POSITIVE_INFINITY / float.ceil(myfloat));
myfloat = -1
f;
AddStrictTestCase("float.ceil(myfloat=-1f)", float(-1
f
),
float.ceil(myfloat)
)


AddStrictTestCase("float.ceil(1f) FloatLiteral", float(1), float.ceil(1
f
))

AddStrictTestCase("float.ceil(0f) FloatLiteral", float(0), float.ceil(0
f
))

AddStrictTestCase("float.ceil(-0f) FloatLiteral", -float(0), float.ceil(-0
f
))

AddStrictTestCase("float.ceil(-1f) FloatLiteral", -float(1), float.ceil(-1
f
))




