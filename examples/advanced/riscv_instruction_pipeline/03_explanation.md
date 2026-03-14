# RISC-V Instruction Pipeline: Verilog → TL-Verilog

This example demonstrates how a simple instruction pipeline can be implemented in **Verilog** and then represented using **TL-Verilog**.

The goal of this example is to understand how **TL-Verilog simplifies pipeline design** compared to traditional RTL written in Verilog.

The pipeline used in this example has four conceptual stages:

Fetch → Decode → Execute → Writeback

This is a simplified educational model and does not implement a full RISC-V processor.

---

# Verilog Implementation

File: `01_verilog_riscv_pipeline.v`

In Verilog, pipelines are implemented using **clocked sequential logic**. Each stage updates its registers on every clock cycle.

Example:

```verilog
always @(posedge clk) begin
    pc <= pc + 4;
end
```

Key characteristics of the Verilog version:

* Uses **always blocks triggered by the clock**
* Pipeline registers must be **declared explicitly**
* Data transfer between stages is handled manually
* More boilerplate code is required

Even for simple pipelines, Verilog requires explicit register management.

---

# TL-Verilog Implementation

File: `02_riscv_pipeline.tlv`

TL-Verilog introduces **pipeline stage abstraction**. Instead of writing multiple clocked blocks, pipeline timing is expressed directly using stage annotations.

Example:

```
@0
   $pc = >>1$pc + 4;

@1
   $instr = $pc;
```

Here:

* `@0`, `@1`, `@2`, `@3` represent pipeline stages
* `>>1` refers to the value of the signal in the **previous cycle**

Pipeline stages in this example:

```
@0  Fetch
@1  Decode
@2  Execute
@3  Writeback
```

TL-Verilog automatically manages the pipeline timing and signal propagation between stages.

---

# Key Differences

| Feature              | Verilog               | TL-Verilog                 |
| -------------------- | --------------------- | -------------------------- |
| Pipeline description | Manual                | Stage-based abstraction    |
| Register handling    | Explicit              | Automatically inferred     |
| Timing control       | Clocked always blocks | Pipeline stage annotations |
| Code complexity      | Higher                | Lower                      |

---

# Learning Outcome

This example illustrates:

* How pipelines are implemented in **traditional Verilog**
* How **TL-Verilog simplifies pipeline design**
* The benefit of using **stage-based abstraction** for hardware pipelines

The TL-Verilog version focuses more on the **behavior of the pipeline** rather than low-level register management.

---

# Files in This Example

`01_verilog_riscv_pipeline.v`
Basic Verilog implementation of the pipeline.

`02_riscv_pipeline.tlv`
TL-Verilog version demonstrating pipeline stage abstraction.

---

# Summary

Traditional Verilog requires explicit management of pipeline registers and clocked logic.
TL-Verilog allows designers to express the **pipeline structure directly**, reducing boilerplate code and making the design easier to understand.
