# Register Example: Verilog to TL-Verilog Conversion

This example demonstrates how a simple **register pipeline** written in **Verilog** can be expressed using **TL-Verilog**.

The design passes data through multiple stages before producing an output.

## Verilog Implementation

In Verilog, registers must be explicitly declared and updated using clock-driven logic.

The design consists of three sequential stages:

1. Input generation
2. Register storage
3. Output stage

Example Verilog logic:

```
always @(posedge clk)
    reg_data <= data_in;
```

Each stage uses a clocked `always` block to move data from one register to the next.

## TL-Verilog Implementation

In TL-Verilog, the same behavior can be described using **pipeline stages**.

Example:

```
@0
$data_in = *cyc_cnt;

@1
$reg = $data_in;

@2
$data_out = $reg;
```

Here:

* `@0`, `@1`, and `@2` represent pipeline stages.
* TL-Verilog automatically manages the registers between stages.

## Pipeline Stages

| Stage | Function               |
| ----- | ---------------------- |
| `@0`  | Generate input data    |
| `@1`  | Store data in register |
| `@2`  | Produce output         |

## Key Idea

Both implementations describe the same behavior:

* Data moves through sequential register stages.
* Each stage updates on the clock.

However:

* **Verilog** requires explicit register declarations and clock logic.
* **TL-Verilog** allows designers to express pipelines directly using stage annotations.

This makes pipeline-based designs easier to read and maintain.

## Files in this Folder

* `verilog_register.v` → Verilog implementation
* `register.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
