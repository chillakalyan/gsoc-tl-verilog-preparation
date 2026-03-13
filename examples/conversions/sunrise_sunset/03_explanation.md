# Sunrise–Sunset Example: Verilog to TL-Verilog Conversion

This example demonstrates how a simple design written in **Verilog** can be expressed using **TL-Verilog**.

The design simulates the motion of the **sun during sunrise and sunset**. A counter is used to generate a changing value that controls the position of the sun in the visualization.

## Verilog Implementation

In Verilog, the design uses a register that updates every clock cycle. The counter continuously increases and represents the movement of the sun over time.

Example Verilog logic:

```
always @(posedge clk) begin
    sun <= sun + 1;
end
```

This approach requires explicitly declaring registers and updating them using clock-driven sequential logic.

## TL-Verilog Implementation

In TL-Verilog, the same behavior is expressed using **pipeline stages** and **implicit state updates**.

Example TL-Verilog logic:

```
@0
$sun[7:0] = >>1$sun + 8'd1;
```

Here:

* `>>1$sun` represents the value of `sun` from the previous cycle.
* `@0` represents the pipeline stage where the logic executes.

TL-Verilog automatically manages the register behavior, reducing the amount of explicit sequential logic required in the design.

## Visualization

The TL-Verilog file also includes a **Makerchip visualization (`viz_js`)** which displays:

* The sky background
* Mountains
* The moving sun
* Color changes representing sunrise and sunset

This visualization is used only for simulation and demonstration purposes and is not part of the synthesizable hardware.

## Key Idea

Both implementations describe the same hardware behavior:

* A counter increments every clock cycle.
* The counter value drives the motion of the sun in the visualization.

The TL-Verilog implementation expresses the same logic using **pipeline semantics**, which can simplify hardware design and improve readability.

## Files in this Folder

* `sunrise_sunset.v` → Verilog implementation
* `sunrise_sunset.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
