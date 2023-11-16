  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  MOV   R2, #0                @ counterNumberDigits = 0
  MOV   R4, #0                @ decimalNumber = 0
  MOV   R5, R1                @ address2 = address
  MOV   R6, #1                @ powerOfTen = 1  (10^0)
  MOV   R7, #0                @ numbMul10 = 0
  MOV   R8, #10               @ int 10
  MOV   R9, #0                @ decimalNumber2 = 0
  MOV   R10, #0               @ boolean lastNumber = false;
While:    
  LDRB  R3, [R1]              @ elem = word[address]; 
  CMP   R3, #0                @ if (elem == 0) {
  BEQ   EndOfString           @  break; }
  CMP   R3, #'0'              @ if ()
  BLO   NotANumber            @ {
  ADD   R2, R2, #1            @ counterNumberDigits++
  ADD   R1, R1, #1            @ address += 1
  B     While

NotANumber:
  MOV   R9, R4
  MOV   R5, R1                @ address2 = address
Return:
  CMP   R2, #0                @ while (counterNumberDigits != 0)  
  BEQ   While                 @ {
  SUB   R1, R1, #1            @ address -= 1
  LDRB  R3, [R1]              @ elem = word[address]; 
  SUB   R3, R3, #48
  MUL   R7, R6, R3            @ numbMul10 = powerOfTen * elem
  ADD   R4, R4, R7            @ decimalNumber += element
  MUL   R6, R6, R8            @ powerOfTen *= 10
  SUB   R2, R2, #1            @ counterNumberDigits--
  B     Return
EndReturn:
  MOV   R6, #1                @ powerOfTen = 1; (10^0)
  MOV   R7, #0                @ numbMul10 = 0;
  LDRB  R3, [R5]              @ elem = word[address2]; 
  CMP   R3, #43               @ if (elem = '+')
  BEQ   Addition              @ {
  CMP   R3, #45               @ else if (elem = '-')
  BEQ   Subtraction           @ {
  CMP   R3, #42               @ else if (elem = '*')
  BEQ   Multiplication        @ {

Addition:
  MOV   R9, R4              
  MOV   R1, R5
  MOV   R9, R4                @ decimalNumber2 = decimalNumber
  MOV   R4, #0                @ deciamlNumber = 0
  CMP   R10, #0
  BEQ   While
Subtraction:
  SUB   R0, R4, R9            @ result -= decimalNumber
  MOV   R9, R4                @ decimalNumber2 = decimalNumber
  MOV   R4, #0                @ deciamlNumber = 0
  CMP   R10, #0
  BEQ   While
Multiplication:
  MUL   R0, R4, R9            @ result *= decimalNumber
  MOV   R9, R4                @ decimalNumber2 = decimalNumber
  MOV   R4, #0                @ deciamlNumber = 0
  CMP   R10, #0
  BEQ   While

EndOfString:
  MOV   R10, #1               @ lastNumber = true;

EndWhile:

End_Main:
  BX    lr
