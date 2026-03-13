# Verilog to TL-Verilog Counter Example

This example compares a simple counter written in Verilog and TL-Verilog.

The Verilog version uses a clock (`posedge clk`) and sequential logic to
increment a 4-bit counter every clock cycle.

The TL-Verilog version demonstrates pipeline-based design using Makerchip.

At pipeline stage `@0`, the counter value is initialized using the
Makerchip cycle counter `*cyc_cnt`.

At stage `@1`, the value is passed to the next pipeline stage.

This example highlights how TL-Verilog organizes logic using
pipeline abstraction instead of explicit clocked logic.
