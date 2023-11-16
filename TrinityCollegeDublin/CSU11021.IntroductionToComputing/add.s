  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

 /* LDR   R4, #0                                    @ elemToBeMoved = 0
  LDR   R6, #0                                    @ index2 (index where element to be moved just was)

While:
  CMP   R1, R2-1                                  @ if (oldIndex == newIndex-1) {
  BEQ   End_Main
  LDR   R4, [R0, R1, LSL #2]                      @ elemToBeMoved = word[address + oldIndex * 4]
  LDR   R5, [R0, R1+1, LSL #2]                    @ addressToMoveInto = word[address + (oldIndex+1) * 4]
  LDR   [R0, R1, LSL #2], R5                      @ word[address + oldIndex * 4] = 
  LDR   [R0, R1+1, LSL #2], R4                    @ word[address + (oldIndex+1) * 4] = elemToBeMoved
  ADD   R1, R1, #1                                @ oldIndex++;
  B     While */

  /*MOV   R4, #0                                    @ tempElem = 0;
  LDR   R4, [R0, R1, LSL #2]                      @ tempElem = word[array + oldIndex * 4]
  LDR   R5, [R0, R2, LSL #2]                      @ elemToBeCleared = word[array + newIndex * 4]
  MOV   R8, #4                                    
  MOV   R9, R1                                    @ copyOfOldIndex = oldIndex
  MUL   R9, R9, R8                      
  ADD   R9, R0, R9
  STR   R5, [R1]
  MUL   R2, R2, R8
  ADD   R2, R0, R2
  STR   R2, [R4]*/

  SUB   R3, R1, R2                                @ numReps = newIndex - oldIndex
  LDR   R4, [R0, R1, LSL #2]                      @ elemToBeMoved = word[address + oldIndex * 4]
While:
  ADD   R10, R1, #1                               @ copyOldIndex = oldIndex + 1
  CMP   R3, #0
  BEQ   End_Main
  LDR   R5, [R0, R10, LSL #2]                      @ tempElem = word[address + copyOldIndex * 4]
  SUB   R10, R10, #1                               @ copyOldIndex--
  MOV   R8, #4
  MUL   R10, R10, R8                               @ copyOldIndex * 4
  ADD   R10, R0, R10                               @ add = addStart + byteOffset
  STR   R5, [R10]                                  @ replace with value that was after
  ADD   R1, R1, #1                                 @ oldIndex++
  SUB   R3, R3, #1                                 @ numReps--
  B     While
  MUL   R2, R2, R8
  ADD   R2, R0, R2
  STR   R4, [R2]

End_Main:
  BX    LR

  .end