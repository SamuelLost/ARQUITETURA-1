;Escreva um programa que usa um laço para copiar os elementos de um array unsigned Word
;(16-bit) em um array unsigned doubleword (32-bit).
extern printf
section .data
ArrayW DW 1,2,3,4
size EQU ($-ArrayW)/2
fms DB "%lu", 0

section .bss 
ArrayDW RESD size
safeEDX RESD 1
safeECX RESD 1
section .text
global main
main:
    ;push ebp
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    mov ECX, size
    mov ESI, 0
    ;mov EAX, 0
L1:
    movzx EAX, WORD[ArrayW+ESI]
    mov [ArrayDW+(ESI*2)], EAX
    add ESI,2
    loop L1
    
    mov ECX, size
    mov EDX, 0
P1:
    mov EAX, [ArrayDW+EDX]
    push EAX
    push DWORD fms
    mov [safeEDX], EDX
    mov [safeECX], ECX
    call printf
    add esp, 8
    mov esp, ebp
    mov EDX, [safeEDX]
    mov ECX, [safeECX]
    add EDX, 4
    loop P1

    pop ebp
    xor eax, eax
    ret