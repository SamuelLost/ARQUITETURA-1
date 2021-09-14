%include "io.inc"

section .bss
month RESB 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp                  ; for correct debugging
    mov dx, 0010011001101010b     ;define o campo de data
    mov ax , dx                   ;copia o campo de data para o registrador axx
    shr ax , 5                    ;coloca o mes nos bits menos significativos de ax
    and al ,00001111b             ;mascara para isolar o mes em al
    mov [month], al               ;mover o resultado para o byte no offset month na memoria

    xor eax, eax
    ret