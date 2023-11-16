  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 8

  MOV   R0, #0          @ finalCounterZeros = 0;
  MOV   R2, #0          @ counterRepetitions = 0;
  MOV   R3, #0          @ counterForComparison = 0;
While:
  CMP   R2, #32         @ while
  BEQ   End_Main        @     (counterRepetitions < 32)
  MOVS  R1, R1, LSL #1  @ else {
  BCC   Zero            @     if (elem == 0)
  BCS   NotZero         @     if (elem == 1)

Zero:
  ADDS  R3, R3, #1      @ counterForComparison =+ 1;
  CMP   R3, R0          @ if (counterForComparison > finalCounterZeros) 
  BHI   PassCounter 
  ADDS  R2, R2, #1      @     counterRepetitions++;
  B     While

NotZero:
  MOV   R3, #0          @ counterForComparison = 0;
  ADDS  R2, R2, #1      @     counterRepetitions++;
  B     While

PassCounter:
  MOV   R0, R3          @     finalCounterZeros = counterForComparison;  }
  ADDS  R2, R2, #1      @     counterRepetitions++;
  B     While

  @ End of program ... check your result

End_Main:
  BX    lr
