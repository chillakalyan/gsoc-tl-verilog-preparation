# GSoC 2026 – TL-Verilog Preparation

This repository documents my preparation for **Google Summer of Code 2026** with the **FOSSi Foundation** for the project:

**"Using AI to Improve Open-Source IP"**

Mentor: **Steve Hoover (Redwood EDA)**

The goal of this repository is to explore **TL-Verilog design methodology, Makerchip simulation workflows, and AI-assisted refactoring of open-source hardware IP**.

---

# Current Focus

* Learning TL-Verilog pipeline abstraction
* Understanding Makerchip simulation workflows
* Studying Verilog → TL-Verilog conversion methods
* Exploring AI-assisted hardware design tools

---

# Objective

The objective of this preparation work is to understand the technologies required for the project:

* TL-Verilog pipeline-based hardware design
* Makerchip IDE simulation environment
* Verilog → TL-Verilog refactoring workflows
* AI-assisted hardware code transformation
* Open-source RISC-V cores such as **SERV**

This repository contains **learning notes, experiments, and example designs** implemented while studying these technologies.

---

# Technologies

* Verilog
* TL-Verilog
* Python
* Makerchip IDE
* Formal verification (SymbiYosys / EQY)
* AI-assisted code transformation

---

# Learning Resources

The following resources were used while preparing this repository:

* https://makerchip.com
* https://www.tl-x.org/docs
* https://www.redwoodeda.com/viz
* https://github.com/stevehoover/conversion-to-TLV
* https://github.com/stevehoover/LLM_TLV

---

# Repository Structure

```
gsoc-tl-verilog-preparation
│
├── docs
│   ├── tl-verilog-basics.md
│   ├── makerchip-learning.md
│   └── serv-riscv-analysis.md
│
├── examples
│   ├── fundamentals
│   │   ├── register_pipeline.tlv
│   │   ├── shift_register_pipeline.tlv
│   │   ├── multistage_arithmetic_pipeline.tlv
│   │   └── fsm_example.tlv
│   │
│   ├── basic
│   │   ├── alu.tlv
│   │   ├── boat.tlv
│   │   ├── solar_system.tlv
│   │   └── sunrisesunset.tlv
│   │
│   ├── pipelines
│   │   ├── simple_pipeline.tlv
│   │   ├── counter_pipeline.tlv
│   │   └── mini_alu_pipeline.tlv
│   │
│   └── riscv
│       ├── cpu.tlv
│       └── decoder.tlv
│
├── conversions
│   ├── alu
│   │   ├── 01_verilog_alu.v
│   │   ├── 02_alu.tlv
│   │   └── 03_explanation.md
│   │
│   ├── boat
│   │   ├── 01_verilog_boat.v
│   │   ├── 02_boat.tlv
│   │   └── 03_explanation.md
│   │
│   ├── counter
│   │   ├── 01_verilog_counter.v
│   │   ├── 02_counter.tlv
│   │   └── 03_explanation.md
│   │
│   ├── counter_pipeline
│   │   ├── 01_verilog_counter_pipeline.v
│   │   ├── 02_counter_pipeline.tlv
│   │   └── 03_explanation.md
│   │
│   ├── cpu
│   │   ├── 01_verilog_cpu.v
│   │   ├── 02_cpu.tlv
│   │   └── 03_explanation.md
│   │
│   ├── decoder
│   │   ├── 01_verilog_decoder.v
│   │   ├── 02_decoder.tlv
│   │   └── 03_explanation.md
│   │
│   ├── fsm_traffic_light
│   │   ├── 01_verilog_fsm_traffic_light.v
│   │   ├── 02_fsm_traffic_light.tlv
│   │   └── 03_explanation.md
│   │
│   ├── mini_alu_pipeline
│   │   ├── 01_verilog_mini_alu_pipeline.v
│   │   ├── 02_mini_alu_pipeline.tlv
│   │   └── 03_explanation.md
│   │
│   ├── multi_stage_arithmetic_pipeline
│   │   ├── 01_verilog_multi_stage_arithmetic_pipeline.v
│   │   ├── 02_multi_stage_arithmetic_pipeline.tlv
│   │   └── 03_explanation.md
│   │
│   ├── register
│   │   ├── 01_verilog_register.v
│   │   ├── 02_register.tlv
│   │   └── 03_explanation.md
│   │
│   ├── shift_register
│   │   ├── 01_verilog_shift_register.v
│   │   ├── 02_shift_register.tlv
│   │   └── 03_explanation.md
│   │
│   ├── simple_pipeline
│   │   ├── 01_verilog_simple_pipeline.v
│   │   ├── 02_simple_pipeline.tlv
│   │   └── 03_explanation.md
│   │
│   ├── solar_system
│   │   ├── 01_verilog_solar_system.v
│   │   ├── 02_solar_system.tlv
│   │   └── 03_explanation.md
│   │
│   └── sunrise_sunset
│       ├── 01_verilog_sunrise_sunset.v
│       ├── 02_sunrise_sunset.tlv
│       └── 03_explanation.md
│
├── simulations
│   └── makerchip_simulation_links.md
│
├── research
│   ├── 01_verilog_to_tlv_conversion.md
│   └── 02_llm_tlv_agents.md
│
├── resources
│   └── useful_links.md
│
└── README.md
```


