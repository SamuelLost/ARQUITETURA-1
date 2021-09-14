%include "io.inc"
section .data
var1 DB 2
var2 DB 3
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    movzx EDX, byte[var1]    
    add EDX, [var1+1] ; USANDO OFFSET NO SEGMENTO DE DADOS
    ; COMO var1 FOI DEFINIDO EM BYTE O OFFSET ENTRE ELA E var2 É DE 1BYTE, OU SEJA, A DIFERENÇA ENTRE O ENDEREÇO BASE DE var1 PARA O ENDEREÇO DE var2 É APENAS UM
    ; BYTE, COM ISSO EU POSSO ACESSAR var2 A PARTIR DO ENDEREÇO DE var1, BASTA SOMAR COM O OFFSET QUE É 1 NO CASO.
    
    inicio EQU $      ; PEGANDO A POSIÇÃO DE MEMÓRIA ATUAL
    movzx EAX, byte[var1]
    fim EQU $         ; PEGANDO A POSIÇÃO ATUAL
    mov ECX, inicio
    mov EBX, fim
    mov edx, inicio+5 ; USANDO OFFSET NO SEGMENTO DE CÓDIGO
    ;DEVIDO AO DEBUG SABE-SE QUE A INSTRUÇÃO MOV EAX, [var1] TEM 5bytes, COM ISSO EU POSSO REALIZAR UM DESLOCAMENTO A PARTIR DE INICIO E PEGAR O ENDEREÇO DA 
    ;INSTRUÇÃO QUE SUCEDE O MOV EAX, [var1] E MOVER ESSE ENDEREÇO PARA EDX
   
    xor eax, eax
    ret