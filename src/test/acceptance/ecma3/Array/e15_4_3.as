/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.4.3";
//     var VERSION = "ECMA_2";
//     var TITLE   = "Properties of the Array Constructor";


var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    array[item++] = Assert.expectEq("Array.constructor.prototype", Object.constructor.prototype, Array.constructor.prototype);

    return (array);
}
