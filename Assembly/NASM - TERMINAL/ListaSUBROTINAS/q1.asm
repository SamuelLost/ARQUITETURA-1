;Faça uma sub-rotina que receba um número inteiro e positivo N como parâmetro e retorne a soma dos números inteiros existente entre o número 1 e N (inclusive)
extern scanf
extern printf

section .data
fmd DB "%lu", 0

section .bss
n RESD 1 
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    pushad
    push n
    push fmd
    call scanf
    add ESP, 8
    popad
    
    mov EAX, 0
    push DWORD [n]
    call SomaInteiros
    
    push EAX
    push fmd
    call printf
    add ESP, 8
    pop EBP
    mov ESP, EBP
    xor eax, eax
    ret
    
SomaInteiros:
    enter 4,0
    push ECX 
    mov DWORD [EBP-4], 0
    mov ECX, [EBP+8]
L1:
    add DWORD [EBP-4], ECX
    loop L1
    
    mov EAX, [EBP-4]
    pop ECX
    leave
    ret 4
    