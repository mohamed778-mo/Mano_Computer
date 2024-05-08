# Mano Computer
Hello World 🤓
![COMPUTER](https://github.com/mohamed778-mo/Mano_Computer_project/assets/137796091/2ee9d03f-7af6-498e-afb0-7a69d5ce9de4)



## Overview

Mano_Computer refers to a simplified model of a computer used to understand the basic principles of computing. In this model, a computer is imagined as a person carrying out instructions. The instructions, or orders, are represented by simple commands that the person (or computer) can understand and execute.

In the Mano_Computer model, the orders that can be executed typically include basic arithmetic operations like addition, subtraction, multiplication, and division, as well as logical operations like comparisons , and branching instructions ( if-then statements). These instructions are usually represented in a simple symbolic language, similar to assembly language but even more basic.

# Modules
- **ControlUnit**: This module coordinates the control signals for various components like the AC, AR, DR, IR, PC, memory, and ALU based on input conditions.
AC_Control, AR_Control, DR_Control, IR_Control, PC_Control, MEM_Control, SC_Control: These modules control the operations of the Accumulator (AC), Address Register (AR), Data Register (DR), Instruction Register (IR), Program Counter (PC), Memory (RAM), and System Clock (SC) respectively.
- **CommonBus_Control**: Manages the communication bus between various components.
- **Selections**: Selects appropriate signals from the common bus for different components.
- **ALU_CONTROL**: Controls the operations of the Arithmetic Logic Unit (ALU).
AC_Reg, AR_Reg, DR_Reg, IR_Reg, PC_Reg: Registers for the AC, AR, DR, IR, and PC respectively.
- **RAM_8x4bit**: Models an 8x4-bit RAM.
- **BUS_SEL, MUX_8to1**: Multiplexers for selecting appropriate data from different sources.
- **Sequence_Counter3Bit2, Decoder3x8**: Counter and decoder modules for sequencing and decoding operations.
- **Alu**: The Arithmetic Logic Unit (ALU) module.

# Output signal

