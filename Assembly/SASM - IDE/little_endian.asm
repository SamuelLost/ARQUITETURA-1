%include "io.inc"
section .bss ;conteudo não inicializado
num RESD 1 ;4bytes
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_HEX 4, num ;42243172
    mov EAX, [num]
    mov [num], EAX
    ;mov AX, [num] ;pega os menos siginficativos do msm jeito
    ;mov [num], AX
    ;mov AX, [num+2] vai pegar o mais significativo
    PRINT_HEX 1, num ;little endian
    xor eax, eax
    ret