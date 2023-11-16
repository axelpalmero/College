  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 7

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])newString
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&newString
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &newString and length at
  @   least 128. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @

  MOV   R7, #0        @ counterFirstWord = 0;
  MOV   R8, #0        @ counterCharWithinWord = 0;

While:    //Checks whether elem is a letter or not
  LDRB  R2, [R1]              @ elem = word[address]; 
  CMP   R2, #0                @ if (elem == 0) {
  BEQ   EndWhile              @   break; }
  CMP   R2, #'A'              @ if (char is not a letter)
  BLO   NotLetter             @ {
  CMP   R2, #'z'              @ if (char is not a letter)
  BGT   NotLetter             @ { 
  CMP   R2, #'Z'              @ if (char is UpperCaseLetter)
  BLO   UpperCaseLetter       @ {
  CMP   R2, #'a'              @ if (char is LowerCaseLetter)
  BGT   LowerCaseLetter       @ {
  B     NotLetter             @ if (char is not a letter) {
UpperCaseLetter:
  CMP   R7, #0                @ if (counterFirstWord == 0) 
  BNE   NotFirstWordUpper     @ {
  ADD   R2, R2, #0x20         @   makeLowerCase; }
  STRB  R2, [R0]              @   add char to new String
  ADD   R7, #1                @   counterFirstWord++;
  ADD   R8, #1                @   counterCharWithinWord++;
  ADD   R1, R1, #1            @   address = address + 1;
  ADD   R0, R0, #1            @   newAddress = newAddress + 1;
  B     While
LowerCaseLetter:
  CMP   R7, #0                @ if (counterFirstWord != 0) {
  BNE   NotFirstWordLower
  STRB  R2, [R0]              @   add char to new String
  ADD   R7, #1                @   counterFirstWord++;
  ADD   R8, #1                @   counterCharWithinWord++;
  ADD   R1, R1, #1            @   address = address + 1;
  ADD   R0, R0, #1            @   newAddress = newAddress + 1;
  B     While
NotLetter:
  MOV   R8, #0                @ counterCharWithinWord = 0;
  ADD   R1, R1, #1            @ address = address + 1;
  B     While
NotFirstWordUpper:
  CMP   R8, #0                @ if (firstCharOfWord) 
  BEQ   NextChar              @ {
  ADD   R2, R2, #0x20         @ if (notFistCharOfWord) { makeLowerCase; }
  STRB  R2, [R0]              @   add char to new String
  ADD   R8, #1                @   counterCharWithinWord++;
  ADD   R1, R1, #1            @   address = address + 1;
  ADD   R0, R0, #1            @   newAddress = newAddress + 1;
  B     While
NotFirstWordLower:
  CMP   R8, #0                @ if (NotFirstCharOfWord) 
  BNE   NextChar              @ {
  SUB   R2, R2, #0x20         @ if (firstCharOfWord) { makeUpperCase; }
  STRB  R2, [R0]              @   add char to new String
  ADD   R8, #1                @   counterCharWithinWord++;
  ADD   R1, R1, #1            @   address = address + 1;
  ADD   R0, R0, #1            @   newAddress = newAddress + 1;
  B     While
NextChar:
  STRB  R2, [R0]              @   add char to new String
  ADD   R8, #1                @   counterCharWithinWord++;
  ADD   R1, R1, #1            @   address = address + 1;
  ADD   R0, R0, #1            @   newAddress = newAddress + 1;
  B     While
EndWhile:
  STRB  R2, [R0]              @ new String += 0; }

  @ End of program ... check your result


End_Main:
  BX    lr
