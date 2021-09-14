; Fibonacci
%include "io.inc"
section .data
ant DD 0
prox DD 1
count DD 7
section .bss
soma RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ECX, [count]
    mov EAX, 0
    mov EDX, 0
    mov EBX, [ant]
FIBONACCI:
    mov EAX, [ant]
    add EBX, [prox]
    mov [soma], EBX
    add EAX, [prox]
    mov EDX, [prox]
    mov [prox], EAX
    mov [ant], EDX
    loop FIBONACCI
    ;mov [soma], EAX
    xor eax, eax
    ret 