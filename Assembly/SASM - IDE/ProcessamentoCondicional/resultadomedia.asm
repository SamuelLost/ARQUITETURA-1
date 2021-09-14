%include "io.inc"

section .data

aprovado db "Voce foi aprovado na disciplina de Arquitetura I",0
af db "Voce esta em AF na disciplina de Arquitetura I",0
reprovado db "Voce foi reprovado na disciplina de Arquitetura I",0

section .bss
nota resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 1, nota
    mov al, [nota]
    cmp al, 7
    jae PASSOU
    cmp al, 4
    jns EMAF
    PRINT_STRING reprovado    
    
FIM:
    xor eax, eax
    ret
    
    
PASSOU:
    PRINT_STRING aprovado    
    jmp FIM
    
EMAF:
    PRINT_STRING af    
    jmp FIM