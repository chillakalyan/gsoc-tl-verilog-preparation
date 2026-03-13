module register_example (
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

// Stage 0 : Input
reg [7:0] data_in;

always @(posedge clk) begin
    data_in <= cyc_cnt;
end

// Stage 1 : Register
reg [7:0] reg_data;

always @(posedge clk) begin
    reg_data <= data_in;
end

// Stage 2 : Output
reg [7:0] data_out;

always @(posedge clk) begin
    data_out <= reg_data;
end


// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 20);
assign failed = 1'b0;

endmodule
