/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.6.4.2-1";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Boolean.prototype.toString()"

var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    array[item++] = Assert.expectEq("new Boolean(1)", "true", (Boolean(1)).toString());
    array[item++] = Assert.expectEq("new Boolean(0)", "false", (Boolean(0)).toString());
    array[item++] = Assert.expectEq("new Boolean(-1)", "true", (Boolean(-1)).toString());
    array[item++] = Assert.expectEq("new Boolean('1')", "true", (Boolean("1")).toString());
    array[item++] = Assert.expectEq("new Boolean('0')", "true", (Boolean("0")).toString());
    array[item++] = Assert.expectEq("new Boolean(true)", "true", (Boolean(true)).toString());
    array[item++] = Assert.expectEq("new Boolean(false)", "false", (Boolean(false)).toString());
    array[item++] = Assert.expectEq("new Boolean('true')", "true", (Boolean('true')).toString());
    array[item++] = Assert.expectEq("new Boolean('false')", "true", (Boolean('false')).toString());

    array[item++] = Assert.expectEq("new Boolean('')", "false", (Boolean('')).toString());
    array[item++] = Assert.expectEq("new Boolean(null)", "false", (Boolean(null)).toString());
    array[item++] = Assert.expectEq("new Boolean(void(0))", "false", (Boolean(void (0))).toString());
    array[item++] = Assert.expectEq("new Boolean(-Infinity)", "true", (Boolean(Number.NEGATIVE_INFINITY)).toString());
    array[item++] = Assert.expectEq("new Boolean(NaN)", "false", (Boolean(Number.NaN)).toString());
    array[item++] = Assert.expectEq("new Boolean()", "false", (Boolean()).toString());
    array[item++] = Assert.expectEq("new Boolean(x=1)", "true", (Boolean(x = 1)).toString());
    array[item++] = Assert.expectEq("new Boolean(x=0)", "false", (Boolean(x = 0)).toString());
    array[item++] = Assert.expectEq("new Boolean(x=false)", "false", (Boolean(x = false)).toString());
    array[item++] = Assert.expectEq("new Boolean(x=true)", "true", (Boolean(x = true)).toString());
    array[item++] = Assert.expectEq("new Boolean(x=null)", "false", (Boolean(x = null)).toString());
    array[item++] = Assert.expectEq("new Boolean(x='')", "false", (Boolean(x = "")).toString());
    array[item++] = Assert.expectEq("new Boolean(x=' ')", "true", (Boolean(x = " ")).toString());

    array[item++] = Assert.expectEq("new Boolean(new MyObject(true))", "true", (Boolean(new MyObject(true))).toString());
    array[item++] = Assert.expectEq("new Boolean(new MyObject(false))", "true", (Boolean(new MyObject(false))).toString());

    return (array);
}

function MyObject(value) {
    this.value = value;
    this.valueOf = function () {
        return this.value;
    }
    this.valueOf = function () {
        return this.value;
    }
    return this;
}
