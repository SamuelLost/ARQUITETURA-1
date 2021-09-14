%include "io.inc"
section .bss
varAUX RESB 1
;Supondo que: AL=A, BL=B, CL=C, DL=D
;A B C D ----> B C D A
;AL, BL, CL, DL ----> BL, CL, DL, AL

section .text
global CMAIN
CMAIN:
    mov ebp, esp  ; for correct debugging
    
    xor eax, eax  ; apenas para melhor visualização na depuração
    xor ebx, ebx  ; apenas para melhor visualização na depuração
    xor ecx, ecx  ; apenas para melhor visualização na depuração
    xor edx, edx  ; apenas para melhor visualização na depuração
    
    mov AL, 1
    mov BL, 2
    mov CL, 3
    mov DL, 4
    
    ;PRINT_UDEC 1,AL ; para ver o resultado final
    ;PRINT_UDEC 1,BL ; para ver o resultado final
    ;PRINT_UDEC 1,CL ; para ver o resultado final
    ;PRINT_UDEC 1,DL ; para ver o resultado final
    
    mov [varAUX], AL  ; vou pegar o 1
    mov AL, BL        ; AL recebe o 2
    XCHG [varAUX], DL ; a variavel recebeu o 4 e o regist recebeu o 1
    XCHG [varAUX], CL ; CL recebe o 4 e o varAUX o 3
    mov BL, [varAUX]  ; BL recebe o 3
    ;NEWLINE
    ;PRINT_UDEC 1,AL ; para ver o resultado final
    ;PRINT_UDEC 1,BL ; para ver o resultado final
    ;PRINT_UDEC 1,CL ; para ver o resultado final
    ;PRINT_UDEC 1,DL ; para ver o resultado final
    xor eax, eax
    ret