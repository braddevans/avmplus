/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

// var SECTION = "5.2.1";
// var VERSION = "AS3";
// var TITLE   = "The * operation agumented by float4 values";


/*
If Type(w1) is float4 or Type(w2) is float4:
Let z1=ToFloat4(w1)
Let z2=ToFloat4(w2)
Let value3=z1 * z2 where * is float4 multiply
Goto PUSH
*/

var f1: float4 = float4(1
f, 2
f, 3
f, 4
f
)

var f2: float4 = float4(5
f, 6
f, 7
f, 8
f
)


function check(val1: *, val2: *): * {
    return (val1 * val2);
}

AddStrictTestCase("float4 * float4", new float4(5
f, 12
f, 21
f, 32
f
),
f1 * f2
)

AddStrictTestCase("float4 * float4 check()", new float4(5
f, 12
f, 21
f, 32
f
),
check(f1, f2)
)


AddStrictTestCase("float4 * float", new float4(2
f, 4
f, 6
f, 8
),
f1 * float(2
f
))

AddStrictTestCase("float4 * float check()", new float4(2
f, 4
f, 6
f, 8
f
),
check(f1, float(2
f
)))

AddStrictTestCase("float * float4", new float4(2
f, 4
f, 6
f, 8
),
float(2
f
) *
f1
)

AddStrictTestCase("float * float4 check()", new float4(2
f, 4
f, 6
f, 8
f
),
check(float(2
f
),
f1
))




