# Solar System Example: Verilog to TL-Verilog Conversion

This example demonstrates how a simple design written in **Verilog** can be represented using **TL-Verilog**.

The design simulates the motion of planets around the sun. A counter is used to generate changing values that represent orbital movement.

## Verilog Implementation

In Verilog, the design uses registers and sequential logic to update a counter every clock cycle.

Example Verilog logic:

```
always @(posedge clk) begin
    sun <= sun + 1;
end
```

The counter continuously increases and can be used to generate positions or angles for planets in the solar system visualization.

This approach requires explicit register definitions and clock-driven updates.

## TL-Verilog Implementation

In TL-Verilog, the same behavior can be described using pipeline stages.

Example TL-Verilog logic:

```
@0
$sun[7:0] = >>1$sun + 8'd1;
```

Here:

* `>>1$sun` represents the value of `sun` from the previous cycle.
* The pipeline stage `@0` defines when the logic is evaluated.

TL-Verilog automatically manages the required registers, reducing the amount of explicit sequential logic.

## Visualization

The TL-Verilog example includes a **Makerchip visualization (`viz_js`)** that displays:

* The Sun
* Orbiting planets
* Circular orbital motion

This visualization is used only for simulation and demonstration purposes and is not part of synthesizable hardware.

## Key Idea

Both implementations describe the same behavior:

* A counter continuously updates.
* The counter value drives the motion of objects in the visualization.

TL-Verilog provides a cleaner way to describe sequential behavior using **pipeline semantics**.

## Files in this Folder

* `solar_system.v` → Verilog implementation
* `solar_system.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
