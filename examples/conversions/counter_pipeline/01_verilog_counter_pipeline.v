module counter_pipeline (
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

// Stage 0 : Counter
reg [7:0] cnt;

always @(posedge clk) begin
    if (reset)
        cnt <= 8'd0;
    else
        cnt <= cnt + 8'd1;
end

// Stage 1 : Double counter
reg [8:0] double_cnt;

always @(posedge clk) begin
    double_cnt <= cnt * 2;
end

// Stage 2 : Final computation
reg [9:0] final_value;

always @(posedge clk) begin
    final_value <= double_cnt + 10;
end

// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 20);
assign failed = 1'b0;

endmodule
