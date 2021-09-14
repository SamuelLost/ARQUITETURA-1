%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ah, 0
    mov al, '8'
    add al, '2'
    aaa
    or ax, 3030h
    xor eax, eax
    ret