---

# TL-Verilog Examples

This repository includes several TL-Verilog design experiments implemented using Makerchip.

Examples include:

### Basic Designs

* ALU example
* Basic TL-Verilog experiments

Some files include **Makerchip visualization (VIZ)** to demonstrate graphical hardware behavior.

Examples:

* Boat animation
* Solar system visualization
* Sunrise–sunset simulation

These help illustrate how TL-Verilog can interact with visualization frameworks for educational demonstrations.

---

### Fundamental Designs

* Register pipeline example
* Shift register pipeline
* Multi-stage arithmetic pipeline
* Simple FSM experiment

These examples demonstrate core TL-Verilog concepts such as:

* register behavior
* stage-to-stage data propagation
* control logic
* multi-stage pipeline computation

---

### Pipeline Designs

* Simple pipeline example
* Counter pipeline
* Mini ALU pipeline

These examples demonstrate how TL-Verilog simplifies **pipeline-based hardware design**.

---

### RISC-V Experiments

* Simple CPU model
* Instruction decoder

These experiments explore how TL-Verilog pipeline abstraction simplifies processor design compared to traditional RTL approaches.

---

# Verilog → TL-Verilog Conversions

The **`conversions`** directory contains implementations showing how traditional **Verilog designs can be expressed using TL-Verilog**.

Each conversion example includes:

* the original Verilog implementation
* the TL-Verilog equivalent
* an explanation of the pipeline abstraction

Examples include:

* counters
* registers
* shift registers
* ALU implementations
* arithmetic pipelines
* FSM logic
* simple processor components

These examples demonstrate how TL-Verilog can **reduce boilerplate RTL code while maintaining the same hardware behavior**.

---

# Makerchip Simulations

All TL-Verilog examples are tested using **Makerchip Sandbox**.

The simulation links for all examples are documented in:

```
simulations/makerchip_simulation_links.md
```

Makerchip provides:

* pipeline visualization
* waveform debugging
* interactive hardware simulation

This makes it easier to explore TL-Verilog pipeline behavior in a browser-based environment.

---

# Research Topics

This repository also explores research topics relevant to the GSoC project.

### Verilog → TL-Verilog Conversion

Study of automated refactoring workflows that convert traditional Verilog into TL-Verilog.

### AI-Assisted Hardware Refactoring

Exploration of **LLM-based agents** capable of assisting in hardware code transformation.

Relevant repositories:

* https://github.com/stevehoover/conversion-to-TLV
* https://github.com/stevehoover/LLM_TLV

---

# Future Work

Planned exploration includes:

* deeper analysis of open-source hardware IP
* experiments with Verilog → TL-Verilog refactoring
* investigation of AI-assisted hardware design tools
* potential contributions to relevant open-source repositories
