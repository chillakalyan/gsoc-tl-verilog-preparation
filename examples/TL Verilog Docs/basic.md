# Basic TL-Verilog Examples

This section contains introductory programs written in **TL-Verilog** to understand fundamental hardware design concepts using **Makerchip**.

## Purpose

The goal of these examples is to learn:

* TL-Verilog syntax
* signal declaration
* simple hardware operations
* visualization inside Makerchip

## Files

### alu.tlv

Implements a simple **Arithmetic Logic Unit (ALU)** performing operations such as:

* ADD
* SUB
* AND
* OR
* XOR

Inputs are generated automatically using the simulation cycle counter (`*cyc_cnt`).
Operations are performed using TL-Verilog pipeline stages.

### boat.tlv

A visualization example demonstrating animation within Makerchip using `viz_js`.

Features include:

* animated boat
* moving water waves
* sky and cloud animation
* simple pipeline-driven motion logic

This example demonstrates how TL-Verilog signals can control JavaScript-based visualization.

## Concepts Demonstrated

* TL-Verilog pipeline stages (`@0`, `@1`)
* time shifting (`>>`)
* signal generation
* Makerchip visualization
