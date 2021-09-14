extern printf
extern scanf

section .data
    invalid DB "Valor Invalido", 0xA, 0
    fmtF DB "%f", 0xA, 0
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
    tipo RESD 10
    larg RESD 10
    compr RESD 10
    area RESD 10
    result RESQ 10
    controle RESD 1
section .text    
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP                
    mov ESI, tipo               ; ESI APONTA PARA O VETOR DE TIPO DE COMODO: tipo
    mov EDI, larg               ; EDI APONTA PARA O VETOR DE LARGURA: larg
    mov EDX, compr              ; EDX APONTA PARA O VETOR DE COMPRIMENTO: compr
    
while:                          ; WHILE PARA FAZER A LEITURA DOS VETORES
    pushad
    push ESI                    ; EMPILHANDO O ENDEREÇO DO VETOR DE TIPO
    push fmtINT
    call scanf
    add ESP, 8
    popad
    cmp dword[ESI], -1          ; COMPARAÇÃO PARA SABER SE O TIPO É IGUAL A -1, POIS É A CONDIÇÃO QUE ENCERRA A LEITURA
    jz AREA                     ; SE A CONDIÇÃO FOR VERDADEIRA, PULA PARA O CÁLCULO DA ÁREA
    add ESI, 4                  ; PERCORRENDO O VETOR DE TIPO
    
    pushad
    push EDI                    ; EMPILHANDO O ENDEREÇO DO VETOR DE LARGURA
    push fmtF
    call scanf
    add ESP, 8
    popad
    add EDI, 4                  ; PERCORRENDO O VETOR DE LARGURA
    
    pushad
    push EDX                    ; EMPILHANDO O ENDEREÇO DO VETOR DE COMPRIMENTO
    push fmtF
    call scanf
    add ESP, 8
    popad
    add EDX, 4                  ; PERCORRENDO O VETOR DE COMPRIMENTO
    
    inc DWORD[controle]         ; INCREMENTANDO VARIÁVEL CONTROLE, USADA PARA SABER QNTS POSIÇÕES FORAM PREENCHIDAS EM CADA VETOR
    jmp while                   ; CASO -1 NÃO SEJA DIGITADO, VOLTA PARA O WHILE
    
;----------------------------------------------------------------------------------
; CÁLCULO DA ÁREA: area = largura*comprimento
; 
AREA:  
; FAZENDO OS REGISTRADORES APONTAR PARA CADA UM DOS VETORES NECESSÁRIOS
    mov EBX, area
    mov EDI, larg
    mov EDX, compr
    mov ECX, [controle]
    
; LAÇO QUE PERCORRE OS VETORES DE LARGURA E COMPRIMENTO
; CARREGA OS VALORES PARA A FPU E REALIZA A MULTIPLICAÇÃO
; E SALVA NA POSIÇÃO CORRESPONDENTE DA LARGURA E DO COMPRIMENTO NO VETOR DE AREA
L1:
    fld DWORD[EDI]
    fld DWORD[EDX]
    fmul ST0, ST1
    fstp DWORD[EBX]
    add EDI, 4                  ; PERCORRENDO O VETOR
    add EDX, 4                  ; PERCORRENDO O VETOR
    add EBX, 4                  ; PERCORRENDO O VETOR
    loop L1
;-----------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------
; SELECIONANDO O TIPO DE COMODO
SelectTypes:
; FAZENDO APONTAR PARA CADA UM DOS VETORES NECESSÁRIOS
    mov ESI, tipo
    mov ECX, [controle]
    mov EDI, result
    mov EBX, area
    
; LAÇO QUE PERCORRE O VETOR DE TIPO
; E COMPARA COM CADA TIPO, SE FOR IGUAL PULA PARA LÁ
L2:
    cmp DWORD[ESI], 0
    je Tipo0
    
    cmp DWORD[ESI], 1
    je Tipo1
    
    cmp DWORD[ESI], 2
    je Tipo2
    
    cmp DWORD[ESI], 3
    je Tipo3
    
    cmp DWORD[ESI], 4
    je Tipo4
