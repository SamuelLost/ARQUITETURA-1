%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV AL, 5h
    MOV BL, 4h
    XCHG AX, BX
    ;write your code here
    xor eax, eax
    ret