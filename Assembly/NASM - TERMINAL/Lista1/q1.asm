;Receba dois números, calcule e mostre a subtração do primeiro pelo segundo
%include "io.inc"
section .bss
num1 RESD 1
num2 RESD 1
result RESD 1
section .text
global CMAIN
CMAIN:
    GET_DEC 4, num1
    GET_DEC 4, num2
    mov EAX, [num1]
    mov EBX, [num2]
    sub EAX, EBX
    mov [result], EAX
    PRINT_DEC 4, result
    xor eax, eax
    ret