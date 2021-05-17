/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.7.2";
//     var VERSION = "ECMA_1";
//     var TITLE   = "The Number Constructor";


var testcases = [];

testcases = getTestCases();


function getTestCases() {
    var array = [];
    var item = 0;

    //  To verify that the object's prototype is the Number.prototype, check to see if the     //  object's
    //  constructor property is the same as Number.prototype.constructor.

    array[item++] = Assert.expectEq("(new Number()).constructor", Number.prototype.constructor, (Number()).constructor);

    array[item++] = Assert.expectEq("typeof (new Number())", "number", typeof (Number()));
    array[item++] = Assert.expectEq("(new Number()).valueOf()", 0, (Number()).valueOf());


    NUMB = Number();

    array[item++] = Assert.expectEq(
        "NUMB = new Number();NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "0",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(0)).constructor", Number.prototype.constructor, (Number(0)).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(0))", "number", typeof (Number(0)));
    array[item++] = Assert.expectEq("(new Number(0)).valueOf()", 0, (Number(0)).valueOf());

    NUMB = Number(0);

    array[item++] = Assert.expectEq(
        "NUMB = new Number(0);NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "0",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(1)).constructor", Number.prototype.constructor, (Number(1)).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(1))", "number", typeof (Number(1)));
    array[item++] = Assert.expectEq("(new Number(1)).valueOf()", 1, (Number(1)).valueOf());

    NUMB = Number(1);

    array[item++] = Assert.expectEq(
        "NUMB = new Number(1);NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "1",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(-1)).constructor", Number.prototype.constructor, (Number(-1)).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(-1))", "number", typeof (Number(-1)));
    array[item++] = Assert.expectEq("(new Number(-1)).valueOf()", -1, (Number(-1)).valueOf());

    NUMB = Number(-1);

    array[item++] = Assert.expectEq(
        "NUMB = new Number(-1);NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "-1",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(Number.NaN)).constructor", Number.prototype.constructor, (Number(Number.NaN)).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(Number.NaN))", "number", typeof (Number(Number.NaN)));
    array[item++] = Assert.expectEq("(new Number(Number.NaN)).valueOf()", Number.NaN, (Number(Number.NaN)).valueOf());

    NUMB = Number(Number.NaN);

    array[item++] = Assert.expectEq(
        "NUMB = new Number(Number.NaN);NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "NaN",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number('string')).constructor", Number.prototype.constructor, (Number('string')).constructor);
    array[item++] = Assert.expectEq("typeof (new Number('string'))", "number", typeof (Number('string')));
    array[item++] = Assert.expectEq("(new Number('string')).valueOf()", Number.NaN, (Number('string')).valueOf());

    NUMB = Number('string');

    array[item++] = Assert.expectEq(
        "NUMB = new Number('string');NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "NaN",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(new String())).constructor", Number.prototype.constructor, (Number(String())).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(new String()))", "number", typeof (Number(String())));
    array[item++] = Assert.expectEq("(new Number(new String())).valueOf()", 0, (Number(String())).valueOf());

    NUMB = Number(String());

    array[item++] = Assert.expectEq(
        "NUMB = new Number(new String());NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "0",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number('')).constructor", Number.prototype.constructor, (Number('')).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(''))", "number", typeof (Number('')));
    array[item++] = Assert.expectEq("(new Number('')).valueOf()", 0, (Number('')).valueOf());

    NUMB = Number('');

    array[item++] = Assert.expectEq(
        "NUMB = new Number('');NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "0",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(Number.POSITIVE_INFINITY)).constructor", Number.prototype.constructor, (Number(Number.POSITIVE_INFINITY)).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(Number.POSITIVE_INFINITY))", "number", typeof (Number(Number.POSITIVE_INFINITY)));
    array[item++] = Assert.expectEq("(new Number(Number.POSITIVE_INFINITY)).valueOf()", Number.POSITIVE_INFINITY, (Number(Number.POSITIVE_INFINITY)).valueOf());

    NUMB = Number(Number.POSITIVE_INFINITY);

    array[item++] = Assert.expectEq(
        "NUMB = new Number(Number.POSITIVE_INFINITY);NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "Infinity",
        NUMB.toString());

    array[item++] = Assert.expectEq("(new Number(Number.NEGATIVE_INFINITY)).constructor", Number.prototype.constructor, (Number(Number.NEGATIVE_INFINITY)).constructor);
    array[item++] = Assert.expectEq("typeof (new Number(Number.NEGATIVE_INFINITY))", "number", typeof (Number(Number.NEGATIVE_INFINITY)));
    array[item++] = Assert.expectEq("(new Number(Number.NEGATIVE_INFINITY)).valueOf()", Number.NEGATIVE_INFINITY, (Number(Number.NEGATIVE_INFINITY)).valueOf());

    NUMB = Number(Number.NEGATIVE_INFINITY);

    array[item++] = Assert.expectEq(
        "NUMB = new Number(Number.NEGATIVE_INFINITY);NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "-Infinity",
        NUMB.toString());


    array[item++] = Assert.expectEq("(new Number()).constructor", Number.prototype.constructor, (Number()).constructor);
    array[item++] = Assert.expectEq("typeof (new Number())", "number", typeof (Number()));
    array[item++] = Assert.expectEq("(new Number()).valueOf()", 0, (Number()).valueOf());

    NUMB = Number();

    array[item++] = Assert.expectEq(
        "NUMB = new Number();NUMB.toString=Object.prototype.toString;NUMB.toString()",
        "0",
        NUMB.toString());

    array[item++] = Assert.expectEq("new Number()", 0, Number());
    array[item++] = Assert.expectEq("new Number(void 0)", Number.NaN, Number(void 0));
    array[item++] = Assert.expectEq("new Number(null)", 0, Number(null));

    array[item++] = Assert.expectEq("new Number(new Number())", 0, Number(Number()));
    array[item++] = Assert.expectEq("new Number(0)", 0, Number(0));
    array[item++] = Assert.expectEq("new Number(1)", 1, Number(1));
    array[item++] = Assert.expectEq("new Number(-1)", -1, Number(-1));
    array[item++] = Assert.expectEq("new Number(NaN)", Number.NaN, Number(Number.NaN));
    array[item++] = Assert.expectEq("new Number('string')", Number.NaN, Number("string"));
    array[item++] = Assert.expectEq("new Number(new String())", 0, Number(String()));
    array[item++] = Assert.expectEq("new Number('')", 0, Number(""));
    array[item++] = Assert.expectEq("new Number(Infinity)", Number.POSITIVE_INFINITY, Number("Infinity"));

    array[item++] = Assert.expectEq("new Number(-Infinity)", Number.NEGATIVE_INFINITY, Number("-Infinity"));

    array[item++] = Assert.expectEq("new Number(3.141592653589793)", Math.PI, Number("3.141592653589793"));

    array[item++] = Assert.expectEq("new Number(4294967297)", (Math.pow(2, 32) + 1), Number("4294967297"));

    array[item++] = Assert.expectEq("new Number(1e2000)", Infinity, Number(1e2000));

    array[item++] = Assert.expectEq("new Number(-1e2000)", -Infinity, Number(-1e2000));

    array[item++] = Assert.expectEq("new Number(1e-2000)", 0, Number(1e-2000));

    array[item++] = Assert.expectEq("new Number(1/1e-2000)", Infinity, Number(1 / 1e-2000));

    array[item++] = Assert.expectEq("new Number(true)", 1, Number(true));

    array[item++] = Assert.expectEq("new Number(false)", 0, Number(false));

    array[item++] = Assert.expectEq("new Number(new Boolean(false)", 0, Number(Boolean(false)));

    array[item++] = Assert.expectEq("new Number(new String('Number.POSITIVE_INFINITY')", Infinity, Number(String(Number.POSITIVE_INFINITY)));

    array[item++] = Assert.expectEq("new Number(new Number(false)", 0, Number(Number(false)));


    array[item++] = Assert.expectEq("new Number('3000000000.25')", (3000000000.25), Number("3000000000.25"));

    array[item++] = Assert.expectEq("new Number(-'3000000000.25')", (-3000000000.25), Number(-"3000000000.25"));

    array[item++] = Assert.expectEq("new Number('1.797693134862316e+308')", (Number.MAX_VALUE + ""), Number("1.797693134862316e+308") + "");
    // https://bugzilla.mozilla.org/show_bug.cgi?id=555805 - MIN_VALUE is not a cross-platform constant,
    // This test is not useful.  The number formatter prevents us from making it useful.
    //array[item++] = Assert.expectEq( "new Number('4.9406564584124654e-324')",(Number.MIN_VALUE+""),new Number("4.9406564584124654e-324")+"" );
    array[item++] = Assert.expectEq("new Number(new MyObject(100))", 100, Number(new MyObject(100)));

    var s: String =
        "0xFFFFFFFFFFFFF80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    array[item++] = Assert.expectEq("new Number(s)", parseInt(s), Number(s));

    array[item++] = Assert.expectEq("new Number(-s)", ((-5.03820925841965e+263) + ""), Number(-s) + "");

    array[item++] = Assert.expectEq(
        "new Number(-\"\")",
        0,
        Number(-""));

    array[item++] = Assert.expectEq(
        "new Number(-\" \")",
        0,
        Number(-" "));
    array[item++] = Assert.expectEq(
        "new Number(-\"999\")",
        -999,
        Number(-"999"));

    array[item++] = Assert.expectEq(
        "new Number(-\" 999\")",
        -999,
        Number(-" 999"));

    array[item++] = Assert.expectEq(
        "new Number(-\"\\t999\")",
        -999,
        Number(-"\t999"));

    array[item++] = Assert.expectEq(
        "new Number(-\"013  \")",
        -13,
        Number(-"013  "));

    array[item++] = Assert.expectEq(
        "new Number(-\"999\\t\")",
        -999,
        Number(-"999\t"));

    array[item++] = Assert.expectEq(
        "new Number(-\"-Infinity\")",
        Infinity,
        Number(-"-Infinity"));

    array[item++] = Assert.expectEq(
        "new Number(-\"-infinity\")",
        NaN,
        Number(-"-infinity"));


    array[item++] = Assert.expectEq(
        "new Number(-\"+Infinity\")",
        -Infinity,
        Number(-"+Infinity"));

    array[item++] = Assert.expectEq(
        "new Number(-\"+Infiniti\")",
        NaN,
        Number(-"+Infiniti"));

    array[item++] = Assert.expectEq(
        "new Number(- -\"0x80000000\")",
        2147483648,
        Number(--"0x80000000"));

    array[item++] = Assert.expectEq(
        "new Number(- -\"0x100000000\")",
        4294967296,
        Number(--"0x100000000"));

    array[item++] = Assert.expectEq(
        "new Number(- \"-0x123456789abcde8\")",
        81985529216486880,
        Number(-"-0x123456789abcde8"));


    return (array);
}

function MyObject(value) {
    this.value = value;
    this.valueOf = function () {
        return this.value;
    }
}
