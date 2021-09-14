extern	printf		         ; funcao C a ser chamada
extern scanf


section .data
msgin DB "%f", 0dh,0ah
mWrite DB "Funcionario nao tem direito ao aumento",0dh,0ah,0
msgSalario DB "O novo salario eh: %lf",0dh,0ah,0
limite DD 500
aumento DD 1.3

section .bss
salario RESD 1
resultado RESQ 1


SECTION .text                ; secao de codigo
        global main		  ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging
    
    push salario
    push msgin
    call scanf
    add esp, 8
    
    fld dword [salario]
    fild dword [limite]  
    fcomi ST0, ST1 
    ja darAumento
    push mWrite
    call printf
    add esp, 4
    
    
end:
    xor eax, eax
    ret
    
    
darAumento:
    fstp st0    
    fld dword[aumento]
    fmul ST0, ST1 
    fstp QWORD [resultado]
    
    push dword[resultado+4]
    push dword[resultado]
    push msgSalario
    call printf
    add esp, 12    
    jmp end