\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // Generate inputs using cycle counter
         $a[7:0] = *cyc_cnt;
         $b[7:0] = *cyc_cnt + 8'd5;

      @1
         // Stage 1 computation
         $sum[8:0] = $a + $b;

      @2
         // Stage 2 computation
         $result[8:0] = $sum * 2;

   // End simulation after some cycles
   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
