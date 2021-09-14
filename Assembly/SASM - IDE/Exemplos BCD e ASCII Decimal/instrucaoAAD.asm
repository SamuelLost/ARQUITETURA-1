%include "io.inc"

section .bss
    quotient RESB 1
    remainder RESB 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ax,0307h		; dividend
    aad			; AX = 0025h
    mov bl,5			; divisor
    div bl			; AX = 0207h
    mov [quotient],al
    mov [remainder],ah
    xor eax, eax
    ret
    
    
    
    

