%include "io.inc"
section .data
    valB DB 1
    valW DW 32767
section .text
global CMAIN
CMAIN:
    mov ebp, esp            ; for correct debugging
    neg byte [valB]         ; valB = -1
    mov al,[valB]             ; AL = -1
    neg al                         ; AL = +1
    neg dword[valW]     ; valW = -32767
    xor eax, eax
    ret