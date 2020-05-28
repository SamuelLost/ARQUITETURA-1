%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    MOV BL, 10001111b
    MOVZX AX,BL ;EXTENSÃO DE ZEROS, FUNÇÃO ESPECIAL
    xor eax, eax
    ret