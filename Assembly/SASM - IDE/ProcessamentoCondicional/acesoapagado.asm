%include "io.inc"

section .data
acesa db "A Luz indice 7 esta ligada",0
apagada db "A luz indice 7 está desligada",0

section .bss
result resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov al, 10000011b    ;valor avaliado
    and al, 10000000b    ;mascara
    jz DESLIGADO
    PRINT_STRING acesa
FIM:    
    mov [result], al       
    xor eax, eax
    ret
    
DESLIGADO:
    PRINT_STRING apagada    
    jmp FIM
    
    
    ;and
    ;or
    ;not
    ;xor