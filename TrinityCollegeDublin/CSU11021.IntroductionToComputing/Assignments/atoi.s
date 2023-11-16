  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 2
  @ Finding out if the numbers are in decimal, hex, etc. 
  CMP R5, #10 
  BEQ DecimalBranch
  CMP R5, #2
  BEQ BinaryBranch
  CMP R5, #8
  BEQ OctalBranch
  B HexadecimalBranch

DecimalBranch:
  SUB R1, R1, #0x30
  SUB R2, R2, #0x30
  SUB R3, R3, #0x30
  SUB R4, R4, #0x30
  MOV R6, #1000
  MOV R7, #100
  MOV R8, #10
  MUL R1, R1, R6
  MUL R2, R2, R7
  MUL R3, R3, R8
  ADD R0, R0, R1
  ADD R0, R0, R2
  ADD R0, R0, R3
  ADD R0, R0, R4
  
BinaryBranch:
  SUB R1, R1, #0x30
  SUB R2, R2, #0x30
  SUB R3, R3, #0x30
  SUB R4, R4, #0x30

  CMP R4, #1
  BEQ MUL R4, R4, R5
  CMP R3, #1
  BEQ MUL R3, R3, R5
  MUL R3, R3, R5


 EndWh: 
  MUL R3, R3, R3
  MUL R4, R4, R4
  MUL R4, R4, R4
  MUL R5, R5, R5
  MUL R5, R5, R5
  MUL R5, R5, R5
  ADD R0, R0, R1
  ADD R0, R0, R2
  ADD R0, R0, R3
  ADD R0, R0, R4

  @ End of program ... check your result

End_Main:
  BX    lr
