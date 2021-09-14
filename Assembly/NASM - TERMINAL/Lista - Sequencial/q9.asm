%include "io.inc"
;Área de um trapézio A = ((Base Maior + Base Menor)*Altura)/2
extern scanf
extern printf
section .data
fmt DB "%f", 0
dois DD 2
section .bss
baseMaior RESD 1
baseMenor RESD 1
Altura RESD 1
Area RESQ 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push baseMaior
    push fmt
    call scanf
    add ESP, 8
    
    push baseMenor
    push fmt
    call scanf
    add ESP, 8
    
    push Altura
    push fmt
    call scanf
    add ESP, 8
    
    fld DWORD[baseMaior]
    fld DWORD[baseMenor]
    fadd ST0, ST1
    
    fld DWORD[Altura]
    fmul 
    fild DWORD [dois]
    fdiv
    fstp QWORD[Area]
    
    push DWORD[Area+4]
    push DWORD[Area]
    push fmt
    call printf
    add ESP, 12
    
    xor eax, eax
    ret