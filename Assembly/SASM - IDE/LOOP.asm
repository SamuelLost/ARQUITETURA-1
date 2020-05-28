%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV AX, 6
    MOV ECX, 4
L1:
    INC AX
    LOOP L1
    ;write your code here
    xor eax, eax
    ret