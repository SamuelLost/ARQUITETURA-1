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
    mov eax, [ebp+8]
    add eax, [ebp+12]
    mov [ebp-4], eax
    inc DWORD [ebp-4]
    PRINT_UDEC 4, ebp-4
    leave
    ret 8
    