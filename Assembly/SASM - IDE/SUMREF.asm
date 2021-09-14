; SOMA PASSAGEM POR REFERENCIA
extern scanf
extern printf
section .data
    a DD 8
    b DD 10
    fmt DB "%d", 0
    
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push a
    push b
    call Soma
    xor eax, eax
    ret
    
Soma:
    enter 0,0
    mov ESI, [EBP+8]
    mov EDI, [EBP+12]
    mov EAX, [ESI]
    mov EBX, [EDI]
    add EAX, EBX
    leave
    ret 8