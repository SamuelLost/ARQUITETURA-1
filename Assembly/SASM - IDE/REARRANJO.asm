%include "io.inc"
;Escreva um programa que rearrange os valores de três doubleword (4 bytes) do seguinte array como: 3, 1, 2.
section .data
arrayD DD 1,2,3 ;ESPAÇO DE 4BYTES ENTRE UM E OUTRO
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV EAX, [arrayD]    ;SUBO O 1 PARA O EAX
    XCHG EAX, [arrayD+4] ;TROCO O 1 COM 2, O 2 SOBE PARA O EAX
    XCHG EAX, [arrayD+8] ;TROCO O 2 COM 3, O 3 SOBE PARA O EAX
    MOV [arrayD], EAX    ;MOVO O 3 QUE FICOU NO EAX PARA O COMEÇO DO ARRAY
    xor eax, eax
    ret