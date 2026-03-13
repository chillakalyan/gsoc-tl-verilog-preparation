module alu_pipeline (
    input clk,
    input reset
);

// cycle counter (similar to *cyc_cnt in Makerchip)
reg [31:0] cyc_cnt;

always @(posedge clk) begin
    if (reset)
        cyc_cnt <= 0;
    else
        cyc_cnt <= cyc_cnt + 1;
end

// Stage 0 : Inputs-
reg [31:0] a;
reg [31:0] b;
reg [2:0] opcode;

always @(posedge clk) begin
    a <= cyc_cnt;
    b <= cyc_cnt + 32'd5;
    opcode <= cyc_cnt[2:0];
end

// Stage 1 : ALU operations
reg [31:0] add;
reg [31:0] sub;
reg [31:0] and_op;
reg [31:0] or_op;
reg [31:0] xor_op;
reg [2:0] opcode_stage1;

always @(posedge clk) begin
    opcode_stage1 <= opcode;

    add <= a + b;
    sub <= a - b;
    and_op <= a & b;
    or_op  <= a | b;
    xor_op <= a ^ b;
end

// Stage 2 : Result select
reg [31:0] result;

always @(posedge clk) begin
    case(opcode_stage1)
        3'b000: result <= add;
        3'b001: result <= sub;
        3'b010: result <= and_op;
        3'b011: result <= or_op;
        default: result <= xor_op;
    endcase
end

// Simulation check
wire passed;
wire failed;

assign passed = (cyc_cnt > 30);
assign failed = 1'b0;

endmodule
