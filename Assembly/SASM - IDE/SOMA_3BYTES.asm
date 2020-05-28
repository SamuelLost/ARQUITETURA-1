%include "io.inc"
section .data
MYBYTES DB 80h, 66h, 0A5h
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV AL, [MYBYTES]
    ADD AL, [MYBYTES+1]
    ADD AL, [MYBYTES+2]
    XOR EAX, EAX
    MOV AX, [MYBYTES]
    ADD AX, [MYBYTES+1]
    ADD AX, [MYBYTES+2]
    ;write your code here
    xor eax, eax
    ret