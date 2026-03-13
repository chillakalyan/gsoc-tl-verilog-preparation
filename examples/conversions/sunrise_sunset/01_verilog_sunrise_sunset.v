module sunrise_sunset (
    input clk,
    input reset
);

// register equivalent to $sun
reg [7:0] sun;

// cycle counter similar to *cyc_cnt
reg [31:0] cyc_cnt;

always @(posedge clk) begin
    if (reset)
        cyc_cnt <= 0;
    else
        cyc_cnt <= cyc_cnt + 1;
end


// equivalent to TL-Verilog stage @0
always @(posedge clk) begin
    if (reset)
        sun <= 8'd0;
    else
        sun <= sun + 8'd1;
end


// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 200);
assign failed = 1'b0;

endmodule
