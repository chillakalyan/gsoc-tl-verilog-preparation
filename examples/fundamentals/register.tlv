\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // Generate input using cycle counter
         $data_in[7:0] = *cyc_cnt;

      @1
         // Register stage (store value from previous stage)
         $reg[7:0] = >>1$data_in;

      @2
         // Output stage
         $data_out[7:0] = >>1$reg;

   // End simulation after some cycles
   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
