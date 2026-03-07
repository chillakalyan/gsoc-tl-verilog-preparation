# Verilog to TL-Verilog Conversion

## Overview

One of the goals of the GSoC project **"Using AI to Improve Open-Source IP"** is to automate the refactoring of traditional Verilog designs into **Transaction-Level Verilog (TL-Verilog)**.

TL-Verilog provides higher abstraction for hardware pipelines and significantly simplifies complex RTL designs.

This research explores how Verilog code can be transformed into TL-Verilog models.

---

## Why Convert Verilog to TL-Verilog?

Traditional Verilog designs often suffer from:

- complex register management
- repetitive pipeline code
- difficult refactoring
- reduced readability

TL-Verilog addresses these issues through **timing abstraction and pipeline modeling**.

Advantages include:

- simpler pipeline design
- improved maintainability
- better visualization
- easier refactoring

---

## Conversion Workflow

The general conversion process involves:

1. Parsing the original Verilog design
2. Identifying pipeline stages
3. Mapping signals across pipeline stages
4. Rewriting logic in TL-Verilog pipeline format
5. Verifying functional equivalence

Workflow:

    Verilog Source
            ↓
    Static Analysis
            ↓
    Pipeline Identification
            ↓
    TL-Verilog Refactoring
            ↓
    Formal Verification


---
## Example

### Verilog Code

```verilog
always @(posedge clk) begin
    sum <= a + b;
end
```

### TL-Verilog Equivalent

```tlv
|pipeline
   @0
      $sum = $a + $b
```

TL-Verilog eliminates explicit register management.


### Tools Used

Several tools support the conversion workflow:

TL-Verilog compiler

Makerchip IDE

SymbiYosys

EQY (Equivalence Checking)

These tools help ensure the converted design maintains the same functionality as the original Verilog.

### Related Work

The repository below demonstrates experimental work in automated Verilog → TLV conversion:

https://github.com/stevehoover/conversion-to-TLV

This project explores automated refactoring flows using AI-assisted approaches.


### Research Goal

The objective is to improve automated refactoring tools that convert open-source Verilog IP into cleaner TL-Verilog models.

This helps improve:

code readability

maintainability

scalability of hardware designs
