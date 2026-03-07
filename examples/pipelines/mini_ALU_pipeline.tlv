\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |alu_pipeline
      @0
         $a[7:0] = *cyc_cnt;
         $b[7:0] = *cyc_cnt + 3;

      @1
         $add[8:0] = >>1$a + >>1$b;
         $sub[8:0] = >>1$a - >>1$b;

      @2
         $mul[15:0] = >>1$a * >>1$b;

      @3
         $result[15:0] = >>1$add + >>1$mul;

   *passed = *cyc_cnt > 30;
   *failed = 1'b0;

\SV
   endmodule