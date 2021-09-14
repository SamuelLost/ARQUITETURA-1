; Escreva um programa que calcula a seguinte expressão usando registradores: A = (A + B) − (C + D).
; Associe valores inteiros aos registradores EAX, EBX, ECX, e EDX.
%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov EAX, 10
    mov EBX, 4
    mov ECX, 1
    mov EDX, 12
    
    add EAX, EBX  ;A = (A+B)
    add ECX, EDX  ;C = (C+D)
    sub EAX, ECX  ;A = A-C
    
    PRINT_DEC 4, EAX
    xor eax, eax
    ret