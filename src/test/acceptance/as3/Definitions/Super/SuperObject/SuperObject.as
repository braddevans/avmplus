/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
// 16.3 class with explicit base, super() initialize Object
package SuperObject {

public class SuperObject {
    function SuperObject() {
        super() // should call Object constructor
    }
}
}
