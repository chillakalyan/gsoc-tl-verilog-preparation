\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         $data_in[7:0] = *cyc_cnt;

      @1
         $reg[7:0] = $data_in;

      @2
         $data_out[7:0] = $reg;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
