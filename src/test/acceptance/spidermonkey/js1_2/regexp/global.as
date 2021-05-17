/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

gTestfile = 'global.js';

/**
 Filename:     global.js
 Description:  'Tests RegExp attribute global'

 Author:       Nick Lerissa
 Date:         March 13, 1998
 */

// var SECTION = 'As described in Netscape doc "Whats new in JavaScript 1.2"';
// var VERSION = 'no version';
// var TITLE = 'RegExp: global';


// /xyz/g.global
Assert.expectEq("/xyz/g.global",
    true, /xyz/g.global);

// /xyz/.global
Assert.expectEq("/xyz/.global",
    false, /xyz/.global);

// '123 456 789'.match(/\d+/g)
Assert.expectEq("'123 456 789'.match(/\\d+/g)",
    String(["123", "456", "789"]), String('123 456 789'.match(/\d+/g)));

// '123 456 789'.match(/(\d+)/g)
Assert.expectEq("'123 456 789'.match(/(\\d+)/g)",
    String(["123", "456", "789"]), String('123 456 789'.match(/(\d+)/g)));

// '123 456 789'.match(/\d+/)
Assert.expectEq("'123 456 789'.match(/\\d+/)",
    String(["123"]), String('123 456 789'.match(/\d+/)));

// (new RegExp('[a-z]','g')).global
Assert.expectEq("(new RegExp('[a-z]','g')).global",
    true, (new RegExp('[a-z]', 'g')).global);

// (new RegExp('[a-z]','i')).global
Assert.expectEq("(new RegExp('[a-z]','i')).global",
    false, (new RegExp('[a-z]', 'i')).global);

// '123 456 789'.match(new RegExp('\\d+','g'))
Assert.expectEq("'123 456 789'.match(new RegExp('\\\\d+','g'))",
    String(["123", "456", "789"]), String('123 456 789'.match(new RegExp('\\d+', 'g'))));

// '123 456 789'.match(new RegExp('(\\d+)','g'))
Assert.expectEq("'123 456 789'.match(new RegExp('(\\\\d+)','g'))",
    String(["123", "456", "789"]), String('123 456 789'.match(new RegExp('(\\d+)', 'g'))));

// '123 456 789'.match(new RegExp('\\d+','i'))
Assert.expectEq("'123 456 789'.match(new RegExp('\\\\d+','i'))",
    String(["123"]), String('123 456 789'.match(new RegExp('\\d+', 'i'))));

