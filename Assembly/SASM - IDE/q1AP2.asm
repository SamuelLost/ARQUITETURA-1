extern printf
extern scanf

section .data
    invalid DB "Valor Invalido", 0xA, 0
    fmtF DB "%f", 0
    fmtINT DB "%d", 0
    fms DB "%s", 0
    zero DD 0
    
    PotExigida DD 60
    PotT0 DD 12
    PotT1 DD 15
    PotT2 DD 18
    PotT3 DD 20
    PotT4 DD 22
section .bss
    tipo RESD 1
    larg RESD 1
    compr RESD 1
    area RESD 1
    result RESQ 1
section .text    
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    pushad
    push tipo
    push fmtINT
    call scanf
    add ESP, 8
    popad
    
    cmp DWORD[tipo], -1             ; COMPARA O TIPO COM -1
    je END                          ; SE FOR IGUAL, ENCERRA O PROGRAMA
    
    pushad
    push larg
    push fmtF
    call scanf
    add ESP, 8
    popad
    
    pushad
    push compr
    push fmtF
    call scanf
    add ESP, 8
    popad
    
    cmp DWORD[larg], 0              ; COMPARA COM ZERO
    jl Invalid                      ; SE FOR MENOR, IMPRIME A MSG
    
    cmp DWORD[compr], 0             ; COMPARA COM ZERO
    jl Invalid                      ; SE FOR MENOR, IMPRIME A MSG
    
    fld DWORD[larg]                 ; CARREGA LARGURA PARA FPU
    fld DWORD[compr]                ; CARREGA COMPRIMENTO PARA FPU
    fmul                            ; MULTIPLICA ENCONTRANDO A ÁREA
    fstp DWORD[area]                ; SALVA NA MEMORIA
    
    cmp DWORD[tipo], 0              ; COMPARAÇÕES DE TIPO
    je Tipo0
    
    cmp DWORD[tipo], 1              ; COMPARAÇÕES DE TIPO
    je Tipo1
    
    cmp DWORD[tipo], 2              ; COMPARAÇÕES DE TIPO
    je Tipo2
    
    cmp DWORD[tipo], 3              ; COMPARAÇÕES DE TIPO
    je Tipo3
    
    cmp DWORD[tipo], 4              ; COMPARAÇÕES DE TIPO
    je Tipo4
    
Volta: 
    jmp print

;-----------------------------------------------------------
; IMPRIMINDO A MSG DE VALOR INVALIDO
Invalid:
    push invalid
    push fms
    call printf
    add ESP, 8
;-----------------------------------------------------------    
    
END:    
    mov ESP, EBP
    pop EBP
    xor EAX, EAX
    ret
    
;-----------------------------------------------------------
; IMPRIMINDO O RESULTADO NA TELA    
print:
    push DWORD[result+4]
    push DWORD[result]
    push fmtF
    call printf
    add ESP, 12
    jmp END
;-----------------------------------------------------------

;-----------------------------------------------------------
; REALIZAÇÃO DOS CALCULOS DE ACORDO COM CADA TIPO DE COMODO
Tipo0:
    fld DWORD[area]
    fild DWORD[PotT0]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[result]
    
    jmp Volta
Tipo1:
    fld DWORD[area]
    fild DWORD[PotT1]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[result]
    
    jmp END
Tipo2:
    fld DWORD[area]
    fild DWORD[PotT2]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[result]

    jmp Volta
Tipo3:
    fld DWORD[area]
    fild DWORD[PotT3]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[result]

    jmp Volta
Tipo4:
    fld DWORD[area]
    fild DWORD[PotT4]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[result]

    jmp Volta
;-----------------------------------------------------------