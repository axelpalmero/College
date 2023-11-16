  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 3

  CMP R2, R3                  @ if (R2 > R3) {
  BLS SwapRegisters           @     branch to swap so smaller value is in R2}
  MOV R4, #1                  @ int smallestDivisor1 = 1; (within while loop I will start by adding 1, thus will start by considering 2 as smallest divisor)
  MOV R10, #1                 @ this 1 will be used to increase count of GCD IncreaseDivisor:
  ADD R4, R4, R10             @ divisor = divisor + 1;
ContinueWhileLoop:
  SUB R5, R2, R4              @ leftover = r2 - possibleDivisor;
  CMP R5, #0            
  BEQ FirstDivisorFound       @ if ( leftover = 0) {smallest divisor of first number has been found}
  BHI ContinueWhileLoop       @ if ( leftover > 0 ) {"division" is not complete, continue subtracting}
  B IncreaseDivisor         @ else if ( leftover < 0 ) {r4 is not a perfect divisor of the first number, thus divisor count neds to be incremented by 1 and restart}
  
FirstDivisorFound:
  MOV R5, #0                  @ using R5 to store either leftover of subtraction or the zero, which will let me know if it is a perfect divisor of the second number too
ContinueWhileLoopTwo:         @ This branch calculates whether the denominator that works for the first number works for this one too
  SUB R5, R3, R4              
  CMP R5, #0
  BEQ CommonDenominatorFound  @ In this case the denoimator works for both (smaller number was in lower register) thus this is the GCD
  BHI ContinueWhileLoopTwo    @ Continue subtracting (aka dividing)
  B IncreaseDivisor         @ Divisor does not work for the second number, thus needs to be increased
  
SwapRegisters:
  MOV R4, R2
  MOV R2, R3
  MOV R3, R4

CommonDenominatorFound:
  MOV R0, R4

  @ End of program ... check your result

End_Main:
  BX    lr
