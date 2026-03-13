# Boat Example: Verilog to TL-Verilog Conversion

This example demonstrates how a simple hardware design written in **Verilog** can be expressed using **TL-Verilog**.

The design models the movement of a boat using two counters:

* `x` → controls the horizontal movement of the boat
* `y` → acts as a wave phase counter

## Verilog Implementation

In Verilog, the logic is implemented using registers and an `always @(posedge clk)` block.

The `x` register increases every clock cycle and resets when it reaches a limit.
The `y` register increments continuously to simulate wave motion.

Example Verilog logic:

```
always @(posedge clk) begin
    if (x > 10'd750)
        x <= 10'd0;
    else
        x <= x + 10'd8;

    y <= y + 8'd1;
end
```

This describes the hardware behavior using **explicit registers and sequential logic**.

## TL-Verilog Implementation

In TL-Verilog, the same behavior is expressed using **pipeline stages** and **implicit state updates**.

Example TL-Verilog logic:

```
@0
$x[9:0] =
   (>>1$x > 10'd750) ? 10'd0 :
   >>1$x + 10'd8;

$y[7:0] = >>1$y + 8'd1;
```

Here:

* `>>1$x` represents the value of `x` from the previous cycle.
* The pipeline stage `@0` indicates when the logic executes.

TL-Verilog automatically handles the required register behavior, reducing the amount of explicit hardware description.

## Key Idea

Both implementations describe the **same hardware behavior**:

* Boat position moves horizontally
* A wave phase counter updates continuously

However, **TL-Verilog expresses the logic using pipeline semantics**, which can simplify hardware design and make pipeline structures easier to manage.

## Files in this Folder

* `verilog_boat.v` → Original Verilog implementation
* `tlv_boat.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation for this conversion example
