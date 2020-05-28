%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ax,00FFh
    add ax,1               ; AX= 100 SF= 0 ZF= 0 CF= 0
    sub ax,1               ; AX= 00FF SF= 0 ZF= 0 CF= 0 
    add al,1               ; AX= 0000 SF= 0 ZF= 1 CF= 1
    mov bh,6Ch             ; Observe o por quê da instrução MOV não alterar as flags. 
    add bh,95h             ; AX= 0, BH= 100 SF= 0 ZF= 0 CF= 1
    mov al,2
    sub al,3               ; AX= 00FF SF= 1 ZF= 0 CF= 1
    xor eax, eax
    ret