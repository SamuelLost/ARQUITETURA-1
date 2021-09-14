;Receba um vetor de 10 elementos digitados pelo usuário,
;incremente em uma unidade cada valor e escreve o resultado na tela.
%include "io.inc"
section .bss
ArrayDW RESD 10
;section .data
;SizeOfArray DD (($-ArrayDW)/4)
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ECX, 10
    mov ESI, 0
    mov EAX, 1
L1:
    GET_DEC 4, [ArrayDW+ESI]
    add [ArrayDW+ESI], EAX
    
    add ESI, 4
    loop L1
    mov ESI, 0
    mov ECX, 10
PRINT:
    PRINT_DEC 4, [ArrayDW+ESI]
    add ESI, 4
    loop PRINT   
    xor eax, eax
    ret