/* -*- Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef __avmplus_Deopt_CL__
#define __avmplus_Deopt_CL__

// TODO: As far as I know, this code is obsolete and should be removed.

namespace avmplus {
// Safepoints for CodegenLIR deoptimization metadata.  We represent them as a
// linked list of first-class objects, with no attempt at compression.  Note
// that this representation is completely hidden from the generic deoptimization
// runtime machinery by the DeoptContext class.

    class CLSafepoint {
    public:
        const uint8_t *pc_;     // address in generated code of the safe point
        const uint8_t *abc_pc_; // pointer into abc bytecode
        int32_t scope_depth_;   // depth of local scope stack at the safepoint
        int32_t stack_depth_;   // depth of operand stack at this abc
        uint8_t *tags_;         // frame_size array of tag bytes.
        uint32_t abc_ix_;       // for debugging. as appears in abcdump

        // These slots are used only for safepoints at calls.
        int pop_args_;
        int call_size_;
        SlotStorageType return_sst_;

        void finish(int argc, const uint8_t *nextpc, Traits *resultType);

    private:
        friend class CLDeoptData;

        CLSafepoint(MethodInfo *mi, const FrameState *state, CLSafepoint *next);

        static SlotStorageType slotType(const FrameState *state, int i);

        CLSafepoint *next_; // next safepoint in function
    };

// Deoptimization metadata for compiled methods generated by CodegenLIR.

    class CLDeoptData {
    public:
        CLDeoptData(MethodInfo *info) : methodInfo(info), safepoints(NULL) {}

        // TODO: These should be private, but are exposed to allow
        // direct manipulation when constructing the metadata in CodegenLIR.
        ptrdiff_t
                frame_offset_;      // offset from native frame base to MethodFrame object
        ptrdiff_t vars_offset_; // offset from native frame base to 'vars' array
        ptrdiff_t tags_offset_; // offset from native frame base to 'tags' array
        ptrdiff_t
                eip_offset_; // offset from native frame base to '_save_eip' variable
        ptrdiff_t nj_frame_size_; // size of native frame (requires fixed_esp)

        CLSafepoint *addSafepoint(const FrameState *state);

        CLSafepoint *findSafepointAtVirtualPc(int32_t vpc);

        CLSafepoint *findSafepointAtNativePc(uint8_t *pc);

        // Return a deoptimizer for the method to which the DeoptData belongs.
        Deoptimizer *createDeoptimizer();

    private:
        MethodInfo *methodInfo;
        CLSafepoint *safepoints; // list of safepoints
    };

} // namespace avmplus

#endif // __avmplus_Deopt_CL_
