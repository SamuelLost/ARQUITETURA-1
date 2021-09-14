%include "io.inc"
section .data
ArrayD DD 10, 20, 30, 40
size EQU ($-ArrayD)/4

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ECX, size
    mov EAX, 0
    mov ESI, 0
L1:
    mov EAX, [ArrayD+ESI]
    XCHG EAX, [ArrayD]
    mov [ArrayD+ESI], EAX
    add ESI, 4
    loop L1
    xor eax, eax
    ret