%include "io.inc"
section .data
    arrayW DW 1000h,2000h,3000h ;Word 2BYTES
    arrayD DD 1,2,3,4     ;Double 4BYTES
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ax,[arrayW+2]     ; AX = 2000h
    mov ax,[arrayW+4]     ; AX = 3000h
    mov eax,[arrayD+4]    ; EAX = 00000002h
    mov ax,[arrayW-2]     ; ??
    mov eax,[arrayD+16]   ; ??
    xor eax, eax
    ret