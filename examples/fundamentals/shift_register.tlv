\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // Input value generated from cycle counter
         $data[7:0] = *cyc_cnt;

      @4
         // Data appears after 4 pipeline stages
         $data_out[7:0] = $data;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
