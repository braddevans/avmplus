/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/*
 * Public Class PublicClass
 * Class methods
 *
 */

package PublicClassImpDefIntname {

public class PublicClass implements DefaultInt {

    public function deffunc(): String {
        return "PASSED"
    }


    public function accdeffunc() {
        return DefaultInt::deffunc();
    }

    // access default function deffunc

}

}
