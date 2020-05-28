%include "io.inc"
;Rval = -Xval + (Yval - Zval)
section .data
    Xval DD 26
    Yval DD 30
    Zval DD 40
section .bss
    Rval RESD 1
section .text
    GLOBAL CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax,[Xval]
    neg eax               ; EAX = -26
    mov ebx,[Yval]
    sub ebx,[Zval]        ; EBX = -10
    add eax,ebx
    mov [Rval],eax        ; -36
    XOR EAX,EAX
    XOR EBX, EBX
    RET