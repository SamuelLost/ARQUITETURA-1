%include "io.inc"
section .bss
termo RESD 1
razao RESD 1
qntd RESD 1
result RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, [termo]
    GET_UDEC 4, [razao]
    GET_UDEC 4, [qntd]
    
    mov ecx, [qntd]
    mov eax, [termo]
    mov edx, [razao]
    mov [result], eax
    
PA:
    add eax, edx
    add [result], eax
    loop PA
    
    xor eax, eax
    ret