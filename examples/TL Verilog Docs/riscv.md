# RISC-V Experiments

This section contains simple hardware modules inspired by the **RISC-V instruction set architecture**.

RISC-V is an open standard ISA widely used in modern processor design and research.

These examples demonstrate core building blocks of a processor.

## Files

### cpu.tlv

A configuration-based implementation using the **WARP-V architecture**.

This file demonstrates how a configurable RISC-V CPU can be instantiated using TL-Verilog macros and libraries.

Key concepts include:

* pipeline stage configuration
* branch prediction setup
* ISA extension configuration

### decoder.tlv

Implements a simple **instruction decoder**.

It extracts instruction fields such as:

* opcode
* destination register (rd)
* source registers (rs1, rs2)
* funct3
* funct7

These fields are essential for determining which operation the processor must perform.

## Concepts Demonstrated

* RISC-V instruction format
* instruction decoding
* modular processor design
* hardware modeling with TL-Verilog

## Learning Goals

The goal of this section is to understand the internal components of a processor and how they interact to execute instructions.

These examples serve as a foundation for building more complex architectures such as pipelined RISC-V processors.
