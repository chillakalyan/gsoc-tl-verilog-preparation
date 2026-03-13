// Solar system counter logic derived from TL-Verilog example
// The counter drives the animation timing in Makerchip visualization

module solar_system (
    input clk,
    input reset,
    output reg [7:0] sun
);

always @(posedge clk or posedge reset) begin
    if (reset)
        sun <= 8'd0;
    else
        sun <= sun + 8'd1;
end

endmodule
