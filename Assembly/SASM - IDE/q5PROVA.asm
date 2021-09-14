extern scanf
extern printf
%include "io.inc"   ;86400+3540+59
section .data
fms DB "%lu", 0
section .bss
hora RESB 1
min RESB 1
segundos RESB 1
result RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push EBP
    mov EBP, ESP
    
    push hora
    push fms
    call scanf
    add ESP, 4
    
    push min
    push fms
    call scanf
    add ESP, 4
    
    push segundos
    push fms
    call scanf
    add ESP, 4
    
    mov EAX, 0
    movzx EAX, byte[hora]
    mov ecx, 3600
    mul ecx
    add [result], eax
    
    movzx eax, byte[min]
    mov ecx, 60
    mul ecx
    add [result], eax
    
    movzx eax, byte[segundos]
    add [result], eax
    
    pushad
    push DWORD [result]
    push dword fms
    call printf
    add ESP, 8
    popad
    
    mov ESP, EBP
    pop EBP
    
    xor EAX, EAX
    ret