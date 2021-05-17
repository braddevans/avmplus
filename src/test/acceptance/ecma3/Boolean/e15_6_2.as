/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import com.adobe.test.Assert;

//     var SECTION = "15.6.2";
//     var VERSION = "ECMA_1";
//     var TITLE   = "15.6.2 The Boolean Constructor; 15.6.2.1 new Boolean( value ); 15.6.2.2 new Boolean()";


var testcases = getTestCases();


function getTestCases() {
    var array = [];
    var item = 0;

    array[item++] = Assert.expectEq("typeof (new Boolean(1))", "boolean", typeof (Boolean(1)));
    array[item++] = Assert.expectEq("(new Boolean(1)).constructor", Boolean.prototype.constructor, (Boolean(1)).constructor);

    var TESTBOOL: Boolean = Boolean(1);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(1)).valueOf()", true, (Boolean(1)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(1)", "boolean", typeof (Boolean(1)));
    array[item++] = Assert.expectEq("(new Boolean(0)).constructor", Boolean.prototype.constructor, (Boolean(0)).constructor);

    var TESTBOOL: Boolean = Boolean(0);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "false", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(0)).valueOf()", false, (Boolean(0)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(0)", "boolean", typeof (Boolean(0)));
    array[item++] = Assert.expectEq("(new Boolean(-1)).constructor", Boolean.prototype.constructor, (Boolean(-1)).constructor);

    var TESTBOOL: Boolean = Boolean(-1);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(-1)).valueOf()", true, (Boolean(-1)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(-1)", "boolean", typeof (Boolean(-1)));
    array[item++] = Assert.expectEq("(new Boolean('')).constructor", Boolean.prototype.constructor, (Boolean('')).constructor);

    var TESTBOOL: Boolean = Boolean("");
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "false", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean('')).valueOf()", false, (Boolean("")).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean('')", "boolean", typeof (Boolean("")));
    array[item++] = Assert.expectEq("(new Boolean('1')).constructor", Boolean.prototype.constructor, (Boolean("1")).constructor);

    var TESTBOOL: Boolean = Boolean('1');
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean('1')).valueOf()", true, (Boolean('1')).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean('1')", "boolean", typeof (Boolean('1')));
    array[item++] = Assert.expectEq("(new Boolean('0')).constructor", Boolean.prototype.constructor, (Boolean('0')).constructor);

    var TESTBOOL: Boolean = Boolean('0');
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean('0')).valueOf()", true, (Boolean('0')).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean('0')", "boolean", typeof (Boolean('0')));
    array[item++] = Assert.expectEq("(new Boolean('-1')).constructor", Boolean.prototype.constructor, (Boolean('-1')).constructor);

    var TESTBOOL: Boolean = Boolean('-1');
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean('-1')).valueOf()", true, (Boolean('-1')).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean('-1')", "boolean", typeof (Boolean('-1')));
    array[item++] = Assert.expectEq("(new Boolean(new Boolean(true))).constructor", Boolean.prototype.constructor, (Boolean(Boolean(true))).constructor);

    var TESTBOOL: Boolean = Boolean(Boolean(true));
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(new Boolean(true))).valueOf()", true, (Boolean(Boolean(true))).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(new Boolean(true))", "boolean", typeof (Boolean(Boolean(true))));
    array[item++] = Assert.expectEq("(new Boolean(Number.NaN)).constructor", Boolean.prototype.constructor, (Boolean(Number.NaN)).constructor);

    var TESTBOOL: Boolean = Boolean(Number.NaN);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "false", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(Number.NaN)).valueOf()", false, (Boolean(Number.NaN)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(Number.NaN)", "boolean", typeof (Boolean(Number.NaN)));
    array[item++] = Assert.expectEq("(new Boolean(null)).constructor", Boolean.prototype.constructor, (Boolean(null)).constructor);

    var TESTBOOL: Boolean = Boolean(null);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "false", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(null)).valueOf()", false, (Boolean(null)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(null)", "boolean", typeof (Boolean(null)));
    array[item++] = Assert.expectEq("(new Boolean(void 0)).constructor", Boolean.prototype.constructor, (Boolean(void 0)).constructor);

    var TESTBOOL: Boolean = Boolean(void 0);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "false", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(void 0)).valueOf()", false, (Boolean(void 0)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(void 0)", "boolean", typeof (Boolean(void 0)));
    array[item++] = Assert.expectEq("(new Boolean(Number.POSITIVE_INFINITY)).constructor", Boolean.prototype.constructor, (Boolean(Number.POSITIVE_INFINITY)).constructor);

    var TESTBOOL: Boolean = Boolean(Number.POSITIVE_INFINITY);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(Number.POSITIVE_INFINITY)).valueOf()", true, (Boolean(Number.POSITIVE_INFINITY)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(Number.POSITIVE_INFINITY)", "boolean", typeof (Boolean(Number.POSITIVE_INFINITY)));
    array[item++] = Assert.expectEq("(new Boolean(Number.NEGATIVE_INFINITY)).constructor", Boolean.prototype.constructor, (Boolean(Number.NEGATIVE_INFINITY)).constructor);

    var TESTBOOL: Boolean = Boolean(Number.NEGATIVE_INFINITY);
    array[item++] = Assert.expectEq("TESTBOOL.toString()", "true", TESTBOOL.toString());
    array[item++] = Assert.expectEq("(new Boolean(Number.NEGATIVE_INFINITY)).valueOf()", true, (Boolean(Number.NEGATIVE_INFINITY)).valueOf());
    array[item++] = Assert.expectEq("typeof new Boolean(Number.NEGATIVE_INFINITY)", "boolean", typeof (Boolean(Number.NEGATIVE_INFINITY)));
    array[item++] = Assert.expectEq("(new Boolean(Number.NEGATIVE_INFINITY)).constructor", Boolean.prototype.constructor, (Boolean(Number.NEGATIVE_INFINITY)).constructor);

//TO-DO: Removing " , " from the Assert.expectEq to make it pass 3 arguments instead of 4 arguments e.g.
    //   array[item++] = Assert.expectEq( "15.6.2.2",   "typeof new Boolean()",        "boolean",    typeof (new Boolean()) ); 
    // is changed to 
    //    array[item++] = Assert.expectEq( "15.6.2.2 typeof new Boolean()",        "boolean",    typeof (new Boolean()) );
    var TESTBOOL: Boolean = Boolean();
    array[item++] = Assert.expectEq("15.6.2.2 TESTBOOL.toString()", "false", TESTBOOL.toString());
    array[item++] = Assert.expectEq("15.6.2.2 (new Boolean()).valueOf()", false, (Boolean()).valueOf());
    array[item++] = Assert.expectEq("15.6.2.2 typeof new Boolean()", "boolean", typeof (Boolean()));

    return (array);
}
