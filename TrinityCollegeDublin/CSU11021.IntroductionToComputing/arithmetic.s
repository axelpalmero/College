  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute 4x^2+3x

  MOV R2, R1
  MUL R2, R2, #3
  MUL R1, R1, R1
  MUL R1, R1, #4
  ADD R0, R1, R2
  
  @ End of program ... check your result

End_Main:
  BX    lr
