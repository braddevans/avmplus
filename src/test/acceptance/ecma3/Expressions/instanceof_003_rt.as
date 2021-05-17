/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;
import com.adobe.test.Utils;

// var SECTION = "instanceof-003_TypeErrors";
// var VERSION = "ECMA_2";
// var TITLE   = "instanceof"


var testcases = getTestCases();

function InstanceOf(object_1, object_2, expect, array, item) {

    try {
        result = object_1 instanceof object_2;
    } catch (e: TypeError) {
        result = e.toString();
    } finally {
        array[item] = Assert.expectEq(
            "(" + object_1 + ") instanceof " + object_2,
            expect,
            Utils.typeError(result));
    }

}

function getTestCases() {
    var array = [];
    var item = 0;
    // RHS of instanceof must be a Class or Function
    var RHSTypeError = "TypeError: Error #1040";

    //Boolean
    InstanceOf(true, true, RHSTypeError, array, item++);
    InstanceOf(false, false, RHSTypeError, array, item++);
    InstanceOf(false, true, RHSTypeError, array, item++);

    InstanceOf(Boolean(), true, RHSTypeError, array, item++);
    InstanceOf(Boolean(true), true, RHSTypeError, array, item++);
    InstanceOf(Boolean(false), true, RHSTypeError, array, item++);

    InstanceOf(Boolean(), false, RHSTypeError, array, item++);
    InstanceOf(Boolean(true), false, RHSTypeError, array, item++);
    InstanceOf(Boolean(false), false, RHSTypeError, array, item++);

    InstanceOf(Boolean(), Boolean(), RHSTypeError, array, item++);
    InstanceOf(Boolean(true), Boolean(), RHSTypeError, array, item++);
    InstanceOf(Boolean(false), Boolean(), RHSTypeError, array, item++);

    InstanceOf(Boolean(), Boolean(true), RHSTypeError, array, item++);
    InstanceOf(Boolean(true), Boolean(true), RHSTypeError, array, item++);
    InstanceOf(Boolean(false), Boolean(true), RHSTypeError, array, item++);

    InstanceOf(Boolean(), Boolean(false), RHSTypeError, array, item++);
    InstanceOf(Boolean(true), Boolean(false), RHSTypeError, array, item++);
    InstanceOf(Boolean(false), Boolean(false), RHSTypeError, array, item++);

    //Number
    InstanceOf(4, 3, RHSTypeError, array, item++);
    InstanceOf(Number(), 3, RHSTypeError, array, item++);
    InstanceOf(Number(4), 3, RHSTypeError, array, item++);
    InstanceOf(Number(), Number(), RHSTypeError, array, item++);
    InstanceOf(Number(4), Number(4), RHSTypeError, array, item++);


    //String
    InstanceOf("test", "test", RHSTypeError, array, item++);
    InstanceOf("test", String("test"), RHSTypeError, array, item++);
    InstanceOf("test", String(), RHSTypeError, array, item++);
    InstanceOf("test", String(""), RHSTypeError, array, item++);
    InstanceOf(String(), String("test"), RHSTypeError, array, item++);
    InstanceOf(String(""), String(), RHSTypeError, array, item++);
    InstanceOf(String("test"), String(""), RHSTypeError, array, item++);

    return array;
}
