  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  MOV R5, R1
  MUL R5, R5, R5
  MUL R0, R5, R2
  MUL R1, R1, R3
  ADD R0, R0, R1
  ADD R0, R0, R4
  

End_Main:
  BX    lr

.end