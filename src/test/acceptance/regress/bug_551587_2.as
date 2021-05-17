/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


// var SECTION = "regress_551587_2";
// var VERSION = "AS3";
// var TITLE   = "MathClass:_min and _max does not correctly handle -0";
// var bug = "551587";

import avmplus.System;

import flash.system.*;

var playerType: String = Capabilities.playerType;

if (System.swfVersion >= 11) {
    import com.adobe.test.Assert;

    Assert.expectEq(
        "SWF 11+: 1.0/Math.min(-0.0, 0.0)",
        -Infinity,
        1.0 / Math.min(-0.0, 0.0));
    Assert.expectEq(
        "SWF 11+: 1.0/Math.max(0.0, -0.0)",
        Infinity,
        1.0 / Math.max(0.0, -0.0));
} else {
    // Bug only happens in wordcode and jit builds
    if (playerType == 'AVMPlus' &&
        (System.getRunmode().indexOf('jit') != -1 ||
            System.getFeatures().indexOf('AVMFEATURE_WORDCODE_INTERP') != -1)) {
        Assert.expectEq(
            "SWF < 11, jit or wordcode build 1.0/Math.min(-0.0, 0.0)",
            Infinity,
            1.0 / Math.min(-0.0, 0.0));
        Assert.expectEq(
            "SWF < 11, jit or wordcode build 1.0/Math.max(0.0, -0.0)",
            -Infinity,
            1.0 / Math.max(0.0, -0.0));
    } else {
        Assert.expectEq(
            "SWF < 11, 1.0/Math.min(-0.0, 0.0)",
            -Infinity,
            1.0 / Math.min(-0.0, 0.0));
        Assert.expectEq(
            "SWF < 11, 1.0/Math.max(0.0, -0.0)",
            Infinity,
            1.0 / Math.max(0.0, -0.0));
    }

}


