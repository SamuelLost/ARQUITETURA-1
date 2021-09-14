%include "io.inc"
section .data

vet db '2','9' ;definindo os valores do meu vetor

section .bss
resultSoma resw 1 ;Variavel que será responsavel por armazenar o resultado da soma
section .text

global CMAIN
CMAIN:

    mov ebp, esp ; for correct debugging
    mov ax, 0 ; zerando o eax
    mov esi, vet ; utilizando esi como ponteiro para o vet
    mov ecx, 2 ; definindo a quantidade de iteracoes do loop

soma:

    add al, [esi] ; movendo o conteudo do vetor para al
    inc esi ; incrementado o ponteiro para apontar para o proximo elemento
    aaa

    loop soma ; loop
    mov [resultSoma], ax ; movendo o resultado da soma final para ax -> ax = 0x0101
    or ax, 3030h ; utilizamos a instrucao "or" para realizar uma soma sem gerar CARRY -> ax= 0x3131 que corresponde ao 11, em decimal.


; ax = 0x0101

;    + 0x3030

;-------------

; ax = 0x3131

;31->1

;31->1
    xor eax, eax
    ret
