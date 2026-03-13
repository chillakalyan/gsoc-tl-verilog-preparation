// 4-bit counter example
// This counter increases by 1 every clock cycle

module verilog_counter(
    input clk,          // clock signal
    input reset,        // reset signal
    output reg [3:0] count   // 4-bit output counter
);

// counter logic
always @(posedge clk) begin

    // if reset is active, set counter to 0
    if (reset) begin
        count <= 4'b0000;
    end
    
    // otherwise increase counter value
    else begin
        count <= count + 1;
    end

end

endmodule
