  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute the absolute value of an integer in R1

  MOV R1, R0
  CMP R0, #0
  BGE EndIgNeg
  RSB R0, R0, #0
EndIfNeg:

  @ End of program ... check your result

End_Main:
  BX    lr
