; Crie uma sub-rotina que receba três parâmetros, horas, minutos e segundos, e os converta para segundos
extern scanf
extern printf
section .data
fmd DB "%lu", 0

section .bss
horas RESD 1
min RESD 1
segs RESD 1
result RESD 1
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    pushad
    push horas
    push fmd
    call scanf
    add ESP, 8
    popad
    
    pushad
    push min
    push fmd
    call scanf
    add ESP, 8
    popad
    
    pushad
    push segs
    push fmd
    call scanf
    add ESP, 8
    popad
    
    mov EAX, 0
    push DWORD [segs]
    push DWORD [min]
    push DWORD [horas]
    mov EBX, 3600
    mov ECX, 60
    call Segundos
    
    push DWORD [result]
    push fmd
    call printf
    add ESP, 8
    
    pop EBP
    mov ESP, EBP
    xor eax, eax
    ret
    
Segundos:
    enter 0,0
    mov EAX, [EBP+8] ;horas
    mul EBX
    add [result], EAX
    mov EAX, [EBP+12]
    mul ECX
    add [result], EAX 
    mov EAX, [EBP+16]
    add [result], EAX 
    leave 
    ret 12