%include "io.inc"
section .data
fms DB "%lu", 0
section .bss
num1 RESD 1
num2 RESD 1
num3 RESD 1
result RESQ 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    push num1
    push fms
    call scanf
    add ESP, 8
    
    push num2
    push fms
    call scanf
    add ESP, 8
    
    push num3
    push fms
    call scanf
    add ESP, 8
    
    mov EAX, 0
    mov EAX, [num1]
    mov EBX, [num3]
    imul EBX
    add EAX, [num2]
    adc EDX, 0
    mov ecx, [num2]
    idiv ecx
    mov [result], EAX
    mov [result+4], EDX
    
    pushad
    push EAX
    push dword fms
    call printf
    add ESP, 8
    popad
    
    mov ESP, EBP
    pop EBP
    
    xor EAX, EAX
    ret