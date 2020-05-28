%include "io.inc"

section .data
    hello: db 'Hello, World!', 10 ;10 é para quebrar linha
    hellolen: equ $-hello ;$ significa a posição atual da memória, fazendo a subtração com o hello e descobrindo o tamanho
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov eax, 4
    mov ebx, 1 
    mov ecx, hello
    mov edx, hellolen
    int 80h
    xor eax, eax
    ret