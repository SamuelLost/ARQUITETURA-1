%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov al, 10000011b
    test al, 10000011b
    
    xor eax, eax
    ret