%include "io.inc"

section .bss
n RESD 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, n
    push n
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
mov esi, [ebp+8]
mov ecx, [esi]
l1:
    add DWORD[ebp-4], ecx
    loop l1
mov eax, [ebp-4]
pop ecx
leave
ret 4