\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // Generate inputs
         $a[7:0] = *cyc_cnt;
         $b[7:0] = *cyc_cnt + 8'd3;

      @1
         // Stage 1: Addition
         $sum[8:0] = $a + $b;

      @2
         // Stage 2: Multiplication
         $product[15:0] = $sum * 3;

      @3
         // Stage 3: Subtraction
         $result[15:0] = $product - 16'd5;

      @4
         // Output stage
         $final_out[15:0] = $result;

   *passed = *cyc_cnt > 25;
   *failed = 1'b0;

\SV
   endmodule
