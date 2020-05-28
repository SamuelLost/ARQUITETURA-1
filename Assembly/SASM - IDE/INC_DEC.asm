section .data
    myWord dw 1000h ;2Bytes
    myDword dd 10000000h ;4Bytes
section .text
global main
main:
    mov ebp, esp                ; for correct debugging
    inc byte [myWord]           ; 1001h ;precisa especificar o tamanho qnd for algo da memoria
    dec byte [myWord]           ; 1000h
    inc dword [myDword]         ; 10000001h
    mov ax,00FFh
    inc ax                      ; AX = 0100h
    mov ax,00FFh                
    inc al                      ; AX = 0000h, pois incrementa a parte menos significativa
    xor eax, eax
    ret