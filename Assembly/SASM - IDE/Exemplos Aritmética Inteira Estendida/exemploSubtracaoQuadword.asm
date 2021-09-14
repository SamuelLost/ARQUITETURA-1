%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov edx, 1h
    mov eax, 0
    sub eax, 1
    sbb edx, 0
    xor eax, eax
    ret