module boat (
    input clk,
    input reset
);

// registers equivalent to $x and $y
reg [9:0] x;
reg [7:0] y;

// cycle counter similar to *cyc_cnt
reg [31:0] cyc_cnt;

always @(posedge clk) begin
    if (reset)
        cyc_cnt <= 0;
    else
        cyc_cnt <= cyc_cnt + 1;
end


// stage equivalent to @0
always @(posedge clk) begin

    // x movement (forward looping)
    if (x > 10'd750)
        x <= 10'd0;
    else
        x <= x + 10'd8;

    // wave phase counter
    y <= y + 8'd1;

end


// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 3000);
assign failed = 1'b0;

endmodule
