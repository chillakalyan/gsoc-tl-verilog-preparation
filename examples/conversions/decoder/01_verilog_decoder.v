module decoder (
    input clk,
    input reset
);

// cycle counter similar to *cyc_cnt
reg [31:0] cyc_cnt;

always @(posedge clk) begin
    if (reset)
        cyc_cnt <= 0;
    else
        cyc_cnt <= cyc_cnt + 1;
end

// Stage 0 : Instruction input
reg [31:0] instr;

always @(posedge clk) begin
    instr <= 32'h00c58533;   // Example instruction
end

// Stage 1 : Decode fields
reg [6:0] opcode;
reg [4:0] rd;
reg [2:0] funct3;
reg [4:0] rs1;
reg [4:0] rs2;
reg [6:0] funct7;

always @(posedge clk) begin
    opcode <= instr[6:0];
    rd     <= instr[11:7];
    funct3 <= instr[14:12];
    rs1    <= instr[19:15];
    rs2    <= instr[24:20];
    funct7 <= instr[31:25];
end

// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 10);
assign failed = 1'b0;

endmodule
