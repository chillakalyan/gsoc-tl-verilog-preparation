# LLM Agents for TL-Verilog Refactoring

## Introduction

Large Language Models (LLMs) can assist in automating hardware design transformations. In this project, LLMs are used to assist in converting traditional Verilog code into TL-Verilog.

The goal is to create **agent-based workflows** capable of refactoring hardware designs automatically.

---

## Agent-Based Workflow

The agent workflow typically follows this process:

    Verilog Code
        ↓
    LLM Analysis
        ↓
    Refactoring Suggestion
        ↓
    TL-Verilog Transformation
        ↓
    Verification


Each step may involve automated reasoning performed by AI agents.

---

## Role of LLMs

LLMs can assist in:

- identifying design patterns
- rewriting code into TL-Verilog syntax
- suggesting pipeline structures
- generating refactored code
- documenting transformations

However, the generated designs must still be verified through simulation and formal verification.

---

## Verification

To ensure correctness, the transformed code must be verified using tools such as:

- SymbiYosys
- EQY equivalence checking
- simulation tools

Verification ensures that the refactored TL-Verilog design behaves identically to the original Verilog implementation.

---

## Existing Research

An experimental implementation of AI-assisted TL-Verilog workflows is available here:

https://github.com/stevehoover/LLM_TLV

This repository contains prototypes of agent-based systems designed to assist with Verilog refactoring.

---

## Challenges

Automating hardware design transformation presents several challenges:

- maintaining functional correctness
- identifying correct pipeline stages
- handling complex RTL logic
- ensuring synthesis compatibility

Research in this area focuses on combining **AI reasoning with formal verification**.

---

## Future Work

Future improvements may include:

- better training datasets for hardware designs
- stronger verification pipelines
- automated hardware optimization