// Simple RISC-V Style Instruction Pipeline
// Stages: Fetch -> Decode -> Execute -> Writeback

module riscv_pipeline (
    input clk,
    input reset
);

// Program counter
reg [31:0] pc;

// Pipeline registers
reg [31:0] instr;
reg [6:0]  opcode;
reg [4:0]  rd;
reg [31:0] result;
reg [31:0] wb_data;


// Fetch Stage
always @(posedge clk) begin
    if (reset)
        pc <= 32'd0;
    else
        pc <= pc + 32'd4;
end


// Decode Stage
always @(posedge clk) begin
    instr  <= pc;              // dummy instruction
    opcode <= instr[6:0];      // extract opcode
    rd     <= instr[11:7];     // destination register
end


// Execute Stage
always @(posedge clk) begin
    result <= pc + 32'd4;      // simple ALU operation
end


// Writeback Stage
always @(posedge clk) begin
    wb_data <= result;
end

endmodule
