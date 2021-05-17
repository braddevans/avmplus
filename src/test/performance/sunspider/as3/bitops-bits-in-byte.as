/*
 Copyright (C) 2007 Apple Inc.  All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// Copyright (c) 2004 by Arthur Langereis (arthur_ext at domain xfinitegames, tld com)


// 1 op = 2 assigns, 16 compare/branches, 8 ANDs, (0-8) ADDs, 8 SHLs
// O(n)
package {

function bitsinbyte(b: int): int {
    var m: int = 1, c: int = 0;
    while (m < 0x100) {
        if (b & m) c++;
        m <<= 1;
    }
    return c;
}

function TimeFunc(func: Function): int {
    var res: int, x: int, y: int, t: int;
    for (x = 0; x < 350; x++)
        for (y = 0; y < 256; y++) res = func(y);
    return res;
}

if (CONFIG::desktop) {
    var start: Number = new Date();
    var res: int = TimeFunc(bitsinbyte);
    var totaltime: Number = new Date() - start;
} else { // mobile
    var start: int = getTimer();
    var res: int = TimeFunc(bitsinbyte);
    var totaltime: int = getTimer() - start;
}
print("bitsinbyte()=" + res);
if (res == 8)
    print("metric time " + totaltime);
else
    print("error bitsinbyte() expected 8 got " + res);
}
