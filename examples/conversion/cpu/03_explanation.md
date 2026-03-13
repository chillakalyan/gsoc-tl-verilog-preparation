# CPU Example: Verilog to TL-Verilog Conversion

This example demonstrates how a CPU design can be described using **TL-Verilog** through configuration and library reuse.

The TL-Verilog file configures the **WARP-V RISC-V CPU generator**, which automatically produces the required hardware pipeline.

---

# Verilog Implementation

In traditional Verilog, a CPU must be implemented by manually describing:

* program counter
* instruction fetch
* decode stage
* execute stage
* register file
* memory access
* write-back stage

Each stage typically requires separate registers and control logic.

Example simplified pipeline structure:

```
Fetch → Decode → Execute → Writeback
```

Example Verilog pipeline logic:

```
always @(posedge clk)
    decode_stage <= fetch_stage;
```

Building a full CPU in Verilog requires **thousands of lines of code**.

---

# TL-Verilog Implementation

In TL-Verilog, the CPU is generated using **WARP-V**, a configurable RISC-V processor written in TL-Verilog.

The file mainly defines **configuration parameters**, such as:

* ISA extensions
* pipeline stage mapping
* branch prediction
* core configuration

Example configuration:

```
var(ISA, RISCV)
var(EXT_M, 1)
var(NUM_CORES, 1)
```

The CPU implementation itself is included from the WARP-V library:

```
m4_include_lib(['warp-v.tlv'])
```

This library generates the full CPU pipeline automatically.

---

# Key Idea

The TL-Verilog design focuses on **configuration and abstraction**, while the underlying CPU implementation is generated from reusable modules.

Compared with traditional Verilog:

| Feature            | Verilog            | TL-Verilog             |
| ------------------ | ------------------ | ---------------------- |
| CPU implementation | Manual design      | Generated from library |
| Pipeline control   | Explicit registers | Pipeline abstraction   |
| Code size          | Very large         | Much smaller           |

---

# Files in this Folder

* `verilog_cpu.v` → Simplified Verilog representation
* `cpu.tlv` → TL-Verilog WARP-V configuration
* `explanation.md` → Documentation describing the conversion

---

# Note

The TL-Verilog file includes the **WARP-V CPU generator**, which produces a complete RISC-V processor.
The equivalent Verilog implementation generated from TL-Verilog would be significantly larger than the simplified example shown here.
