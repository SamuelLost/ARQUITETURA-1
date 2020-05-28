section .data
    var1 DD 10000h
    var2 DD 20000h
section .text
global main
main:
    mov ebp, esp                   ; for correct debugging
                                   ;---EAX---
    mov eax, [var1]                ;00010000h
    add eax, [var2]                ;00030000h
    add ax,  0FFFFh                ;0003FFFFh
    add eax, 1                     ;00040000h
    sub ax,  1                     ;0004FFFFh ;subtrai apenas o menos significativo
    xor eax, eax
    ret