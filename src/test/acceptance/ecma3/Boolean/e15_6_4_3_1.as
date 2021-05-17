/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.6.4.3-1";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Boolean.prototype.valueOf()";


var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    array[item++] = Assert.expectEq("new Boolean(1)", true, (Boolean(1)).valueOf());

    array[item++] = Assert.expectEq("new Boolean(0)", false, (Boolean(0)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(-1)", true, (Boolean(-1)).valueOf());
    array[item++] = Assert.expectEq("new Boolean('1')", true, (Boolean("1")).valueOf());
    array[item++] = Assert.expectEq("new Boolean('0')", true, (Boolean("0")).valueOf());
    array[item++] = Assert.expectEq("new Boolean(true)", true, (Boolean(true)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(false)", false, (Boolean(false)).valueOf());
    array[item++] = Assert.expectEq("new Boolean('true')", true, (Boolean("true")).valueOf());
    array[item++] = Assert.expectEq("new Boolean('false')", true, (Boolean('false')).valueOf());

    array[item++] = Assert.expectEq("new Boolean('')", false, (Boolean('')).valueOf());
    array[item++] = Assert.expectEq("new Boolean(null)", false, (Boolean(null)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(void(0))", false, (Boolean(void (0))).valueOf());
    array[item++] = Assert.expectEq("new Boolean(-Infinity)", true, (Boolean(Number.NEGATIVE_INFINITY)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(NaN)", false, (Boolean(Number.NaN)).valueOf());
    array[item++] = Assert.expectEq("new Boolean()", false, (Boolean()).valueOf());

    array[item++] = Assert.expectEq("new Boolean(x=1)", true, (Boolean(x = 1)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(x=0)", false, (Boolean(x = 0)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(x=false)", false, (Boolean(x = false)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(x=true)", true, (Boolean(x = true)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(x=null)", false, (Boolean(x = null)).valueOf());
    array[item++] = Assert.expectEq("new Boolean(x='')", false, (Boolean(x = "")).valueOf());
    array[item++] = Assert.expectEq("new Boolean(x=' ')", true, (Boolean(x = " ")).valueOf());

    return (array);
}
