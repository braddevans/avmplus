/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import avmplus.System

// print all of the args passed to vm

print("argv.length=" + System.argv.length)
for (var i = 0; i < System.argv.length; i++) {
    print("argv[" + i + "]=" + System.argv[i]);
}
