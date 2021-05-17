/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

// var SECTION = "5.6.4";
// var VERSION = "AS3";
// var TITLE   = "The !== operator augmented by float4 values";


var fivef: float = float(5
f
)

var fourf: float = float(4
f
)

var threef: float = float(3
f
)

var twof: float = float(2
f
)

var onef: float = float(1
f
)

var zerof: float = float(0
f
)


Assert.expectEq("float4(1f) !== float4(1f)", false, float4(1
f
) !==
float4(1
f
))

Assert.expectEq("float4(0f) !== float4(0f)", false, float4(0
f
) !==
float4(0
f
))

Assert.expectEq("float4(onef) !== float4(onef)", false, float4(onef) !== float4(onef));
Assert.expectEq("float4(zerof) !== float4(zerof)", false, float4(zerof) !== float4(zerof));
Assert.expectEq("float4(0f) !== float4(-0f)", true, float4(0
f
) !==
float4(-0
f
))

Assert.expectEq("float4(0f) !== float4(-0f)", true, float4(-0
f
) !==
float4(0
f
))

Assert.expectEq("float4(1f) !== float4(2f)", true, float4(1
f
) !==
float4(2
f
))

Assert.expectEq("float4(2f) !== float4(1f)", true, float4(2
f
) !==
float4(1
f
))


Assert.expectEq("float4(1f, 2f, 3f, 4f) !== float4(1f, 2f, 3f, 4f)", false, float4(1
f, 2
f, 3
f, 4
f
) !==
float4(1
f, 2
f, 3
f, 4
f
))

Assert.expectEq("float4(1f, 2f, 3f, 4f) !== float4(0f, 2f, 3f, 4f)", true, float4(1
f, 2
f, 3
f, 4
f
) !==
float4(0
f, 2
f, 3
f, 4
f
))

Assert.expectEq("float4(1f, 1f, 3f, 4f) !== float4(1f, 1f, 3f, 4f)", true, float4(1
f, 2
f, 3
f, 4
f
) !==
float4(1
f, 1
f, 3
f, 4
f
))

Assert.expectEq("float4(1f, 2f, 2f, 4f) !== float4(1f, 2f, 3f, 4f)", true, float4(1
f, 2
f, 3
f, 4
f
) !==
float4(1
f, 2
f, 2
f, 4
f
))

Assert.expectEq("float4(1f, 2f, 3f, 4f) !== float4(!f, 2f, 3f, 5f)", true, float4(1
f, 2
f, 3
f, 4
f
) !==
float4(1
f, 2
f, 3
f, 5
f
))


Assert.expectEq("float4(onef, twof, threef, fourf) !== float4(onef, twof, threef, fourf)", false, float4(onef, twof, threef, fourf) !== float4(onef, twof, threef, fourf));
Assert.expectEq("float4(onef, twof, threef, fourf) !== float4(zerof, twof, threef, fourf)", true, float4(onef, twof, threef, fourf) !== float4(zerof, twof, threef, fourf));
Assert.expectEq("float4(onef, twof, threef, fourf) !== float4(onef, onef, threef, fourf)", true, float4(onef, twof, threef, fourf) !== float4(onef, onef, threef, fourf));
Assert.expectEq("float4(onef, twof, threef, fourf) !== float4(onef, twof, twof, fourf)", true, float4(onef, twof, threef, fourf) !== float4(onef, twof, twof, fourf));
Assert.expectEq("float4(onef, twof, threef, fourf) !== float4(onef, twof, threef, fivef)", true, float4(onef, twof, threef, fourf) !== float4(onef, twof, threef, fivef));


