# TL-Verilog Basics

## Introduction

Transaction-Level Verilog (TL-Verilog) is an extension of SystemVerilog that introduces a higher level of abstraction for hardware design. It enables designers to describe hardware pipelines and timing relationships more clearly and concisely.

TL-Verilog separates **logic description** from **timing**, making designs easier to maintain and refactor.

Developed by **Redwood EDA**, TL-Verilog is commonly used with the **Makerchip IDE** for interactive simulation and visualization.

---

## Key Concepts

### 1. Pipelines

TL-Verilog allows designers to specify pipeline stages explicitly using the `@stage` syntax.

Example:
    |pipeline
    @0
    $a = $rand1[31:0]
    $b = $rand2[31:0]

    @1
    $sum = $a + $b


Here:

- `@0` = pipeline stage 0
- `@1` = pipeline stage 1

---

### 2. Signals

Signals in TL-Verilog are prefixed with `$`.

Example:
    $a
    $b
    $sum


These represent values flowing through pipeline stages.

---

### 3. Timing Abstraction

Unlike traditional Verilog, TL-Verilog does not require manual register insertion between stages. The compiler automatically manages timing relationships.

Benefits:

- Less boilerplate code
- Easier pipeline modifications
- Reduced risk of bugs

---

## Advantages of TL-Verilog

- Simplifies pipeline design
- Improves code readability
- Enables better visualization
- Reduces RTL complexity
- Facilitates automated refactoring

---

## Tools

Common tools used with TL-Verilog:

- Makerchip IDE
- Redwood EDA visualization tools
- Formal verification tools

---

## References

- https://www.tl-x.org/docs
- https://makerchip.com
- https://www.redwoodeda.com