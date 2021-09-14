%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov AH, 01111110b
    add AH, 01000000b
    xor eax, eax
    ret