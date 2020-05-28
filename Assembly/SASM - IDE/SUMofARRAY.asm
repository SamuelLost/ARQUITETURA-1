%include "io.inc"
section .data
    arrayW DD 100000h,200000h,300000h
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV ESI, arrayW
    MOV EAX, [ESI]
    ADD ESI, 4
    ADD EAX, [ESI]
    ADD ESI, 4
    ADD EAX, [ESI]  ;AX=SOMA
    XOR EAX, EAX
    XOR ESI, ESI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;[LABEL+REG]
    MOV ESI, 0
    MOV EAX, [arrayW + ESI]
    ADD ESI, 4
    ADD EAX, [arrayW + ESI]
    ADD ESI, 4
    ADD EAX, [arrayW + ESI]
    xor eax, eax
    ret