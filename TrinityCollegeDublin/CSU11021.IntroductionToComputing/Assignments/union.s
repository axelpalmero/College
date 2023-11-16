  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 6

  @
  @ TIP: To view the contents of setC while debugging, you can add
  @      the following watch expression, remembering that the first value
  @      listed should be the size of setC and the remaining values shown
  @      should be the values in the set in memory.
  @
  @      (int [64])setC
  @

    // Copy every element from A into C
  LDR   R3, [R1]      @ sizeA = word[adrA]
  CMP   R3, #0        @ if (setA is empty)
  BEQ   SetAEmpty     @ {
  ADD   R1, R1, #4    @ adrA += 4
  ADD   R7, R0, #4    @ tmpAdrC = adrC + 4 // leave space for size
  MOV   R4, #0        @ sizeC = 0
  MOV   R5, #0        @ count = 0
WhCpyA:
  CMP   R5, R3        @ while (count < sizeA)
  BEQ   EndWhCpyA     @ {
  LDR   R6, [R1]      @   elem = word[adrA]

  STR   R6, [R7]      @   word[adrC] = elem
  ADD   R7, R7, #4    @   adrC += 4
  ADD   R4, R4, #1    @   sizeC++

  ADD   R1, R1, #4    @   adrA += 4
  ADD   R5, R5, #1    @   count++
  B     WhCpyA        @ }
EndWhCpyA:

    //For every element in B that is not already in C, copy it into C
  LDR R3, [R2]        @ sizeB = word[adrB]
  ADD R2, R2, #4      @ adrB += 4
  LDR R6, [R2]        @ elemB = word[adrB]
  MOV R5, #0          @ counterB = 0;
  MOV R11, R0         @ tempAddressC2 = addC;
  ADD R11, R11, #4    @ move onto first element of C (leave space for counter R4)
  LDR R8, [R11]       @ elemC = word[tempAddressC2];
  MOV R9, #1          @ boolUnique = true;
WhileScanningB:
  CMP R5, R3          @ while (counterB < sizeB)
  BEQ EndScanningB    @ {
WhileCheckingUnique:
  CMP R11, R7         @ wile (tempAddressC2 < addressC) 
  BEQ EndCheckUnique  @ {
  CMP R6, R8          @   if (elemB == elemC)
  BEQ NotUnique       @    {
  ADD R11, R11, #4    @ tempAddressC2 += 4;
  LDR R8, [R11]       @ elemC = word[tempAddressC2]; }
  B WhileCheckingUnique
EndCheckUnique:
  CMP R9, #1          @ if (boolUnique == true) 
  BEQ UniqueElement   @ {
Reset:
  ADD R2, R2, #4      @ addrB += 4;
  LDR R6, [R2]        @ elemB = word[addrB];
  ADD R5, R5, #1      @ counterB++;
  MOV R11, R0         @ tempAddressC2 = addC;  //resetting address for element C used to compare with C to start of C
  ADD R11, R11, #4    @ move onto first element of C (leave space for counter R4)
  LDR R8, [R11]       @ elemC = word[tempAddressC2];     
  MOV R9, #1          @ boolUnique = true;    
  B WhileScanningB

UniqueElement:
  ADD R4, R4, #1      @   sizeC++;
  STR R6, [R7]        @   setC += elemB;
  ADD R7, R7, #4      @   addC += 4; }
  B Reset

NotUnique:
  MOV R9, #0          @       boolUnique = false; 
  B Reset    @ }

SetAEmpty:            // Set A is empty, therefore setC is setB
  LDR   R3, [R2]      @ sizeB = word[adrB]
  MOV   R4, R3        @ sizeC = sizeB;
  ADD   R2, R2, #4    @ adrB += 4
  ADD   R7, R0, #4    @ tmpAdrC = adrC + 4 // leave space for size
  MOV   R4, #0        @ sizeC = 0
  MOV   R5, #0        @ count = 0
WhCpyB:
  CMP   R5, R3        @ while (count < sizeb)
  BHS   EndScanningB     @ {
  LDR   R6, [R2]      @   elem = word[adrB]

  STR   R6, [R7]      @   word[adrC] = elem
  ADD   R7, R7, #4    @   adrC += 4

  ADD   R2, R2, #4    @   adrB += 4
  ADD   R5, R5, #1    @   count++
  B     WhCpyB        @ }


EndScanningB:
@ Store the final size of C in memory
  STR   R4, [R0]      @ word[adrC] = sizeC
  
  
  @ End of program ... check your result


End_Main:
  BX    lr
