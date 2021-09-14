%include "io.inc"
section .data
cem DD 100
section .bss
vendas RESD 5
percentual RESD 5
soma RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ECX, 5
    mov ESI, 0
ENTRADAS:
    pushad
    GET_UDEC 4, [vendas+ESI]
    popad
    add ESI, 4
    
    loop ENTRADAS
    mov ESI, 0
    mov ECX, 5
perc:
    pushad
    GET_UDEC 4, [percentual+ESI]
    popad
    add ESI, 4
    
    loop perc
    mov ECX, 5
    mov ESI, 0
    mov [soma], ESI
    
calc:
    ;pushad
    mov eax, [vendas+ESI]
    mov ebx, [percentual+ESI]
    mul ebx
    div DWORD [cem]
    add [soma], eax
    add ESI, 4
    ;popad
    loop calc
    xor eax, eax
    ret