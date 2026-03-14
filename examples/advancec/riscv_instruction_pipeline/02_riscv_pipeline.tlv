\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module  // Top-level module wrapper

\TLV
   
   // Simple pipeline experiment
   // stages: fetch -> decode -> execute -> writeback

   |pipeline
      @0
         // Fetch stage
         // >>1 means value from previous cycle
         $pc[31:0] = >>1$pc + 32'd4;
         $instr[31:0] = $pc;  // Dummy instruction = PC
      
      @1
         // Decode stage: extract fields
         $opcode[6:0] = $instr[6:0];
         $rd[4:0]     = $instr[11:7];
      
      @2
         // Execute stage (dummy ALU operation)
         $result[31:0] = $pc + 32'd4;
      
      @3
         // Writeback stage
         $wb_data[31:0] = $result;
   
   // Visualization hook for Makerchip
   m5+cpu_viz(@3)
   
   // Simple simulation condition
   *passed = *cyc_cnt > 20;
   *failed = 1'b0;

\SV
   endmodule
