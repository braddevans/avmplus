/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
package PublicFunctionBody {

public function returnNoParamsInner(): String {
    return "returnNoParams";
}

public function returnNoParams(): String {
    return returnNoParamsInner();
}
}

