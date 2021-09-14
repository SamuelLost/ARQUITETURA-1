;Faça uma sub-rotina que verifique se o número é positivo ou negativo
extern scanf
extern printf

section .data
fmd DB "%ld", 0
fms DB "%s", 0
negativo DB "Número é negativo", 0
positivo DB "Número é positivo", 0
section .bss
num1 RESD 1
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    call scan
    push DWORD [num1]
    call PositivoOuNegativo
    
    pop EBP
    mov ESP, EBP
    xor eax, eax
    ret
    
scan:
    enter 0,0
    pushad
    push num1
    push fmd
    call scanf
    add ESP, 8
    popad
    leave
    ret
    
PositivoOuNegativo:
    enter 0,0
    mov EAX, [EBP+8]
    mov ECX, -1
    mul ECX
    jns Negativo
    js Positivo
    
Negativo:
    pushad
    push negativo
    push fms
    call printf
    add ESP, 8
    popad
    
    jmp END
    
Positivo:
    enter 0,0
    pushad
    push positivo
    push fms
    call printf
    add ESP, 8
    popad
    leave
    jmp END
    
END:
    leave
    ret 4