\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   /decoder
      |pipe
         @0
            // Example instruction (ADD x10,x11,x12)
            $instr[31:0] = 32'h00c58533;

         @1
            // Decode fields
            $opcode[6:0] = $instr[6:0];
            $rd[4:0]     = $instr[11:7];
            $funct3[2:0] = $instr[14:12];
            $rs1[4:0]    = $instr[19:15];
            $rs2[4:0]    = $instr[24:20];
            $funct7[6:0] = $instr[31:25];

   *passed = *cyc_cnt > 10;
   *failed = 1'b0;

\SV
   endmodule
