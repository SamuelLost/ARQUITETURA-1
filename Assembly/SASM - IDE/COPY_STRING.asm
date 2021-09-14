%include "io.inc"

;Este código copia uma string da origem para o destino

section .data

    source DB "This is the source string",0

    sizeOfSource DB $-source

section .bss

    target RESB sizeOfSource-source

section .text
global CMAIN
CMAIN:
    mov esi,0                    ; registrador de indice

    mov ecx, [sizeOfSource]      ; contador de laco

L1:

    mov al,[source+esi]          ; pega o char na origem

    mov [target+esi],al          ; armazena o char no destino

    inc esi                      ; move para o proximo caractere

    loop L1
    PRINT_STRING target
    xor eax, eax
    ret