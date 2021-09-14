%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov edx, 0h
    mov eax, 0ffffffffh
    add eax, 1
    adc edx, 0
    xor eax, eax
    ret