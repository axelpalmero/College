  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute n! when n is a value in R1

  MOV R1, #0     @ result = 1;
  MOV R2, R1     @ temp = n;
WhileMul:
  CMP R2, #1     @ while (temp > 1);
  BLS EndWhileMul
  MUL R0, R0, R2    @ result = result * temp;
  SUB R2, R2, #1    @ temp = temp - 1;
  B WhileMul
EndWhileMul:

  @ End of program ... check your result

End_Main:
  BX    lr
