%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov al,-128
    neg al                  ;CF = 1 OF = 1
    mov ax,8000h
    add ax,2              ;CF = 0 OF = 0
    mov ax,0
    sub ax,2              ;CF = 1 OF = 0
    mov al,-5
    sub al,+125         ;CF = 0 OF = 1
    ret