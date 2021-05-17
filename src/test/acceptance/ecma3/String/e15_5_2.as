/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.5.2";
//     var VERSION = "ECMA_1";
//     var TITLE   = "The String Constructor";


var testcases = getTestCases();

function getTestCases() {
    var array = [];
    var item = 0;

    String.prototype.myToString = Object.prototype.toString;
    TESTSTRING = String('string primitive');

    array[item++] = Assert.expectEq("typeof new String('string primitive')", "string", typeof String('string primitive'));
    array[item++] = Assert.expectEq("var TESTSTRING = new String('string primitive'), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", TESTSTRING.myToString());
    array[item++] = Assert.expectEq("(new String('string primitive')).valueOf()", 'string primitive', (String('string primitive')).valueOf());
    array[item++] = Assert.expectEq("(new String('string primitive')).substring", "function Function() {}", ((String('string primitive')).substring + ""));

    array[item++] = Assert.expectEq("typeof new String(void 0)", "string", typeof String(void 0));
    array[item++] = Assert.expectEq("var TESTSTRING = new String(void 0), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", (TESTSTRING = String(void 0), TESTSTRING.myToString()));
    array[item++] = Assert.expectEq("(new String(void 0)).valueOf()", "undefined", (String(void 0)).valueOf());
    array[item++] = Assert.expectEq("(new String(void 0)).toString", "function Function() {}", ((String(void 0)).toString + ""));

    array[item++] = Assert.expectEq("typeof new String(null)", "string", typeof String(null));
    array[item++] = Assert.expectEq("var TESTSTRING = new String(null), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", (TESTSTRING = String(null), TESTSTRING.myToString()));
    array[item++] = Assert.expectEq("(new String(null)).valueOf()", "null", (String(null)).valueOf());
    array[item++] = Assert.expectEq("(new String(null)).valueOf", (String.prototype.valueOf + ""), ((String(null)).valueOf + ""));

    array[item++] = Assert.expectEq("typeof new String(true)", "string", typeof String(true));
    array[item++] = Assert.expectEq("var TESTSTRING = new String(true), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", (TESTSTRING = String(true), TESTSTRING.myToString()));
    array[item++] = Assert.expectEq("(new String(true)).valueOf()", "true", (String(true)).valueOf());
    array[item++] = Assert.expectEq("(new String(true)).charAt", (String.prototype.charAt + ""), ((String(true)).charAt + ""));

    array[item++] = Assert.expectEq("typeof new String(false)", "string", typeof String(false));
    array[item++] = Assert.expectEq("var TESTSTRING = new String(false), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", (TESTSTRING = String(false), TESTSTRING.myToString()));
    array[item++] = Assert.expectEq("(new String(false)).valueOf()", "false", (String(false)).valueOf());
    array[item++] = Assert.expectEq("(new String(false)).charCodeAt", (String.prototype.charCodeAt + ""), ((String(false)).charCodeAt + ""));

    array[item++] = Assert.expectEq("typeof new String(new Boolean(true))", "string", typeof String(Boolean(true)));
    array[item++] = Assert.expectEq("var TESTSTRING = new String(new Boolean(true)), TESTSTRING.toString=Object.prototype.toString,TESTSTRING.toString()", "true", (TESTSTRING = String(Boolean(true)), TESTSTRING.toString()));
    array[item++] = Assert.expectEq("(new String(new Boolean(true))).valueOf()", "true", (String(Boolean(true))).valueOf());
    array[item++] = Assert.expectEq("(new String(new Boolean(true))).indexOf", (String.prototype.indexOf + ""), ((String(Boolean(true))).indexOf + ""));

    array[item++] = Assert.expectEq("typeof new String()", "string", typeof String());
    array[item++] = Assert.expectEq("var TESTSTRING = new String(), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", (TESTSTRING = String(), TESTSTRING.myToString()));
    array[item++] = Assert.expectEq("(new String()).valueOf()", '', (String()).valueOf());
    array[item++] = Assert.expectEq("(new String()).lastIndexOf", (String.prototype.lastIndexOf + ""), ((String()).lastIndexOf + ""));

    array[item++] = Assert.expectEq("typeof new String('')", "string", typeof String(''));
    array[item++] = Assert.expectEq("var TESTSTRING = new String(''), TESTSTRING.myToString=Object.prototype.toString,TESTSTRING.myToString()", "[object String]", (TESTSTRING = String(''), TESTSTRING.myToString()));
    array[item++] = Assert.expectEq("(new String('')).valueOf()", '', (String('')).valueOf());
    array[item++] = Assert.expectEq("(new String('')).split", (String.prototype.split + ""), ((String('')).split + ""));
    array[item++] = Assert.expectEq("new String(true)", "true", String(true));
    array[item++] = Assert.expectEq("new String(false)", "false", String(false));
    array[item++] = Assert.expectEq("new String(new Array())", "", String([]));
    array[item++] = Assert.expectEq("new String(new Array(1,2,3))", "1,2,3", String([1, 2, 3]));
    array[item++] = Assert.expectEq("new String( Number.NaN )", "NaN", String(Number.NaN));
    array[item++] = Assert.expectEq("new String( 0 )", "0", String(0));
    array[item++] = Assert.expectEq("new String( -0 )", "0", String(-0));
    array[item++] = Assert.expectEq("new String( Number.POSITIVE_INFINITY )", "Infinity", String(Number.POSITIVE_INFINITY));
    array[item++] = Assert.expectEq("new String( Number.NEGATIVE_INFINITY )", "-Infinity", String(Number.NEGATIVE_INFINITY));
    array[item++] = Assert.expectEq("new String( -1 )", "-1", String(-1));

    // cases in step 6:  integers  1e21 > x >= 1 or -1 >= x > -1e21

    array[item++] = Assert.expectEq("new String( 1 )", "1", String(1));
    array[item++] = Assert.expectEq("new String( 10 )", "10", String(10));
    array[item++] = Assert.expectEq("new String( 100 )", "100", String(100));
    array[item++] = Assert.expectEq("new String( 1000 )", "1000", String(1000));
    array[item++] = Assert.expectEq("new String( 10000 )", "10000", String(10000));
    array[item++] = Assert.expectEq("new String( 10000000000 )", "10000000000", String(10000000000));
    array[item++] = Assert.expectEq("new String( 10000000000000000000 )", "10000000000000000000", String(10000000000000000000));
    array[item++] = Assert.expectEq("new String( 100000000000000000000 )", "100000000000000000000", String(100000000000000000000));

    array[item++] = Assert.expectEq("new String( 12345 )", "12345", String(12345));
    array[item++] = Assert.expectEq("new String( 1234567890 )", "1234567890", String(1234567890));

    array[item++] = Assert.expectEq("new String( -1 )", "-1", String(-1));
    array[item++] = Assert.expectEq("new String( -10 )", "-10", String(-10));
    array[item++] = Assert.expectEq("new String( -100 )", "-100", String(-100));
    array[item++] = Assert.expectEq("new String( -1000 )", "-1000", String(-1000));
    array[item++] = Assert.expectEq("new String( -1000000000 )", "-1000000000", String(-1000000000));
    array[item++] = Assert.expectEq("new String( -1000000000000000 )", "-1000000000000000", String(-1000000000000000));
    array[item++] = Assert.expectEq("new String( -100000000000000000000 )", "-100000000000000000000", String(-100000000000000000000));
    array[item++] = Assert.expectEq("new String( -1000000000000000000000 )", "-1e+21", String(-1000000000000000000000));

    array[item++] = Assert.expectEq("new String( -12345 )", "-12345", String(-12345));
    array[item++] = Assert.expectEq("new String( -1234567890 )", "-1234567890", String(-1234567890));

    // cases in step 7: numbers with a fractional component, 1e21> x >1 or  -1 > x > -1e21,
    array[item++] = Assert.expectEq("new String( 1.0000001 )", "1.0000001", String(1.0000001));


    // cases in step 8:  fractions between 1 > x > -1, exclusive of 0 and -0

    // cases in step 9:  numbers with 1 significant digit >= 1e+21 or <= 1e-6

    array[item++] = Assert.expectEq("new String( 1000000000000000000000 )", "1e+21", String(1000000000000000000000));
    array[item++] = Assert.expectEq("new String( 10000000000000000000000 )", "1e+22", String(10000000000000000000000));

    //  cases in step 10:  numbers with more than 1 significant digit >= 1e+21 or <= 1e-6
    array[item++] = Assert.expectEq("new String( 1.2345 )", "1.2345", String(1.2345));
    array[item++] = Assert.expectEq("new String( 1.234567890 )", "1.23456789", String(1.234567890));

    array[item++] = Assert.expectEq("new String( .12345 )", "0.12345", String(.12345));
    array[item++] = Assert.expectEq("new String( .012345 )", "0.012345", String(.012345));
    array[item++] = Assert.expectEq("new String( .0012345 )", "0.0012345", String(.0012345));
    array[item++] = Assert.expectEq("new String( .00012345 )", "0.00012345", String(.00012345));
    array[item++] = Assert.expectEq("new String( .000012345 )", "0.000012345", String(.000012345));
    array[item++] = Assert.expectEq("new String( .0000012345 )", "0.0000012345", String(.0000012345));
    array[item++] = Assert.expectEq("new String( .00000012345 )", "1.2345e-7", String(.00000012345));

    array[item++] = Assert.expectEq("15.5.2 new String()", "", String());

    return (array);
}

