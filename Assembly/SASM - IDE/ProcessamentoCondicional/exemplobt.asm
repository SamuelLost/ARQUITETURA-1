%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ax, 1000001110000011b
    bt ax,7
    
    xor eax, eax
    ret