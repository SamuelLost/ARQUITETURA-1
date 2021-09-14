extern scanf
extern printf

section .data
fmd DB "%lu", 0
fms DB "%s", 0
true DB "É triângulo", 10, 0
false DB "Não é triângulo",10, 0
equilatero DB "Equilátero",10, 0
isosceles DB "Isósceles", 10, 0
escaleno DB "Escaleno", 10, 0
section .bss
A RESD 1
B RESD 1
C RESD 1
count RESD 1
flagNoTriangle RESB 1
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    call scan
    push DWORD [A]
    push DWORD [B]
    push DWORD [C]
    call ValidityTriangle
    cmp BYTE[flagNoTriangle], 1 ; Não é um triângulo
    jz FinalDeTudo
    push DWORD [A]
    push DWORD [B]
    push DWORD [C]
    call TypeTriangle
FinalDeTudo:
    pop EBP
    mov ESP, EBP
    xor eax, eax
    ret
    
scan:
    enter 0,0
    pushad
    push A
    push fmd
    call scanf
    add ESP, 8
    
    push B
    push fmd
    call scanf
    add ESP, 8
    
    push C
    push fmd
    call scanf
    add ESP, 8
    popad
    leave
    ret
    
ValidityTriangle:
    enter 0,0
    mov ECX, [EBP+8] ;Lado C
    mov EBX, [EBP+12];Lado B
    mov EAX, [EBP+16];Lado A ;pular para fazer count++, se count = 3 é triangulo
    add EBX, ECX ;EBX = B + C
    cmp EAX, EBX ; A <= B+C ?
    jle ContaLado
    jmp l3
l1:    
    mov EBX, [EBP+12];Lado B
    mov EAX, [EBP+16];Lado A
    add EAX, ECX ;EAX = A+C
    cmp EBX, EAX ;B <= A+c?
    jle ContaLado
    jmp l3
l2:  
    mov EAX, [EBP+16];Lado A
    mov ECX, [EBP+8] ;Lado C
    add EAX, EBX ; EAX = A+B
    cmp ECX, EAX ; C <= A+B?
    jle ContaLado
    jmp l3
l3: 
    cmp DWORD[count], 3
    jz print
    pushad
    push false
    push fms
    call printf
    add ESP, 8
    popad
    mov BYTE[flagNoTriangle], 1 ; Não é um triângulo
    jmp END
print:
    pushad
    push true
    push fms
    call printf
    add ESP, 8
    popad
END:
    leave 
    ret 12
    
ContaLado:
    inc DWORD[count]
    cmp DWORD[count], 1
    je l1
    cmp DWORD[count], 2
    je l2
    cmp DWORD[count], 3
    je l3
;----------------------------------------------    
TypeTriangle:
    enter 0,0
    mov ECX, [EBP+8] ;Lado C
    mov EBX, [EBP+12];Lado B
    mov EAX, [EBP+16];Lado A
    mov DWORD[count], 0
    
    cmp EAX, EBX
    jz I1
    jmp A1
I1: 
    call incrementa
A1:
    cmp EAX, ECX
    jz I2
    jmp A2
I2:
    call incrementa 
A2:
    cmp ECX, EBX
    jz I3
    jmp Tipo
I3:
    call incrementa
  
Tipo:
    cmp DWORD[count], 2
    jz Equilatero
    
    cmp DWORD[count], 1
    jz Isosceles
    
    cmp DWORD[count], 0
    jz Escaleno
Final2:
    leave
    ret 12
    
incrementa:
    enter 0,0
    inc DWORD[count]
    leave
    ret
   
Equilatero:
    push equilatero
    push fms
    call printf
    add ESP, 8
    jmp Final2 
Isosceles:
    push isosceles
    push fms
    call printf
    add ESP, 8
    jmp Final2   
Escaleno:
    push escaleno
    push fms
    call printf
    add ESP, 8
    jmp Final2 