  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 4

                                      //Starting from assumption that 1 is not a prime number
  MOV R0, #1                          @ int numberOfPrimeNumbers = 1;  //set to 1 because program will skip 2 as prime number as start counting fropm 3
  MOV R2, #2                          @ int numberToCheckIfPrime = 2;
  MOV R3, #2                          @ int divisor = 2;
  MOV R6, #1                          // To be used to increment by 1
  MOV R7, #0                          // To  be used to compute the remainder (%) of a division of 2 numbers 

  CMP R1, #0
  BEQ NumberIsZero                    // Exception case for R0 = 0
  CMP R1, #1                          // Exception case for R0 = 1
  BEQ NumberIsOne
GeneralBranch:  
  CMP R1, R2                          
  BGT WhileLoop                       // Comparing to make sure the numberToCheckIfPrime is indeed smaller than N in R1
  BLE End_Main
WhileLoop:                            @ while (numberToCheckIfPrime < numberGivenInR1) {
  CMP R2, R3                      
  BHI WhileDivisorSmaller             @   while (divisor < numberToCheckIfPrime) {
/* CMP R5, R6                  
  BEQ IsAPrimeNumber                  @     if (primeNumber = true ) {
  BNE NotAPrimeNumber                 @     else if (primeNumber = false) { */
  ADD R2, R2, #1                      @   numberToCheckIfPrime++;
  B GeneralBranch

WhileDivisorSmaller:  
  MOV R7, R2                          @ Computing result of (numberToCheckIfPrime % divisor) 
WhileDivisorSmallerWithin:
  CMP R7, #0
  BEQ RemainderIsZero  
  BGT RemainderGreaterThanZero
  BLT RemainderIsNegative
  ADD R3, R3, R6                      @     divisor++;
RemainderIsZero:                      @   if (numberToCheckIfPrime % divisor = 0) {
  //MOV R5, #0                        @     primeNumber = false; }
  B NotAPrimeNumber
RemainderGreaterThanZero:
  SUB R7, R7, R3                      // Performing division (subtraction of divisor)
  B WhileDivisorSmallerWithin
RemainderIsNegative:
  CMP R3, R2                           // !!!!! BLT beneath will send it in even if theyre equal?? Which then returns a primer number as a non primer number
  BLT RemainderNegativeDivisorSmaller // Checking whether number is divisble by every number smaller than it
  B IsAPrimeNumber                         
RemainderNegativeDivisorSmaller:
  ADD R3, R3, #1
  CMP R2, R3
  BEQ IsAPrimeNumber
  B WhileDivisorSmaller


IsAPrimeNumber:                       @ if (primerNumber = true) {
  ADD R0, R0, #1                      @   numberOfPrimerNumbers++; }
  ADD R2, R2, #1                      @   numberToCheckIfPrime++;
  MOV R3, #2                          @   int divisor = 2; }
  B GeneralBranch

NotAPrimeNumber:                      @ if (primeNumber = false) {
  ADD R2, R2, #1                      @   numberToCheckIfPrime++;
  MOV R3, #2                          @   int divisor = 2; }
  B GeneralBranch

NumberIsZero:                          
  MOV R0, #0
  B End_Main

  NumberIsOne:                          
  MOV R0, #1
  B End_Main

  /*
  int numberGivenInR0 = 18;
	int numberToCheckIfPrime = 2; 
	int divisor = 2;
	int numberOfPrimeNumbers = 1;  //(assuming number 1 is counted as prime)
	boolean primeNumber = true;
	while (numberToCheckIfPrime < numberGivenInR1){
		while (divisor < numberToCheckIfPrime){
			if (numberToCheckIfPrime % divisor == 0) {
				primeNumber = false;
        break;
			}
      divisor++;
		}
		if (primeNumber = true ) {
			numberOfPrimeNumbers++;
		}
		else if (primeNumber = false) {
			primeNumber = true;
		}
   numberToCheckIfPrime++;
  }
  */
  @ End of program ... check your result

End_Main:
  BX    lr
