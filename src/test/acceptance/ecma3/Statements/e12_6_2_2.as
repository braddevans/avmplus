/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "12.6.2-2";
//     var VERSION = "ECMA_1";
//     var TITLE   = "The for statment";


var testcases = getTestCases();


function getTestCases() {
    var array = [];
    var item = 0;
    array[item++] = Assert.expectEq("for statement", 99, testprogram());
    return (array);
}

function testprogram() {
    myVar = 0;

    for (; ; myVar++) {
        if (myVar < 99) {

        } else {
            break;
        }
    }

    return myVar;
}
