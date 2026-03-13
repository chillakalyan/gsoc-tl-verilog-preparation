# Simple Pipeline: Verilog to TL-Verilog Conversion

This example demonstrates how a basic **pipelined computation written in Verilog** can be expressed using **TL-Verilog**.

The design performs simple arithmetic operations across multiple pipeline stages.

---

# Verilog Implementation

In Verilog, each pipeline stage must be implemented using registers that update on the clock edge.

The pipeline performs the following steps:

1. Generate two input values `a` and `b`
2. Compute their sum
3. Multiply the sum by 2

Example pipeline structure:

```
Inputs → Addition → Multiplication → Result
```

Example Verilog logic:

```
always @(posedge clk)
    sum <= a + b;
```

Each stage requires explicitly declaring registers to store intermediate values.

---

# TL-Verilog Implementation

In TL-Verilog, pipeline stages are expressed directly using stage annotations.

Example:

```
@0
$a = *cyc_cnt
$b = *cyc_cnt + 5

@1
$sum = $a + $b

@2
$result = $sum * 2
```

Here:

* `@stage` represents a pipeline stage.
* TL-Verilog automatically inserts the required pipeline registers between stages.

---

# Pipeline Stages

| Stage | Function              |
| ----- | --------------------- |
| `@0`  | Generate input values |
| `@1`  | Compute addition      |
| `@2`  | Multiply the result   |

---

# Key Idea

Both implementations describe the same pipelined hardware behavior.

However:

* **Verilog** requires manually declaring registers for each stage.
* **TL-Verilog** allows designers to describe pipelines using stage annotations.

This simplifies the design of pipelined hardware systems.

---

# Files in this Folder

* `verilog_simple_pipeline.v` → Verilog implementation
* `simple_pipeline.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
