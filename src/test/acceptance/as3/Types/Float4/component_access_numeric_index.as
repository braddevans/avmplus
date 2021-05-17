/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

// var SECTION = "4.6.3";
// var VERSION = "AS3";
// var TITLE   = "Component accesses";


// Access component via v.x
var flt4: float4 = new float4(1
f, 2
f, 3
f, 4
f
)

AddStrictTestCase("float4[0] as a getter", 1
f, flt4[0]
)

AddStrictTestCase("float4[1] as a getter", 2
f, flt4[1]
)

AddStrictTestCase("float4[2] as a getter", 3
f, flt4[2]
)

AddStrictTestCase("float4[3] as a getter", 4
f, flt4[3]
)



