module shift_register (
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

// input data
reg [7:0] data;

// shift register stages
reg [7:0] stage1;
reg [7:0] stage2;
reg [7:0] stage3;
reg [7:0] stage4;

// stage 0: generate data
always @(posedge clk) begin
    data <= cyc_cnt;
end

// shift register pipeline
always @(posedge clk) begin
    stage1 <= data;
    stage2 <= stage1;
    stage3 <= stage2;
    stage4 <= stage3;
end

// output
wire [7:0] data_out;
assign data_out = stage4;

// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 20);
assign failed = 1'b0;

endmodule
