%include "io.inc"

section .data
acesa db "As Luzes indice 7,5,1 estao ligadas",0
apagada db "As Luzes indice 7,5,1 estao desligadas",0

section .bss
result resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov al, 10100011b    ;valor avaliado
    mov bl, al
    and bl, 10100010b    ;mascara testa bits 7, 5 , 1
    cmp bl, 10100010b
    
    jz LIGADO
    PRINT_STRING apagada
    
FIM:    
    mov [result], al       
    xor eax, eax
    ret
    
LIGADO:
    PRINT_STRING acesa    
    jmp FIM
    
    
    ;and
    ;or
    ;not
    ;xor