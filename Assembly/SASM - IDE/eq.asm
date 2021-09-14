%include "io.inc"

section .data
num1 dd 456123h
num2 dd 10h
num3 dq 1234561111h

section .bss
result resq 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging    ; num1 * num2 + num3
    mov eax, [num1]
    mov ebx, [num2]
    mul ebx
    add eax, [num3]
    adc edx, [num3+4]
    mov [result], eax
    mov [result+4], edx
    xor eax, eax
    ret