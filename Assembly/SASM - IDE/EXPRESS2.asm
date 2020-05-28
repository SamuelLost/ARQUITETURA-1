%include "io.inc"
;Rval = Xval - (-Yval+Zval)
section .data
    Xval DD 26
    Yval DD 30
    Zval DD 40
section .bss
    Rval RESD 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV EAX, [Zval]
    SUB EAX, [Yval]   ;Zval - Yval = 10
    MOV EBX, [Xval]
    SUB EBX, EAX      ;Xval - 10 = 16
    MOV [Rval], EBX
    xor eax, eax
    ret