; DEPOIS DE REALIZAR O CALCULO DO TIPO CORRESPONDENTE
; O PROGRAMA RETORNA PARA A LABEL Volta PARA IR PARA A 
; OUTRA POSIÇÃO DO VETOR, PEGANDO UM NOVO CÔMODO
Volta:

    add ESI, 4
    dec ECX
    cmp ECX, 0                  ; TESTANTO SE TODAS AS POSIÇÕES PREENCHIDAS FORAM PERCORRIDAS
    jne L2

;----------------------------------------------------------------------------------

;----------------------------------------------------------------------------------
; PRINTAR OS RESULTADOS NA TELA:

    mov EDI, result             ; EDI APONTA PARA result
    mov ECX, [controle]         ; DEFININDO CONTADOR DO LAÇO
; LAÇO PARA PRINTAR AS POSIÇÕES DO VETOR DE RESULTADOS: result
Print:
    cmp DWORD[EDI+4], 0         ; COMPARANDO A PARTE MAIS SIGNIFICATIVA QUE É ONDE TEM O BIT DE SINAL
    jl Invalid                  ; SE FOR NEGATIVO, SALTA PARA Invalid E O PROGRAMA É ENCERRADO
    pushad
    push DWORD[EDI+4]           ; IMPRIMINDO POSIÇÃO POR POSIÇÃO DO VETOR DE RESULTADOS
    push DWORD[EDI]             ; COMO É QWORD, É PRECISO IMPRIMIR PRIMEIRO A PARTE MAIS SIGNIFICATIVA
    push fmtF
    call printf
    add ESP, 12
    popad
   
    add EDI, 8                  ; PERCORRENDO O VETOR DE QWORD
    dec ECX                     ; DECREMENTANDO O CONTADOR
    cmp ECX, 0                  ; COMPARANDO COM ZERO
    je END                      ; SE FOR IGUAL, ENCERRA O LAÇO
    jmp Print                   ; SE NÃO, RODA DNV
;------------------------------------------------------------------------------------   
END:    
    mov ESP, EBP
    pop EBP
    xor EAX, EAX
    ret
    
;-----------------------------------------------------------
; REALIZAÇÃO DOS CALCULOS DE ACORDO COM CADA TIPO DE COMODO
Tipo0:
    fld DWORD[EBX]              ; CARREGANDO A AREA CORRESPONDENTE PARA FPU
    fild DWORD[PotT0]           ; CARRENGANDO A POTENCIA DO TIPO 0
    fmul                        ; MULTIPLICANDO OS DOIS
    fild DWORD[PotExigida]      ; CARREGANDO OS 60W PARA FPU
    fdiv                        ; FAZENDO A DIVISAO DO PRODUTO POR 60W
    fstp QWORD[EDI]             ; SALVANDO NO VETOR DE RESULTADOS
    
    ; ANDANDO NO VETOR DE AREA E RESULTADOS
    add EBX, 4
    add EDI, 8
    jmp Volta
; SEGUE A MSM LÓGICA DO Tipo0
Tipo1:
    fld DWORD[EBX]
    fild DWORD[PotT1]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[EDI]
    
    ; ANDANDO NO VETOR DE AREA E RESULTADOS
    add EBX, 4
    add EDI, 8
    jmp Volta
; SEGUE A MSM LÓGICA DO Tipo0
Tipo2:
    fld DWORD[EBX]
    fild DWORD[PotT2]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[EDI]
    
    ; ANDANDO NO VETOR DE AREA E RESULTADOS
    add EBX, 4
    add EDI, 8
    jmp Volta
; SEGUE A MSM LÓGICA DO Tipo0
Tipo3:
    fld DWORD[EBX]
    fild DWORD[PotT3]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[EDI]
    
    ; ANDANDO NO VETOR DE AREA E RESULTADOS
    add EBX, 4
    add EDI, 8
    jmp Volta
; SEGUE A MSM LÓGICA DO Tipo0
Tipo4:
    fld DWORD[EBX]
    fild DWORD[PotT4]
    fmul
    fild DWORD[PotExigida]
    fdiv
    fstp QWORD[EDI]
    
    ; ANDANDO NO VETOR DE AREA E RESULTADOS
    add EBX, 4
    add EDI, 8
    jmp Volta
;-----------------------------------------------------------

; IMPRIME A MSG DE VALOR INVALIDO E PULA PARA O FINAL E ENCERRA
Invalid:
    pushad
    push invalid
    push fms
    call printf
    add ESP, 8
    popad
    jmp END
;-----------------------------------------------------------