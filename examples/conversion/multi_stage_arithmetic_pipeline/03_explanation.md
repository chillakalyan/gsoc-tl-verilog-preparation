# Multi-Stage Arithmetic Pipeline: Verilog to TL-Verilog Conversion

This example demonstrates how a **multi-stage arithmetic pipeline** written in **Verilog** can be expressed using **TL-Verilog**.

The design performs a sequence of arithmetic operations across several pipeline stages.

## Arithmetic Operations

The pipeline performs the following operations:

1. Generate inputs `a` and `b`
2. Add the inputs
3. Multiply the result by 3
4. Subtract 5
5. Output the final result

## Verilog Implementation

In Verilog, each pipeline stage is implemented using registers updated on the clock edge.

Example pipeline structure:

```
Stage 0 : Input generation
Stage 1 : sum = a + b
Stage 2 : product = sum * 3
Stage 3 : result = product - 5
Stage 4 : final output
```

Each stage uses an `always @(posedge clk)` block to store intermediate results.

Example Verilog logic:

```
always @(posedge clk)
    sum <= a + b;
```

Pipeline registers must be explicitly declared in Verilog.

## TL-Verilog Implementation

In TL-Verilog, pipeline stages are written directly using stage annotations.

Example:

```
@1
$sum = $a + $b;

@2
$product = $sum * 3;

@3
$result = $product - 5;
```

TL-Verilog automatically manages the registers required between pipeline stages.

## Pipeline Stages

| Stage | Operation        |
| ----- | ---------------- |
| `@0`  | Input generation |
| `@1`  | Addition         |
| `@2`  | Multiplication   |
| `@3`  | Subtraction      |
| `@4`  | Output           |

## Key Idea

Both implementations describe the same pipelined computation.

However:

* **Verilog** requires explicit registers for each stage.
* **TL-Verilog** allows designers to describe pipelines directly using stage annotations.

This simplifies the design of complex pipelined hardware systems.

## Files in this Folder

* `verilog_multi_stage_arithmetic_pipeline.v` → Verilog implementation
* `multi_stage_arithmetic_pipeline.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
