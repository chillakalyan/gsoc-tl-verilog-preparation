# Pipeline Examples in TL-Verilog

This folder contains examples demonstrating **hardware pipelining**, one of the key concepts in digital processor design.

Pipelining allows multiple instructions or operations to execute simultaneously in different stages of a processor.

These examples are implemented using **TL-Verilog** in **Makerchip**.

## Pipeline Concepts

In TL-Verilog, pipeline stages are represented using:

```
@0   Stage 0
@1   Stage 1
@2   Stage 2
```

Signals from earlier stages can be accessed using the time-shift operator:

```
>>1$signal
```

This means *the value of the signal from the previous pipeline stage*.

## Files

### simple_pipeline.tlv

Demonstrates a minimal pipeline structure where data flows across stages.

Stages typically include:

* input generation
* intermediate computation
* final result calculation

### counter_pipeline.tlv

Implements a counter that updates every clock cycle and propagates through pipeline stages.

Concepts demonstrated:

* sequential logic
* time-shifting
* staged computation

### mini_ALU_pipeline.tlv

A small ALU implemented as a pipeline.

Stages include:

1. Input generation
2. Arithmetic operations
3. Result selection

This example shows how real processors use pipelining to improve performance.

## Key Learning Points

* staged hardware execution
* signal propagation across cycles
* modeling processor pipelines
* improving throughput using pipelining
