extern printf
extern scanf

section .data
fmd DB "%lu", 0
fmq DB "%llu", 0
section .bss
num1 RESD 1
result RESQ 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    mov EAX, 0
    mov EDX, 0
    mov ECX, 0
    
    pushad
    push num1
    push fmd
    call scanf
    add ESP, 8
    popad
    
    mov EAX, [num1]
    cmp EAX, 1
    je Base
    mov ECX, EAX
    mov ESI, num1
    
    push ESI
    call FactorialRecursive
    mov [result], EAX
    
    pushad
    push dword[result]
    push fmq
    call printf
    add ESP, 8
    popad
    

    
final:
    mov ESP, EBP
    pop EBP
    xor eax, eax
    ret
    
FactorialRecursive:
    enter 0,0
    cmp ECX, 1
    je end
    dec ECX
    mul ECX
    call FactorialRecursive
    
end:
    leave 
    ret 4
    
Base: 
    mov EAX, 1
    jmp final