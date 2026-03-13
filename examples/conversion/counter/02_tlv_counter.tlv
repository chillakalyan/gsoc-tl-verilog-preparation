\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // Initialize counter from cycle counter
         $count[7:0] = *cyc_cnt;

      @1
         // Counter value propagated to next stage
         $count_out[7:0] = $count;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
