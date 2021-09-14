%include "io.inc"

section .bss
var1 RESD 1
var2 RESD 1
var3 RESD 1
var4 RESD 1
section .text

global CMAIN
CMAIN:
    GET_DEC 4, [var1]
    GET_DEC 4, [var2]
    GET_DEC 4, [var3]
    mov AX, [var1]
    add AX, [var2]
    add AX, [var3]
    mov [var4], AX 
    PRINT_DEC 4,[var4]
    xor eax, eax
    ret