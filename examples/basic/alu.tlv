\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   /alu
      |pipe
         @0
            // Inputs
            $a[31:0] = *cyc_cnt;
            $b[31:0] = *cyc_cnt + 32'd5;

            // Operation selector
            $opcode[2:0] = *cyc_cnt[2:0];

         @1
            // ALU operations
            $add[31:0] = $a + $b;
            $sub[31:0] = $a - $b;
            $and[31:0] = $a & $b;
            $or[31:0]  = $a | $b;
            $xor[31:0] = $a ^ $b;

         @2
            // Result selection
            $result[31:0] =
               ($opcode == 3'b000) ? $add :
               ($opcode == 3'b001) ? $sub :
               ($opcode == 3'b010) ? $and :
               ($opcode == 3'b011) ? $or  :
                                     $xor;

   // Finish simulation
   *passed = *cyc_cnt > 30;
   *failed = 1'b0;

\SV
   endmodule
