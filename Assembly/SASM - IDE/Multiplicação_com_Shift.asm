%include "io.inc"

section .bss
var resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;47*100
    ;100*32 + 100*8 + 100*4 + 100*2 + 100*1
    ;100*2^5 + 100*2^3 + 100*2^2 + 100*2^1 + 100*2^0
    mov eax, 100
    mov ecx, eax
    shl EAX, 5
    mov EBX, ecx
    shl EBX, 3
    add EAX, EBX
    mov EBX, ECX
    shl EBX, 2
    add EAX, EBX
    mov EBX, ECX
    shl EBX, 1
    add EAX, EBX
    mov EBX, ECX
    add EAX, EBX
    PRINT_UDEC 4, eax
    xor eax, eax
    ret