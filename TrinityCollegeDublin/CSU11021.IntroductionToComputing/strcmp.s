  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ Write a program to compare two strings stored in memory, beginning at the
  @   addresses in R1 and R2. The program should store in R0 ...
  @
  @   0  if the strings are the same
  @ 
  @   -1 if the first non-matching character in the first string precedes the
  @      corresponding character in the second string
  @
  @   +1 if the first non-matching character in the first string succeeds the
  @      corresponding character in the second string
  @




  @ End of program ... check your result

End_Main:
  BX    lr

