# Shift Register Example: Verilog to TL-Verilog Conversion

This example demonstrates how a simple **shift register pipeline** written in **Verilog** can be expressed using **TL-Verilog**.

The design delays input data across several stages before producing the final output.

---

# Verilog Implementation

In Verilog, a shift register is implemented using a sequence of registers connected in series.

Each clock cycle moves the data from one register to the next.

Example structure:

```
data -> stage1 -> stage2 -> stage3 -> stage4 -> output
```

Example Verilog logic:

```
always @(posedge clk)
begin
    stage1 <= data;
    stage2 <= stage1;
    stage3 <= stage2;
    stage4 <= stage3;
end
```

Each register stage must be **explicitly declared and written in the design**.

This is the typical approach used in Verilog for implementing pipeline delays.

---

# TL-Verilog Implementation

In TL-Verilog, the same behavior can be described using **pipeline stages**.

Example:

```
@0
$data = *cyc_cnt;

@4
$data_out = $data;
```

Here:

* `@0` represents the stage where input data is generated.
* `@4` represents the stage where the output appears.

TL-Verilog automatically handles the required pipeline registers between these stages.

---

# Automatic Pipeline Stages in TL-Verilog

In TL-Verilog, intermediate pipeline stages are **automatically inferred**.

In Verilog, the equivalent pipeline registers must be **written explicitly**.

In this example:

```
@0 -> input data
@4 -> output data
```

TL-Verilog automatically creates the intermediate pipeline registers for stages:

```
@1
@2
@3
```

This means the value generated at stage `@0` appears at stage `@4`, creating a **4-cycle delay**.

---

# Pipeline Comparison

| Concept            | Verilog                     | TL-Verilog             |
| ------------------ | --------------------------- | ---------------------- |
| Pipeline registers | Explicitly written          | Automatically inferred |
| Pipeline stages    | Manual register connections | Stage annotations      |
| Code length        | Longer                      | Shorter                |

---

# Key Idea

Both implementations describe the same hardware behavior:

* Data moves through multiple pipeline stages.
* Each clock cycle shifts the data forward.

However, TL-Verilog simplifies pipeline design by allowing the designer to specify **pipeline stages instead of manually writing registers**.

---

# Files in this Folder

* `verilog_shift_register.v` → Verilog implementation
* `shift_register.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation describing the conversion
