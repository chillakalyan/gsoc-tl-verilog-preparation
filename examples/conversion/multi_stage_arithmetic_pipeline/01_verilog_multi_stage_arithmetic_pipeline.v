module multi_stage_arithmetic_pipeline (
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

// Stage 0 : Inputs
reg [7:0] a;
reg [7:0] b;

always @(posedge clk) begin
    a <= cyc_cnt;
    b <= cyc_cnt + 8'd3;
end

// Stage 1 : Addition
reg [8:0] sum;

always @(posedge clk) begin
    sum <= a + b;
end

// Stage 2 : Multiplication
reg [15:0] product;

always @(posedge clk) begin
    product <= sum * 3;
end

// Stage 3 : Subtraction
reg [15:0] result;

always @(posedge clk) begin
    result <= product - 16'd5;
end

// Stage 4 : Output
reg [15:0] final_out;

always @(posedge clk) begin
    final_out <= result;
end

// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 25);
assign failed = 1'b0;

endmodule
