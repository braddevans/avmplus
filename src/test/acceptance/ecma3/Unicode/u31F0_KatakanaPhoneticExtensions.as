/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
include "unicodeUtil.as";
include "unicodeNegativeUtil.as";

// var SECTION = "Katakana Phonetic Extensions";
// var VERSION = "ECMA_3";
// var TITLE = "Test String functions (search, match, split, replace) on all unicode characters";


var array = [];
var item = 0;
getTestCases();

var testcases = array;

function getTestCases(): void {
    // Katakana Phonetic Extensions
    testUnicodeRange(0x31F0, 0x31FF);
    negativeTestUnicodeRange(0x31F0, 0x31FF);
}
