# Counter Pipeline: Verilog to TL-Verilog Conversion

This example demonstrates how a **pipelined counter design written in Verilog** can be expressed using **TL-Verilog**.

The design performs a sequence of operations on a counter value across multiple pipeline stages.

---

# Verilog Implementation

In Verilog, each pipeline stage must be implemented using registers that update on the clock edge.

The pipeline performs the following steps:

1. A counter increments every clock cycle.
2. The counter value is doubled.
3. A constant value is added to produce the final result.

Example pipeline structure:

```
Counter → Multiply by 2 → Add constant → Final output
```

Example Verilog logic:

```
always @(posedge clk)
    double_cnt <= cnt * 2;
```

Each stage requires explicitly declaring registers to store intermediate values.

---

# TL-Verilog Implementation

In TL-Verilog, pipeline stages are expressed directly using stage annotations.

Example:

```
@0
$cnt = *reset ? 0 : >>1$cnt + 1;

@1
$double_cnt = $cnt * 2;

@2
$final = $double_cnt + 10;
```

Here:

* `>>1$cnt` refers to the value of `cnt` from the previous cycle.
* Pipeline stages are defined using `@stage` notation.

---

# Pipeline Stages

| Stage | Function                             |
| ----- | ------------------------------------ |
| `@0`  | Counter register with reset          |
| `@1`  | Double the counter value             |
| `@2`  | Add constant to produce final result |

---

# Key Idea

Both implementations describe the same pipelined hardware behavior.

However:

* **Verilog** requires explicitly writing registers between pipeline stages.
* **TL-Verilog** automatically manages the pipeline registers based on stage annotations.

This makes TL-Verilog designs easier to write and maintain, especially for complex pipelines.

---

# Files in this Folder

* `verilog_counter_pipeline.v` → Verilog implementation
* `counter_pipeline.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
