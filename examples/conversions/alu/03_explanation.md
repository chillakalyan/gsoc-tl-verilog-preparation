# ALU: Verilog to TL-Verilog Conversion

This example shows how a simple **Arithmetic Logic Unit (ALU)** written in **Verilog** can be implemented using **TL-Verilog**.

## Verilog Version

The Verilog code implements the ALU using an `always` block and a `case` statement.
The operation is selected using the `opcode` input.

Supported operations:

* `000` → Addition (`a + b`)
* `001` → Subtraction (`a - b`)
* `010` → AND (`a & b`)
* `011` → OR (`a | b`)
* otherwise → XOR (`a ^ b`)

The Verilog design performs the operation based on the opcode and stores the result in `result`.

## TL-Verilog Version

The TL-Verilog version organizes the design into **pipeline stages**.

Pipeline stages used:

* **@0** → Generate inputs (`a`, `b`, `opcode`)
* **@1** → Perform ALU operations (add, sub, and, or, xor)
* **@2** → Select the final result based on the opcode

TL-Verilog makes pipeline design easier because stages are written explicitly using `@stage`.

## Key Idea

The example demonstrates how **TL-Verilog separates logic into stages**, which helps when designing **pipelined hardware systems**.

## Files in this Folder

* `verilog_alu.v` → Verilog implementation
* `tlv_alu.tlv` → TL-Verilog implementation
* `explanation.md` → Description of the example
