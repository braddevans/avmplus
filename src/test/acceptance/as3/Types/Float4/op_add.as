/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

// var SECTION = "5.3.1";
// var VERSION = "AS3";
// var TITLE   = "The + operation agumented by float4 values";


var f1: float4 = float4(3
f, 6
f, 9
f, 3
f
)

var f2: float4 = float4(2
f, 4
f, 3
f, 4
f
)


function check(val1: *, val2: *): * {
    return (val1 + val2);
}

AddStrictTestCase("float4 + float4", new float4(5
f, 10
f, 12
f, 7
f
),
f1 + f2
)

AddStrictTestCase("float4 + float4", new float4(5
f, 10
f, 12
f, 7
),
check(f1, f2)
)


AddStrictTestCase("float4 + float", new float4(5
f, 8
f, 11
f, 5
f
),
f1 + float(2
f
))

AddStrictTestCase("float4 + float check()", new float4(5
f, 8
f, 11
f, 5
f
),
check(f1, float(2
f
)))


AddStrictTestCase("float + float4", new float4(5
f, 8
f, 11
f, 5
f
),
float(2
f
)
+f1
)

AddStrictTestCase("float + float4 check()", new float4(5
f, 8
f, 11
f, 5
f
),
check(float(2
f
),
f1
))



