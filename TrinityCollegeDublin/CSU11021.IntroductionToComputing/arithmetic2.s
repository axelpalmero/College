  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute x^3−4x^2+3x+8 where x is a value in R1

  MOV R4, #8
  
  MOV R2, R1
  MUL R2, R2, #3
  MUL R1, R1, R1
  MUL R1, R1, #4
 
  @ End of program ... check your result

End_Main:
  BX    lr
