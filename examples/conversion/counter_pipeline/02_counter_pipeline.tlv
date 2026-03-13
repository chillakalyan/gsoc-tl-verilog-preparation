\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |counter_pipeline
      @0
         // Counter register with reset
         $cnt[7:0] = *reset ? 8'd0 : >>1$cnt + 8'd1;

      @1
         // Double the counter
         $double_cnt[8:0] = $cnt * 2;

      @2
         // Final computation
         $final[9:0] = $double_cnt + 10;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
