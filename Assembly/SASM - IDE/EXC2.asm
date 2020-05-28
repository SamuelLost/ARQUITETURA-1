%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 5
    mov ebx, 10
    add eax, ebx
    add eax, 5
    xor eax, eax
    ret