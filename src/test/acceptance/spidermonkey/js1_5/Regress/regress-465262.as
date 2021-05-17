/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;


var gTestfile = 'regress-465262.js';
//-----------------------------------------------------------------------------
var BUGNUMBER = 465262;
var summary = 'truthiness of (3 > null)';
var actual = '';
var expect = '';


//-----------------------------------------------------------------------------
addtestcases();

//-----------------------------------------------------------------------------

function addtestcases() {

    //printBugNumber(BUGNUMBER);
    //printStatus (summary);


    expect = 'true,true,true,true,true,';

    for (j = 0; j < 5; ++j) print(actual += "" + (3 > null) + ',')


    Assert.expectEq(summary, expect, actual);


}

