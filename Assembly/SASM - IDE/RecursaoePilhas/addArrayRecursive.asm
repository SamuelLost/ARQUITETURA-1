%include "io.inc"

section .data
vetor db 10, 5, 20, 30
tamanhoVetor EQU $-vetor

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 0
    ;write your code here
    lea ESI, [vetor]
    push tamanhoVetor
    call SomaRecursiva
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
;--------------------------------    
SomaRecursiva:
;Receives: ECX contador de indice, ESI endereco vetor
;Modify: ECX e Flags
;Returns: A soma em EAX
;--------------------------------

     enter 0,0
     mov ecx, [ebp+8]     
     cmp ecx, 0
     je fimSoma
     dec ecx
     add al, [esi+ecx]
     push ecx
     call SomaRecursiva
     fimSoma:
     leave
     ret 4