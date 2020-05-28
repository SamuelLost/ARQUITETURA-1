%include "io.inc"
section .data
teste DB "Teste", 0Ah, 0, "hahaha",0
section .bss
var1 RESB 20 ;reservando 20bytes na memória
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_STRING var1, 20
    PRINT_STRING var1
    ;PRINT_STRING teste
    ;PRINT_STRING teste+7 ;acessando o "hahaha"
    xor eax, eax
    ret