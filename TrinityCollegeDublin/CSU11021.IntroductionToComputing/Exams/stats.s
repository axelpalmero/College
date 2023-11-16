  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

//  Find the average
  LDR   R5, [R2]      @ sizeOfSet = word[addA]
  MOV   R6, #0        @ sum = 0
  MOV   R7, R5        @ count == sizeOfSet
  ADD   R2, R2, #4    @ adrA += 4
SumWhile:
  CMP   R7, #0        @ while (count != 0)
  BEQ   EndSumWhile
  LDR   R3, [R2]      @ elem = word[addA]
  ADD   R6, R6, R3    @ sum += elem
  ADD   R2, R2, #4    @ adrA += 4
  SUB   R7, R7, #1    @ count -= 1
  B     SumWhile
EndSumWhile:
  MOV   R7, #0        @ meanValue == 0                     //R7 now holds the mean value, not a counter
MeanWhile:
  CMP   R6, #0        @ if (sum == 0)
  BEQ   ZeroMean
  CMP   R6, R5        @ while (sum >= sizeOfSet)
  BLT   EndMeanWhile
  SUB   R6, R6, R5    @ sum = sum - sizeOfSet
  ADD   R7, R7, #1    @ meanValue++ 
  B     MeanWhile
ZeroMean:
  MOV   R0, #0        @ mean == 0
  B     EndMeanWhile
EndMeanWhile:
  MOV   R0, R7        @ R0 = meanValue

//  Return to initial address to find mode
  MOV   R4, R5        @ counter2 = sizeOfSet
ReturnToInitialAddress:
  CMP   R4, #0
  BEQ   EndReturnToInitialAddress
  SUB   R2, R2, #4    @ address -= 4
  SUB   R4, R4, #1    @ counter2--
  B     ReturnToInitialAddress
EndReturnToInitialAddress:

//  Find mode
  MOV   R4, R2        @ copyAddress2 = addA
  MOV   R6, R5        @ counter3 = sizeOfSet
  MOV   R7, R2        @ copyAddress = addA
  MOV   R8, #0        @ highestCount = 0
  MOV   R9, #0        @ currentCount = 0
  MOV   R10, #0       @ tempElement = 0
ModeWhile:
  CMP   R5, #0        @ while (sizeOfSet != 0)
  BEQ   EndModeWhile
  LDR   R3, [R4]      @ elem = word[addA]
  MOV   R6, R5        @ counter3 = sizeOfSet

InternalCheck:
  CMP   R6, #0        @ while (counter3 != 0)
  BEQ   EndInternalCheck
  LDR   R10, [R7]     @ elementTemp = word[copyAddress]
  CMP   R10, R3       @ if (elementTemp == elem)
  BEQ   TempEqual
  SUB   R6, R6, #1    @   counter3--
  ADD   R7, R7, #4    @   copyAddress += 4
  B     InternalCheck
EndInternalCheck:
  MOV   R7, R2        @ copyAddress = addA
  ADD   R4, R4, #4    @ addA += 4
  CMP   R8, R9  
  BLT   NewHighestCount
  SUB   R5, R5, #1    @ sizeOfSet--
  ADD   R4, R4, #4    @ copyAddress2 += 4
  MOV   R9, #0        @ currentCount = 0
  B     ModeWhile

TempEqual:
  ADD   R9, R9, #1    @     currentCount++
  SUB   R6, R6, #1    @     counter3--
  ADD   R7, R7, #4    @ addA += 4
  B     InternalCheck

NewHighestCount:
  MOV   R8, R9        @ highestCount = currentCount
  MOV   R1, R3        @ mode = elem
  MOV   R9, #0        @ currentCount = 0
  B     ModeWhile

EndModeWhile:

End_Main:
  BX    lr
