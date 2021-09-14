;Escreva um programa que usa um laço para copiar os elementos de um array unsigned Word
;(16-bit) em um array unsigned doubleword (32-bit).
%include "io.inc"
section .data
ArrayW DW 1,2,3,4
size EQU ($-ArrayW)/2

section .bss 
ArrayDW RESD size
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ECX, size
    mov ESI, 0
    ;mov EAX, 0
L1:
    movzx EAX, WORD[ArrayW+ESI]
    mov [ArrayDW+(ESI*2)], EAX
    add ESI,2
    loop L1
    mov esi, 0
    mov ecx, size
P1:
    
    pushad
    PRINT_UDEC 4, [ArrayDW+ESI]
    popad
    add ESI, 4
    loop P1
    xor eax, eax
    ret