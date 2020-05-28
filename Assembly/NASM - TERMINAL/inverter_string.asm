;Voce pode declarar labels inicializadas, nao inicializadas e constantes
section .data
    minhastring db 10, "Ola, inverta esta string!"
    sizeOfSource EQU $-minhastring
    
section .bss
target RESB sizeOfSource

section .text ; não altere essa linha
global _start; não altere essa linha
_start:; não altere essa linha

;Insira seu codigo abaixo:
    mov cl, sizeOfSource    ; movo o tamanho da string para o regist de contador
    mov esi, minhastring    ; faço esi aponta pro começo da string
    mov edi, 0
    add edi, sizeOfSource   ; começando do final
    dec edi                 ; para n pegar o \n
L1:
    mov al, [esi]           ; movendo o que tem no endereço de esi
    mov [target+edi], al    ; jogando em target do final pro começo
    inc si                  ; pegando o próximo caractere
    dec di                  ; voltando um posição para ser jogado em target
    LOOP L1
    
    
;Dica:
mov BYTE[target+sizeOfSource-1], 10; essa linha é necessária para que a correção automática funcione

;Não altere o código daqui para baixo


                                mov     eax, 4 ;modo escrita
                                mov     ebx, 1 ;stdio
                                mov     ecx, target ;oq vai ser escrito, o começo do endereço
                                mov     edx, sizeOfSource ;o tamanho do vetor
                                int     0x80 ;chamada para interrup


                                mov     ebx, 0 ;diz q foi sucesso
                                mov     eax, 1 ;ret
                                int     0x80
                                
                                
                                
                                
    
    