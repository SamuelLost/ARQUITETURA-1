%include "io.inc"
section .data
num  DB 3, 4, 7 ;Declarando o vetor
     DB 5
     DB 9
num2 DB 1
sizeofNum EQU $-num ;EQU diretiva para constante, não salva na memoria, então tem q mover a variavel para um registrador
;vetor TIMES 100 DB 0;Inicia um vetor com valor 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov EAX, sizeofNum
    xor eax, eax
    ret