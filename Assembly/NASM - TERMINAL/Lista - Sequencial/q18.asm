; Programa para transformar Celsius em Fahrenheit: F = 180*(C+32)/100
extern printf
extern scanf
section .data
menu DB "Digite uma temperatura em ºC: ", 0
fmt DB "%f", 0
final DB "Temperatura em ºF: %f", 0xA, 0
TrintaeDois DD 32
Cento80 DD 180
Cem DD 100
section .bss
C RESD 1
F RESQ 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    push menu
    call printf
    add ESP, 4
    push C
    push fmt
    call scanf
    add ESP, 8
    
    fld DWORD[C]
    fild DWORD[TrintaeDois]
    fadd ST1
    fild DWORD[Cento80]
    fmul 
    fild DWORD[Cem]
    fdiv 
    fstp QWORD[F]
    
    push DWORD[F+4]
    push DWORD[F]
    push final
    call printf
    add ESP, 12
    xor eax, eax
    ret