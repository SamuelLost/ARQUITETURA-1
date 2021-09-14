extern scanf
extern printf

section .data
fmd DB "%lu", 0

section .bss
raio RESD 1
vol RESD 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    call scan
    
    push DWORD [raio]
    call CalculoDoVolume
    
    call print
    pop EBP
    mov ESP, EBP
    xor eax, eax
    ret
    
scan:
    enter 0,0
    pushad
    push raio
    push fmd
    call scanf
    add ESP, 8
    popad
    leave
    ret
    
CalculoDoVolume:
    enter 0,0
    mov EAX, [EBP+8]
    mov EBX, 4
    mul EBX
    mul EBX
    mov ECX, 3
    mul EBX
    div ECX
    mov [vol], EAX
    leave
    ret 4
    
 print:
    enter 0,0
    pushad
    push DWORD [vol]
    push fmd
    call printf
    add ESP, 8
    popad
    leave
    ret