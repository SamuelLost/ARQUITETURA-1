extern printf ; Chamando do C
extern scanf  ; Chamando do C

SECTION .data 
    
    fms DB "%lu", 0   ; formato do printf/scanf de 32 bits, '0'
    fmt DB "%llu", 0  ; formato do printf/scanf de 64 bits, '0'

SECTION .bss
    num1 RESD 1
    result RESD 1

SECTION .text 
    global main
main: 
    push EBP
    mov EBP, ESP

    

    push num1  ; endereço do inteiro sem sinal de 32bits 
    push fms   ; argumentos são empilhados 
    call scanf
    add ESP, 4 ; remove parâmetros 

    mov EAX, [num1]
    mov ECX, [num1]

L1:
    cmp ECX, 1
    jle FIM

    sub ECX, 1
    mul ECX
    jmp L1

FIM: 
    mov [result], EAX
    push DWORD [result]
    push DWORD fms
    call printf
    add ESP, 8
    mov ESP, EBP
    pop EBP

    xor EAX, EAX
    ret