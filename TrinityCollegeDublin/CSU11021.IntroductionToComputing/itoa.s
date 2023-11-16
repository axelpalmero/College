  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 5

  @ R1 : number
  @ R0 : Address of string

  MOV R10, #10
  MOV R2, #10                    @ int divToFindSize = 10;
  CMP R1, #0                     @ if (number = 0) 
  BEQ NumberIsZero               @ {
PowerOfTenFinder:   
  UDIV R5, R1, R2                @ int x = number / divToFindSize;
  CMP R5, #0                     @ if (x == 0) {
  BEQ LargestPowerOfTenFound
  MUL R2, R2, R10
  B PowerOfTenFinder
LargestPowerOfTenFound:
  UDIV R2, R2, R10                @ divides b power of tne by 10 to reduce
  UDIV R6, R1, R2                 @ R6 will contain the division result of number/powerOfTen
  MOV R9, R6
  ADD R6, #0x30
  STRB R6, [R0]                   @ passing R6 to the string (will pass the number reveresed)
  MOV R7, R2                      @ copy the power of ten being used to R7
  MUL R7, R7, R9                  @ multiplying R6 by power of ten
  SUB R1, R7, R1                  @ subtracting the power of ten number from number and storing the result in R1
  CMP R2, #1
  BEQ StringFullyPassedReversed
  B LargestPowerOfTenFound

NumberIsZero:
  STRB R1, [R0]                @ string = "0"; }

StringFullyPassedReversed:

/* 
  MOV R2, #0        @ int hundreds = 0;
  MOV R3, #0        @ int tens = 0;
  MOV R4, #0        @ int units = 0;
  CMP R1, #0        @ if (intToConvert = 0) {
  BEQ IntZero
Counter:
  CMP R1, #99   
  BLT HundredsCounter
  CMP R1, #9
  BLT TensCounter
  B UnitsCounter

HundredsCounter: 
  SUB R1, R1, #100
  ADD R2, #1
  B Counter

TensCounter:
  SUB R1, R1, #10
  ADD R3, #1
  B Counter

UnitsCounter:
  SUB R1, R1, #1
  ADD R4, #1
  B Counter 

IntZero:
  SUB R2, R2, #0x30
  SUB R3, R3, #0x30
  SUB R4, R4, #0x30
  ADD R0, #'0'      @     stringInt = "0"; }
*/

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])strA
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&strA
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &strA and length at
  @   least 11. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @

  @ *** your program goes here ***

  @ End of program ... check your result


End_Main:
  BX    lr
