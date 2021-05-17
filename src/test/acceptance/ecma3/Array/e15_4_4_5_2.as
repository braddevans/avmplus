/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

// TODO: REVIEW AS4 CONVERSION ISSUE
var SECTION = "15.4.4.5-2";
//     var VERSION = "ECMA_1";
//     var TITLE   = "Array.prototype.sort(comparefn)";


var testcases = [];
getTestCases();

function getTestCases() {
    var S = [];
    var item = 0;

    // array is empty.
    var A = [];
    S[item++] = A;

    // array contains one item
    A = new Array(true);
    S[item++] = A;

    // length of array is 2
    A = [true, false, Boolean(true), Boolean(false), 'true', 'false']
    S[item++] = A;


    A = [];
    A[3] = 'undefined';
    A[6] = null;
    A[8] = 'null';
    A[0] = void 0;
    S[item++] = A;

    /*
        S[item] = "var A = new Array( ";

        var limit = 0x0061;
        for ( var i = 0x007A; i >= limit; i-- ) {
        S[item] += "\'"+ String.fromCharCode(i) +"\'" ;
        if ( i > limit ) {
            S[item] += ",";
        }
        }
    */
    A = new Array((0x007A - 0x0061) + 1);
    S[item] = A;
    var limit = 0x0061;
    var index = 0;
    for (var i = 0x007A; i >= limit; i--) {
        A[index++] = String.fromCharCode(i);
    }

    for (var i = 0; i < S.length; i++) {
        CheckItems(S[i]);
    }

}

function CheckItems(S) {
    var A = S;
    var E = Sort(A);
    A = S;
    A.sort(Compare);
    testcases[testcases.length] = Assert.expectEq(
        S + ";  A.sort(Compare); A.length",
        E.length,
        A.length);

    for (var i = 0; i < E.length; i++) {
        testcases[testcases.length] = Assert.expectEq(
            "A[" + i + "].toString()",
            E[i] + "",
            A[i] + "");

        if (A[i] == void 0 && typeof A[i] == "undefined") {
            testcases[testcases.length] = Assert.expectEq(
                "typeof A[" + i + "]",
                typeof E[i],
                typeof A[i]);
        }
    }
}

/*
function Object_1( value ) {
    this.array = value.split(",");
    this.length = this.array.length;
    for ( var i = 0; i < this.length; i++ ) {
    this[i] = this.array[i];
    }
    this.sort = Array.prototype.sort;
    this.getClass = Object.prototype.toString;
}
*/
function Sort(a) {
    var r1 = a.length;
    for (var i = 0; i < a.length; i++) {
        for (var j = i + 1; j < a.length; j++) {
            var lo = a[i];
            var hi = a[j];
            var c = Compare(lo, hi);
            if (c == 1) {
                a[i] = hi;
                a[j] = lo;
            }
        }
    }
    return a;
}

function Compare(x, y) {
    if (x == void 0 && y == void 0 && typeof x == "undefined" && typeof y == "undefined") {
        return +0;
    }
    if (x == void 0 && typeof x == "undefined") {
        return 1;
    }
    if (y == void 0 && typeof y == "undefined") {
        return -1;
    }
    x = String(x);
    y = String(y);
    if (x < y) {
        return 1;
    }
    if (x > y) {
        return -1;
    }
    return 0;
}
