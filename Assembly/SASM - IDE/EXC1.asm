%include "io.inc"

section .data
num1 dd 1200 ;dd = define double
num2 dd 1000
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov eax, 0xa
    mov ebx, [num1]
TEST:
    add eax, ebx
    JMP TEST
    ;mov DWORD[num2], eax ;salvar o resultado da soma no num2
    xor eax, eax
    ret