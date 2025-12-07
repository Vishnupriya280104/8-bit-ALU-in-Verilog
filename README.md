# 8-bit ALU in Verilog

## Overview
This project implements an 8-bit Arithmetic Logic Unit (ALU) in Verilog.  
The ALU performs basic arithmetic and logical operations and is verified using a simple testbench.

## Features
- 8-bit inputs: `a`, `b`
- 3-bit operation select `op`
- Supported operations:

| op  | Operation           | Description                  |
|-----|---------------------|------------------------------|
| 000 | ADD                 | y = a + b                    |
| 001 | SUB                 | y = a - b                    |
| 010 | AND                 | y = a & b                    |
| 011 | OR                  | y = a \| b                   |
| 100 | XOR                 | y = a ^ b                    |
| 101 | NOT                 | y = ~a                       |
| 110 | SHIFT LEFT          | y = a << 1                   |
| 111 | SHIFT RIGHT         | y = a >> 1                   |

- Flags:
  - `carry` – set during add/sub operations
  - `zero` – high when result `y` is zero

## Files
- `alu.v` – RTL design of the ALU
- `alu_tb.v` – Testbench for functional verification

## Simulation (Icarus Verilog)
```bash
iverilog -o alu_tb alu.v alu_tb.v
vvp alu_tb
gtkwave alu_tb.vcd

## Simulation Results

### Console Output
<img width="559" height="360" alt="Screenshot 2025-12-07 132731" src="https://github.com/user-attachments/assets/b4d64cc8-4b6b-417f-b305-482b2a0ad39f" />


### Waveform
<img width="1852" height="543" alt="Screenshot 2025-12-07 133250" src="https://github.com/user-attachments/assets/c290840d-5093-4681-b394-abc0aaee216d" />


