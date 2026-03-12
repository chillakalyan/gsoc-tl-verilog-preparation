\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // Input value generated from cycle counter
         $data_in[7:0] = *cyc_cnt;

      @1
         // Shift stage 1
         $stage1[7:0] = $data_in;

      @2
         // Shift stage 2
         $stage2[7:0] = $stage1;

      @3
         // Shift stage 3
         $stage3[7:0] = $stage2;

      @4
         // Output stage
         $data_out[7:0] = $stage3;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
