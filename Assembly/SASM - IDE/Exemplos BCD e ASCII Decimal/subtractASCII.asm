%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp  ; for correct debugging
    mov eax, 0
    mov ah, 0
    mov al, '8'   ; AX=0038 h
    sub al, '9'   ; AX=00 FFh
    aas           ; AX=FF09h, CF=1
    or al, 30h    ; AL='9'
    xor eax, eax
    ret