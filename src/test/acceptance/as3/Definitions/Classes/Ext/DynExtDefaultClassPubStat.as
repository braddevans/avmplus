/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


import DefaultClass.*;

import com.adobe.test.Assert;

// var SECTION = "Definitions";       // provide a document reference (ie, ECMA section)
// var VERSION = "AS 3.0";  // Version of JavaScript or ECMA
// var TITLE   = "public static extend Default Class";       // Provide ECMA section title or a description
var BUGNUMBER = "";


/**
 * Calls to Assert.expectEq here. Assert.expectEq is a function that is defined
 * in shell.js and takes three arguments:
 * - a string representation of what is being tested
 * - the expected result
 * - the actual result
 *
 * For example, a test might look like this:
 *
 * var helloWorld = "Hello World";
 *
 * Assert.expectEq(
 * "var helloWorld = 'Hello World'",   // description of the test
 *  "Hello World",                     // expected result
 *  helloWorld );                      // actual result
 *
 */


arr = [1, 2, 3];

//*******************************************
// access public static method of parent
// class from outside of class
//*******************************************

Assert.expectEq("*** Public Static Methods of parent from sub class ***", 1, 1);
Assert.expectEq("DynExtDefaultClassPubStat.setPubStatArray(arr), DynExtDefaultClassPubStat.getPubStatArray()", arr,
    (DynExtDefaultClassPubStat.setPubStatArray(arr), DynExtDefaultClassPubStat.getPubStatArray()));


// ********************************************
// access public static method from a default
// method of a sub class
//
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static method from default method of sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testDefSubArray(arr)", arr, (EXTDCLASS.testDefSubArray(arr)));

// ********************************************
// access public static method from a public
// method of a sub class
//
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static method from public method of sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.pubSubSetArray(arr), EXTDCLASS.pubSubGetArray()", arr, (EXTDCLASS.pubSubSetArray(arr), EXTDCLASS.pubSubGetArray()));


// ********************************************
// access public static method from a private
// method of a sub class
//
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static method from private method of sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testPrivSubArray(arr)", arr, EXTDCLASS.testPrivSubArray(arr));


// ********************************************
// access public static method from a final
// method of a sub class
//
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static method from final method of sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testFinSubArray(arr)", arr, (EXTDCLASS.testFinSubArray(arr)));

/*
// ********************************************
// access public static method from a static
// method of a sub class
//
// ********************************************
Assert.expectEq( "*** Access public static method from static method of sub class ***", 1, 1 );
Assert.expectEq( "DynExtDefaultClassPubStat.testStatSubArray(arr)", arr,
             (EXTDCLASS.testStatSubArray(arr)) );
*/

// ********************************************
// access public static method from a public static
// method of a sub class
//
// ********************************************

Assert.expectEq("*** Access public static method from public static method of sub class ***", 1, 1);
Assert.expectEq("DynExtDefaultClassPubStat.pubStatSubSetArray(arr), DynExtDefaultClassPubStat.pubStatSubGetArray()", arr,
    (DynExtDefaultClassPubStat.pubStatSubSetArray(arr), DynExtDefaultClassPubStat.pubStatSubGetArray()));

// ********************************************
// access public static method from a private static
// method of a sub class
//
// ********************************************

var EXTDEFAULTCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static method from private static method of sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testPrivStatSubArray(arr)", arr,
    EXTDCLASS.testPrivStatSubArray(arr));


// ********************************************
// access public static property from
// default method in sub class
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static property from default method in sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testPubStatDefSubArray(arr)", arr, (EXTDCLASS.testPubStatDefSubArray(arr)));


// ********************************************
// access public static property from
// public method in sub class
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static property from public method in sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.pubSubSetDPArray(arr), EXTDCLASS.pubSubGetDPArray()", arr, (EXTDCLASS.pubSubSetDPArray(arr), EXTDCLASS.pubSubGetDPArray()));
// ********************************************
// access public static property from
// private method in sub class
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static property from private method in sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testPrivStatSubDPArray(arr)", arr, (EXTDCLASS.testPrivStatSubDPArray(arr)));


// ********************************************
// access public static property from
// final method in sub class
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq("*** Access public static property from final method in sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testPrivStatFinSubDPArray(arr)", arr, (EXTDCLASS.testPrivStatFinSubDPArray(arr)));

// ********************************************
// access public static property from
// static method in sub class
// ********************************************

Assert.expectEq("*** Access public static property from static method in sub class ***", 1, 1);
Assert.expectEq("EXTDCLASS.testStatSubDPArray(arr)", arr,
    (EXTDCLASS.testStatSubDPArray(arr)));
/*
// ********************************************
// access public static property from
// public static method in sub class
// ********************************************

Assert.expectEq( "*** Access public static property from public static method in sub class ***", 1, 1 );
Assert.expectEq( "PubExtDefaultClassPubStat.pubStatSubSetSPArray(arr), PubExtDefaultClassPubStat.pubStatSubGetSPArray()", arr,
             (PubExtDefaultClassPubStat.pubStatSubSetSPArray(arr), PubExtDefaultClassPubStat.pubStatSubGetSPArray()) );

// ********************************************
// access public static property from
// private static method in sub class
// ********************************************

EXTDCLASS = new DynExtDefaultClassPubStat();
Assert.expectEq( "*** Access public static property from private static method in sub class ***", 1, 1 );
Assert.expectEq( "EXTDCLASS.testPrivStatSubPArray(arr)", arr,
              EXTDCLASS.testPrivStatSubPArray(arr));
*/

// displays results.
