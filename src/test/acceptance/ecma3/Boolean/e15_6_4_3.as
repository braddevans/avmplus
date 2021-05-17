/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.8.6.4.3";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Properties of the Boolean Object:  valueOf"

var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    array[item++] = Assert.expectEq("(new Boolean(1)).valueOf()", true, (Boolean(1)).valueOf());

    array[item++] = Assert.expectEq("(new Boolean(0)).valueOf()", false, (Boolean(0)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(-1)).valueOf()", true, (Boolean(-1)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean('1')).valueOf()", true, (Boolean("1")).valueOf());
    array[item++] = Assert.expectEq("(new Boolean('0')).valueOf()", true, (Boolean("0")).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(true)).valueOf()", true, (Boolean(true)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(false)).valueOf()", false, (Boolean(false)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean('true')).valueOf()", true, (Boolean("true")).valueOf());
    array[item++] = Assert.expectEq("(new Boolean('false')).valueOf()", true, (Boolean('false')).valueOf());

    array[item++] = Assert.expectEq("(new Boolean('')).valueOf()", false, (Boolean('')).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(null)).valueOf()", false, (Boolean(null)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(void(0))).valueOf()", false, (Boolean(void (0))).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(-Infinity)).valueOf()", true, (Boolean(Number.NEGATIVE_INFINITY)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(NaN)).valueOf()", false, (Boolean(Number.NaN)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean()).valueOf()", false, (Boolean()).valueOf());

    array[item++] = Assert.expectEq("(new Boolean(x=1)).valueOf()", true, (Boolean(x = 1)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(x=0)).valueOf()", false, (Boolean(x = 0)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(x=false)).valueOf()", false, (Boolean(x = false)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(x=true)).valueOf()", true, (Boolean(x = true)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(x=null)).valueOf()", false, (Boolean(x = null)).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(x='')).valueOf()", false, (Boolean(x = "")).valueOf());
    array[item++] = Assert.expectEq("(new Boolean(x=' ')).valueOf()", true, (Boolean(x = " ")).valueOf());

    return (array);
}
