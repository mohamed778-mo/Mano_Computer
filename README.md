 ## Mano Computer
![Screenshot (1)](https://github.com/mohamed778-mo/Mano_Computer_project/assets/137796091/3ef2a44a-68bb-4b61-acb5-76072ae3439a)


## Overview

Mano_Computer refers to a simplified model of a computer used to understand the basic principles of computing. In this model, a computer is imagined as a person carrying out instructions. The instructions, or orders, are represented by simple commands that the person (or computer) can understand and execute.

In the Mano_Computer model, the orders that can be executed typically include basic arithmetic operations like addition, subtraction, multiplication, and division, as well as logical operations like comparisons , and branching instructions ( if-then statements). These instructions are usually represented in a simple symbolic language, similar to assembly language but even more basic.

# Modules
- **ControlUnit**: This module coordinates the control signals for various components like the AC, AR, DR, IR, PC, memory, and ALU based on input conditions.
AC_Control, AR_Control, DR_Control, IR_Control, PC_Control, MEM_Control, SC_Control: These modules control the operations of the Accumulator (AC), Address Register (AR), Data Register (DR), Instruction Register (IR), Program Counter (PC), Memory (RAM), and System Clock (SC) respectively.
- **REGISTERS**: AC-AR-DR-PC-IR Register.
- **CommonBus**: Manages the communication bus between various components.
- **Selections**: Selects appropriate signals from the common bus for different components.
- **ALU_CONTROL**: Controls the operations of the Arithmetic Logic Unit (ALU).
AC_Reg, AR_Reg, DR_Reg, IR_Reg, PC_Reg: Registers for the AC, AR, DR, IR, and PC respectively.
- **MEMORY**: Models an 8x4-bit MEMORY.
- **BUS_SELECTION**: Multiplexers for selecting appropriate data from different sources.
- **Sequence_Counter**: Counter and decoder modules for sequencing and decoding operations.
- **Alu**: The Arithmetic Logic Unit (ALU) module.

## Instructions
![8664903c-ba8d-410f-91c1-38407b666f25](https://github.com/mohamed778-mo/Mano_Computer_project/assets/137796091/b5e83d04-af0f-4e23-8bbc-3719556847f9)



## Design

![8d035b11-9930-40f5-bdb6-eeea82994b85](https://github.com/mohamed778-mo/Mano_Computer_project/assets/137796091/7a63a359-7f88-4663-a8d0-db6ac0344a88)


# Output signal
![14e5f9d2-aa60-4718-ae11-ab6f39a129f8](https://github.com/mohamed778-mo/Mano_Computer_project/assets/137796091/2e51e159-16d3-461a-ae4e-31d4426d9fa3)

