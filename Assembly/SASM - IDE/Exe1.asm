%include "io.inc"

section .bss
n RESD 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, n
    push DWORD[n]
    call somaInteiros
    PRINT_UDEC 4, EAX
    
    xor eax, eax
    ret
   
;-------------------------------------------
somaInteiros:
;Receives: um inteiro N na pilha
;Returns: EAX a soma dos inteiros de 1 até N
;-------------------------------------------
enter 4,0
push ecx
mov DWORD[ebp-4], 0
mov ecx, [ebp+8]
l1:
    add DWORD[ebp-4], ecx
    loop l1
mov eax, [ebp-4]
pop ecx
leave
ret 4