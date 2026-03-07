\m5_TLV_version 1d --inlineGen --bestsv --noline: tl-x.org
\SV
/*
Enhanced but Compatible WARP-V Configuration
*/

\m5
   use(m5-1.0)

   // ==============================
   // ISA Configuration
   // ==============================
   var(ISA, RISCV)
   var(EXT_E, 0)
   var(EXT_M, 1)          // Enable Multiply/Divide (RV32IM)
   var(EXT_F, 0)
   var(EXT_B, 0)

   // ==============================
   // Core Configuration
   // ==============================
   var(NUM_CORES, 1)      // MUST remain 1 in this version
   var(NUM_VCS, 2)
   var(NUM_PRIOS, 2)
   var(MAX_PACKET_SIZE, 8)

   // ==============================
   // Control
   // ==============================
   var(soft_reset, 1'b0)
   var(cpu_blocked, 1'b0)

   // ==============================
   // Branch Prediction
   // ==============================
   var(BRANCH_PRED, two_bit)

   // ==============================
   // Pipeline Tuning (Safe Values)
   // ==============================
   var(EXTRA_REPLAY_BUBBLE, 0)
   var(EXTRA_PRED_TAKEN_BUBBLE, 0)
   var(EXTRA_JUMP_BUBBLE, 0)
   var(EXTRA_BRANCH_BUBBLE, 0)
   var(EXTRA_INDIRECT_JUMP_BUBBLE, 0)
   var(EXTRA_NON_PIPELINED_BUBBLE, 1)
   var(EXTRA_TRAP_BUBBLE, 1)

   // ==============================
   // Stage Mapping (SAFE ORDER)
   // ==============================
   var(NEXT_PC_STAGE, 0)
   var(FETCH_STAGE, 0)
   var(DECODE_STAGE, 1)
   var(BRANCH_PRED_STAGE, 1)
   var(REG_RD_STAGE, 1)
   var(EXECUTE_STAGE, 2)
   var(RESULT_STAGE, 2)
   var(REG_WR_STAGE, 3)
   var(MEM_WR_STAGE, 3)
   var(LD_RETURN_ALIGN, 4)

\SV
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/warp-v/71d9a9a9c02e692731b196dec4ca4811a41f0234/warp-v.tlv'])

m4+module_def()
\TLV
   m5+warpv_top()
\SV
endmodule