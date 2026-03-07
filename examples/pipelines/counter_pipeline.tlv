\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |counter_pipeline
      @0
         $cnt[7:0] = *reset ? 0 : >>1$cnt + 1;

      @1
         $double_cnt[8:0] = >>1$cnt * 2;

      @2
         $final[9:0] = >>1$double_cnt + 10;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule