module fsm_traffic_light (
    input clk,
    input reset
);

// state registers
reg [1:0] state;
reg [1:0] next_state;
reg [1:0] output_signal;

// cycle counter (similar to *cyc_cnt)
reg [31:0] cyc_cnt;

always @(posedge clk) begin
    if (reset)
        cyc_cnt <= 0;
    else
        cyc_cnt <= cyc_cnt + 1;
end


// State register
always @(posedge clk) begin
    if (reset)
        state <= 2'd0;
    else
        state <= next_state;
end


// Next state logic
always @(*) begin
    case(state)
        2'd0: next_state = 2'd1;
        2'd1: next_state = 2'd2;
        default: next_state = 2'd0;
    endcase
end


// Output logic
always @(posedge clk) begin
    output_signal <= state;
end


// simulation signals
wire passed;
wire failed;

assign passed = (cyc_cnt > 20);
assign failed = 1'b0;

endmodule
