%include "io.inc"
section .data
teste db "Teste", 0Ah, 0 ;0Ah é o \n e o 0 é o final da string
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_STRING teste, 7  ;habilita o input para escrever e sobrescreve a variavel teste
    PRINT_STRING teste   ;modo fácil, pela io.inc
    xor eax, eax
    ret