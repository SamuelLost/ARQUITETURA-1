%include "io.inc"
section .bss
count RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV ECX, 3
    XOR EAX, EAX
L1:
    MOV [count], ECX
    MOV ECX, 5
L2:
    INC EAX
    LOOP L2
    MOV ECX, [count]
    LOOP L1
    ret