/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.7.3.2-4";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Number.MAX_VALUE:  DontEnum Attribute";

var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    string = '';
    for (prop in Number) {
        string += (prop == 'MAX_VALUE') ? prop : '';
    }

    array[item++] = Assert.expectEq(
        //TO-DO: COMMENTING SECTION
        ////SECTION,
        "var string = ''; for ( prop in Number ) { string += ( prop == 'MAX_VALUE' ) ? prop : '' } string;",
        "",
        string
    );

    return (array);
}
