/* DO NOT EDIT THIS FILE!  It was generated by utils/apivergen.abc. */

/* This Source Code Form is subject to the terms of the Mozilla Public * License, v. 2.0. If a copy of the MPL was not distributed with this * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
#ifndef api_versions_H_
#define api_versions_H_

namespace avmplus {

enum ApiVersionSeries {
    kApiVersionSeries_AIR,
    kApiVersionSeries_FP
};

enum {
    kApiVersionSeries_count = 2
};

enum ApiVersion {
    kApiVersion_VM_ALLVERSIONS = 0,
    kApiVersion_AIR_1_0 = 1,
    kApiVersion_FP_10_0 = 2,
    kApiVersion_AIR_1_5 = 3,
    kApiVersion_AIR_1_5_1 = 4,
    kApiVersion_FP_10_0_32 = 5,
    kApiVersion_AIR_1_5_2 = 6,
    kApiVersion_FP_10_1 = 7,
    kApiVersion_AIR_2_0 = 8,
    kApiVersion_AIR_2_5 = 9,
    kApiVersion_FP_10_2 = 10,
    kApiVersion_AIR_2_6 = 11,
    kApiVersion_SWF_12 = 12,
    kApiVersion_AIR_2_7 = 13,
    kApiVersion_SWF_13 = 14,
    kApiVersion_AIR_3_0 = 15,
    kApiVersion_SWF_14 = 16,
    kApiVersion_AIR_3_1 = 17,
    kApiVersion_SWF_15 = 18,
    kApiVersion_AIR_3_2 = 19,
    kApiVersion_SWF_16 = 20,
    kApiVersion_AIR_3_3 = 21,
    kApiVersion_SWF_17 = 22,
    kApiVersion_AIR_3_4 = 23,
    kApiVersion_SWF_18 = 24,
    kApiVersion_AIR_3_5 = 25,
    kApiVersion_SWF_19 = 26,
    kApiVersion_AIR_3_6 = 27,
    kApiVersion_SWF_20 = 28,
    kApiVersion_AIR_3_7 = 29,
    kApiVersion_SWF_21 = 30,
    kApiVersion_AIR_3_8 = 31,
	kApiVersion_SWF_22 = 32,
	kApiVersion_AIR_3_9 = 33,
	kApiVersion_SWF_23 = 34,
	kApiVersion_AIR_4_0 = 35,
	kApiVersion_SWF_24 = 36,
	kApiVersion_AIR_13_0 = 37,
	kApiVersion_SWF_25 = 38,
	kApiVersion_AIR_14_0 = 39,
	kApiVersion_SWF_26 = 40,
	kApiVersion_AIR_15_0 = 41,
	kApiVersion_SWF_27 = 42,
	kApiVersion_AIR_16_0 = 43,
	kApiVersion_SWF_28 = 44,
	kApiVersion_AIR_17_0 = 45,
	kApiVersion_SWF_29 = 46,
	kApiVersion_AIR_18_0 = 47,
	kApiVersion_SWF_30 = 48,
	kApiVersion_AIR_19_0 = 49,
//ADD_PREVIOUS_2_VERSIONED_LINES_INCREMENT_LAST_VALUE
    kApiVersion_VM_INTERNAL = 50
//REPLACE_PREVIOUS_LINE_INCREMENT_LAST_VALUE_BY_2
};

enum {
    kApiVersion_count = 51
//REPLACE_PREVIOUS_LINE_INCREMENT_LAST_VALUE_BY_2
};

extern const char* const kApiVersionNames[kApiVersion_count];
extern uint32_t const kApiVersionSeriesMembership[kApiVersion_count];
extern ApiVersion const kApiVersionSeriesTransfer[kApiVersion_count][kApiVersionSeries_count];
extern ApiVersion const kApiVersionFirst[kApiVersionSeries_count];
extern ApiVersion const kApiVersionLatest[kApiVersionSeries_count];

}
#endif // api_versions_H_
