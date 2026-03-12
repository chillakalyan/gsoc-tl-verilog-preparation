# GSoC 2026 – TL-Verilog Preparation

This repository documents my preparation for **Google Summer of Code 2026** with the **FOSSi Foundation** for the project:

**"Using AI to Improve Open-Source IP"**

Mentor: **Steve Hoover (Redwood EDA)**

The goal of this repository is to explore **TL-Verilog design methodology, Makerchip simulation workflows, and AI-assisted refactoring of open-source hardware IP**.

---

# Objective

The objective of this preparation work is to understand the technologies required for the project:

- TL-Verilog pipeline-based hardware design
- Makerchip IDE simulation environment
- Verilog → TL-Verilog refactoring workflows
- AI-assisted hardware code transformation
- Open-source RISC-V cores such as **SERV**

This repository contains **learning notes, experiments, and example designs** implemented while studying these technologies.

---

# Technologies

- Verilog
- TL-Verilog
- Python
- Makerchip IDE
- Formal verification (SymbiYosys / EQY)
- AI-assisted code transformation

---

# Learning Resources

The following resources were used while preparing this repository:

- https://makerchip.com
- https://www.tl-x.org/docs
- https://www.redwoodeda.com/viz
- https://github.com/stevehoover/conversion-to-TLV
- https://github.com/stevehoover/LLM_TLV

---

# Repository Structure
```
gsoc-tl-verilog-preparation
│
├── docs
│ ├── tl-verilog-basics.md
│ ├── makerchip-learning.md
│ └── serv-riscv-analysis.md
│
├── examples
│ ├── basic
│ │ ├── alu.tlv  ->TL-Verilog logic example (no visualization)
| | ├── boat.tlv   -> Visualization example
| | ├── solar_system.tlv  -> Visualization example
│ │ └── sunrisesunset.tlv  -> Visualization example
│ │
│ ├── pipelines
│ │ ├── simple_pipeline.tlv
│ │ ├── counter_pipeline.tlv
│ │ └── mini_ALU_pipeline.tlv
│ │
│ └── riscv
│ ├── cpu.tlv
│ └── decoder.tlv
│
├── experiments
│ └── makerchip_links.md
│
├── research
│ ├── 01_verilog_to_tlv_conversion.md
│ └── 02_llm_tlv_agents.md
│
├── resources
│ └── useful_links.md
│
└── README.md
```

---

# TL-Verilog Examples

This repository includes several TL-Verilog design experiments implemented using Makerchip.

Examples include:

### Basic Designs
- ALU example
- basic TL-Verilog experiments

### Pipeline Designs
- simple pipeline example
- counter pipeline
- mini ALU pipeline

### RISC-V Experiments
- simple CPU model
- instruction decoder

These examples explore how **pipeline abstraction simplifies hardware design** compared to traditional RTL.

---

# Makerchip Experiments

All TL-Verilog examples are tested using **Makerchip Sandbox**.

Simulation links are documented in:
experiments/makerchip_links.md


Makerchip provides:

- pipeline visualization
- waveform debugging
- interactive hardware simulation

---

# Research Topics

This repository also explores research topics relevant to the GSoC project:

### Verilog → TL-Verilog Conversion
Study of automated refactoring workflows that convert traditional Verilog into TL-Verilog.

### AI-assisted Hardware Refactoring
Exploration of LLM-based agents capable of assisting in hardware code transformation.

Relevant repositories:

- https://github.com/stevehoover/conversion-to-TLV
- https://github.com/stevehoover/LLM_TLV

---

# Future Work

Planned exploration includes:

- deeper analysis of open-source hardware IP
- experiments with Verilog → TL-Verilog refactoring
- investigation of AI-assisted hardware design tools
- potential contributions to relevant open-source repositories

---

