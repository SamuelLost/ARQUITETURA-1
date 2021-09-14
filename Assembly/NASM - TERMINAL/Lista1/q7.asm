;Implemente a seguinte expressão em assembly: AX = (val2 + BX) –val4. Assuma que val2 e
;val4 são variáveis inteiras de 16-bit.
%include "io.inc"
section .data
val2 DW 20
val4 DW 12
section .text
global CMAIN
CMAIN:
    mov BX, 10
    add BX, [val2]
    mov AX, BX
    sub AX, [val4]
    PRINT_DEC 2, AX
    xor eax, eax
    ret