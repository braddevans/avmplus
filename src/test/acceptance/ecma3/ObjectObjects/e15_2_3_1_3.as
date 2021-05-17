/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;
import com.adobe.test.Utils;

//     var SECTION = "15.2.3.1-3";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Object.prototype";


var testcases = getTestCases();

// TODO: REVIEW AS4 CONVERSION ISSUE
// Adding this function getJSClass directly to file rather than in Utils

function getJSClass(obj) {
    if (isObject(obj))
        return findClass(findType(obj));
    return cnNoObject;
}

function isObject(obj) {
    return obj instanceof Object;
}

function findType(obj) {
    var cnObjectToString = Object.prototype.toString;
    return cnObjectToString.apply(obj);
}

// given '[object Number]',  return 'Number'
function findClass(sType) {
    var re = /^\[.*\s+(\w+)\s*\]$/;
    var a = sType.match(re);

    if (a && a[1])
        return a[1];
    return cnNoClass;
}

function getTestCases() {
    var array = [];
    var item = 0;

    var thisError = "no exception thrown";
    try {
        // save
        var origPrototype = Object.prototype;

        Object.prototype = null;

        // restore
        Object.prototype = origPrototype;
    } catch (e: ReferenceError) {
        thisError = e.toString();
    } finally {
        array[item++] = Assert.expectEq("Object.prototype = null; Object.prototype",
            "ReferenceError: Error #1074",
            Utils.referenceError(thisError)
        );
    }

    return (array);
}
