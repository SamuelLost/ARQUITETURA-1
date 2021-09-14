%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push 5
    push 10
    call soma2
    
    xor eax, eax
    ret
    
    
soma2:
    enter 4,0
    lea esi, [ebp-4]
    mov eax, [ebp+8]
    add eax, [ebp+12]
    mov [esi], eax
    inc DWORD [esi]
    PRINT_UDEC 4, [esi]
    leave
    ret 8
    