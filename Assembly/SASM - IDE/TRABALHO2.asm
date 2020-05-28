;Program Description: Soma de uma matriz 10x10
;Author: Samuel Henrique 
;Matrícula: 473360
;Data: 23/04/2020

%include "io.inc"

section .bss
    CONTADOR RESW 1                  ; CONTADOR DO LOOP EXTERNO

    RESULT RESW 1                    ; VARIÁVEL PARA RESULTADO FINAL

section .data
    ARRAY_W DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,     ; MATRIZ 10x10 
    LINSIZE EQU ($-ARRAY_W)/2
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 11, 10,
            DW 10, 10, 10, 10, 10, 10, 10, 10, 10, 11
            
    MULT_LIN DW 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp                        ; for correct debugging
    MOV ECX, 0
    MOV CX, 10                         ; DEFINIÇÃO DO CONTADOR DO LOOP1 EXTERNO
    MOV EAX, 0
    MOV ESI, ARRAY_W                    ; PEGO O ENDEREÇO INICIAL DA LABEL
L1:
    MOV [CONTADOR], CX                 ; SALVANDO O CONTADOR EXTERNO
    MOV CX, 10                         ; DEFININDO O CONTADOR DO LOOP2 INTERNO
L2:
    ADD AX, [ESI]                      ; FAZENDO A SOMA DO QUE TEM NO ENDEREÇO DO ESI COM O EAX
    ADD SI, 2                          ; PEGANDO O PRÓXIMO NÚMERO
    LOOP L2                             ; ECX = ECX - 1
    MOV CX, [CONTADOR]                 ; RESTAURA O CONTADOR LOOP1 EXTERNO
    INC WORD[MULT_LIN]                  ; INCREMENTANDO A LINHA
    MOV ESI, ARRAY_W+(MULT_LIN*LINSIZE) ; MOVENDO A PROXIMA LINHA PRO ESI
    LOOP L1                             ; ECX = ECX - 1
    MOV [RESULT], AX                   ; MOVENDO PARA A VARIÁVEL
    PRINT_UDEC 2, RESULT                ; IMPRIMINDO O RESULTADO
    RET