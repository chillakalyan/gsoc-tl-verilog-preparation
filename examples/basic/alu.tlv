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
            $b[31:0] = *cyc_cnt + 5;

            // Operation selector
            $opcode[2:0] = *cyc_cnt[2:0];

         @1
            // ALU operations
            $add[31:0] = >>1$a + >>1$b;
            $sub[31:0] = >>1$a - >>1$b;
            $and[31:0] = >>1$a & >>1$b;
            $or[31:0]  = >>1$a | >>1$b;
            $xor[31:0] = >>1$a ^ >>1$b;

         @2
            // Result selection
            $result[31:0] =
               (>>1$opcode == 3'b000) ? >>1$add :
               (>>1$opcode == 3'b001) ? >>1$sub :
               (>>1$opcode == 3'b010) ? >>1$and :
               (>>1$opcode == 3'b011) ? >>1$or  :
                                       >>1$xor;

   // Finish simulation
   *passed = *cyc_cnt > 30;
   *failed = 1'b0;

\SV
   endmodule