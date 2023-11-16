  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @ 
  @ Write a program to compute the length of the string
  @   in memory that begins at the address in R1.
  @
  @ Store your result (the length of the string) in R0.
  @

  @ End of program ... check your result

End_Main:
  BX    lr

