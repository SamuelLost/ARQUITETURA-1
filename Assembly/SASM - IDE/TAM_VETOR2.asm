%include "io.inc"
section .data
    array DW 10,20,
    DW 30,40,
    DW 50,60
    sizeOfarray DW ($-array)/2 ;DIVIDIU POR 2BYTES
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_UDEC 2, sizeOfarray
    xor eax, eax
    ret