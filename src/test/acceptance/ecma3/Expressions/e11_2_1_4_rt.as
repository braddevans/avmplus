/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "11.2.1-4-n";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Property Accessors";

var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    // go through all Native Function objects, methods, and properties and get their typeof.

    var PROPERTY = [];
    var p = 0;

    // try to access properties of primitive types

    PROPERTY[p++] = new Property("null", null, "null", 0);

//null.valueOf();

    for (var i = 0, RESULT; i < PROPERTY.length; i++) {


        array[item++] = Assert.expectEq(
            PROPERTY[i].object + ".valueOf()",
            PROPERTY[i].value + "",
            (PROPERTY[i].object.valueOf() + ""));


        array[item++] = Assert.expectEq(
            PROPERTY[i].object + ".toString()",
            PROPERTY[i].string,
            (PROPERTY[i].object.toString()));
    }
    return array;
}


function MyObject(value) {
    this.value = value;
    this.stringValue = value + "";
    this.numberValue = Number(value);
    return this;
}

function Property(object, value, string, number) {
    this.object = object;
    this.string = String(value);
    this.number = Number(value);
    this.value = value;
}
