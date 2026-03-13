\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   |pipeline
      @0
         // State register
         $state[1:0] = >>1$next_state;

      @1
         // Next state logic
         $next_state[1:0] =
            ($state == 2'd0) ? 2'd1 :
            ($state == 2'd1) ? 2'd2 :
                               2'd0;

      @2
         // Output logic
         $output[1:0] = $state;

   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
