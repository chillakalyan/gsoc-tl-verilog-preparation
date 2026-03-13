# FSM Traffic Light: Verilog to TL-Verilog Conversion

This example demonstrates how a simple **Finite State Machine (FSM)** written in **Verilog** can be expressed using **TL-Verilog**.

The FSM cycles through three states representing different traffic light phases.

## Verilog Implementation

In Verilog, an FSM is typically implemented using three components:

1. **State Register**
2. **Next-State Logic**
3. **Output Logic**

Example structure in Verilog:

```
always @(posedge clk)
    state <= next_state;

always @(*)
    case(state)
        0: next_state = 1;
        1: next_state = 2;
        default: next_state = 0;
    endcase
```

The state register updates on every clock cycle, while the next state is determined using combinational logic.

## TL-Verilog Implementation

In TL-Verilog, the same FSM can be expressed using **pipeline stages**.

Example:

```
@0
$state = >>1$next_state;

@1
$next_state =
   ($state == 0) ? 1 :
   ($state == 1) ? 2 :
                   0;

@2
$output = $state;
```

### Stage Description

| Pipeline Stage | Function                   |
| -------------- | -------------------------- |
| `@0`           | Updates the state register |
| `@1`           | Computes the next state    |
| `@2`           | Generates the output       |

TL-Verilog automatically manages the required registers using pipeline semantics.

## Key Idea

Both implementations describe the same FSM behavior:

* The system cycles through three states.
* Each state transitions to the next state.
* The output reflects the current state.

However, TL-Verilog organizes the design using **pipeline stages**, which simplifies the representation of sequential hardware logic.

## Files in this Folder

* `verilog_fsm_traffic_light.v` → Verilog implementation
* `fsm_traffic_light.tlv` → TL-Verilog implementation
* `explanation.md` → Documentation for the conversion
