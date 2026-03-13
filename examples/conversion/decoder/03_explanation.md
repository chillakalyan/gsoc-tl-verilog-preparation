# Instruction Decoder: Verilog to TL-Verilog Conversion

This example demonstrates how a simple **RISC-V instruction decoder written in Verilog** can be expressed using **TL-Verilog**.

The decoder extracts different instruction fields from a 32-bit instruction.

---

# Verilog Implementation

In Verilog, decoding an instruction typically involves:

1. Storing the instruction value
2. Extracting individual bit fields
3. Passing the decoded fields to later pipeline stages

Example instruction:

```
32'h00c58533
```

This represents a RISC-V instruction (`ADD x10, x11, x12`).

Example Verilog decoding logic:

```
opcode <= instr[6:0];
rd     <= instr[11:7];
rs1    <= instr[19:15];
rs2    <= instr[24:20];
```

Each field must be explicitly extracted and stored in registers.

---

# TL-Verilog Implementation

In TL-Verilog, the same decoding process is written using pipeline stages.

Example:

```
@0
$instr = 32'h00c58533

@1
$opcode = $instr[6:0]
$rd     = $instr[11:7]
$rs1    = $instr[19:15]
$rs2    = $instr[24:20]
```

Here:

* `@0` provides the instruction
* `@1` performs the decode operation

TL-Verilog automatically manages the registers between pipeline stages.

---

# Pipeline Stages

| Stage | Function             |
| ----- | -------------------- |
| `@0`  | Instruction input    |
| `@1`  | Instruction decoding |

---

# Key Idea

Both implementations perform the same decoding operation.

However:

* **Verilog** requires explicit registers and clock logic.
* **TL-Verilog** allows designers to describe pipelines using stage annotations.

This makes it easier to build complex processor pipelines.

---

# Files in this Folder

* `verilog_decoder.v` → Verilog implementation
* `decoder.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
