%include "io.inc"

section .data
var1 dd 10
var2 dd 5
var3 dd 4

section .bss
result resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;var4 = (var1 * -5) / (-var2 % var3)
    mov eax, [var2]
    mov ebx, [var3]
    neg eax
    cdq
    idiv ebx
    mov ebx, edx
    mov eax, [var1]
    mov ecx, 5
    neg ecx
    imul ecx
    idiv ebx
    xor eax, eax
    ret