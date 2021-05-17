/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;


var gTestfile = 'regress-229006.js';
//-----------------------------------------------------------------------------
// Note this file contains a greater than 2^16 lines on _purpose_.
// It will properly report failures when run in the js shell however
// will fail to run at all in the browser (if it fails) due to a syntax error.
//
var BUGNUMBER = 229006;
var summary = 'JS parser should not fail when line number &gt 2^16';
var actual = 'FAIL';
var expect = 'PASS';

//printBugNumber(BUGNUMBER);
//printStatus (summary);


for (var i = 0; i < 2; i++) {
}

actual = 'PASS';

Assert.expectEq(summary, expect, actual);

