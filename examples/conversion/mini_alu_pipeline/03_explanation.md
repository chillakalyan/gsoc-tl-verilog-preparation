# Mini ALU Pipeline: Verilog to TL-Verilog Conversion

This example demonstrates how a simple **pipelined ALU design written in Verilog** can be expressed using **TL-Verilog**.

The design performs multiple arithmetic operations across different pipeline stages.

---

# Verilog Implementation

In Verilog, pipelined designs require explicitly declaring registers between stages.

The pipeline performs the following steps:

1. Generate input values `a` and `b`
2. Perform addition and subtraction
3. Perform multiplication
4. Compute the final result

Example pipeline structure:

```
Inputs → ALU operations → Multiplication → Final result
```

Example Verilog logic:

```
always @(posedge clk)
    add <= a + b;
```

Each stage requires registers to store intermediate values.

---

# TL-Verilog Implementation

In TL-Verilog, pipeline stages are written directly using stage annotations.

Example:

```
@1
$add = $a + $b;
$sub = $a - $b;

@2
$mul = $a * $b;

@3
$result = $add + $mul;
```

Here:

* Each `@stage` represents a pipeline stage.
* TL-Verilog automatically inserts the required registers between stages.

---

# Pipeline Stages

| Stage | Function                         |
| ----- | -------------------------------- |
| `@0`  | Generate inputs                  |
| `@1`  | Perform addition and subtraction |
| `@2`  | Perform multiplication           |
| `@3`  | Compute final result             |

---

# Key Idea

Both implementations describe the same pipelined hardware behavior.

However:

* **Verilog** requires manually writing pipeline registers.
* **TL-Verilog** allows designers to describe pipelines directly using stage annotations.

This significantly simplifies the design of complex pipelined hardware systems.

---

# Files in this Folder

* `verilog_mini_alu_pipeline.v` → Verilog implementation
* `mini_alu_pipeline.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
