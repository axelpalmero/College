  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ 
  @ If x is a value in R1, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (x >= 5) {
  @   x = 0;
  @ }
  @

  @ 
  @ If y is a value in R2, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (y != 0) {
  @   y = y * 2;
  @ }
  @ else {
  @   y = 1;
  @ }
  @

  @ 
  @ If z is a value in R3, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (z >= 13 && z <= 23) {
  @   z = z - 12;
  @ else if (z == 0) {
  @   z = 12;
  @ }
  @

  @ 
  @ If a and b are values in R4 and R5, translate the following
  @   pseudocode into ARM Assembly Langauge
  @
  @ while (a >= 5) {
  @   b = b + (2 * a);
  @   a = a - 5;
  @ }
  @

End_Main:
  BX    lr

.end