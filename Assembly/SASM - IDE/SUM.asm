; SOMA PASSAGEM POR VALOR E REFERENCIA
extern scanf
extern printf
section .data
    a DD 8
    b DD 10
    fmt DB "%d", 0xA, 0
    
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push DWORD[a]       ; EMPILHA PARAMETROS
    push DWORD[b]
    call SomaValue      ; CHAMA SomaValue
    
    push a              ; EMPILHA PARAMETROS
    push b
    call SomaRef        ; CHAMA SomaRef
    
    pushad
    push EAX
    push fmt
    call printf
    add ESP, 8 
    popad
    
    pushad
    push ECX
    push fmt
    call printf
    add ESP, 8
    popad
    xor eax, eax
    ret
    
SomaValue:
;----------------------------------
; Recebe: valor de a e b
; Retorna: a soma de a e b em EAX
;----------------------------------
    enter 0,0
    mov EAX, [EBP+8]
    mov EBX, [EBP+12]
    add EAX, EBX
    leave
    ret 8
    
SomaRef:
;----------------------------------
; Recebe: endereço de a e b
; Retorna: a soma de a e b em ECX
;----------------------------------
    enter 0,0
    mov ESI, [EBP+8]
    mov EDI, [EBP+12]
    mov ECX, [ESI]
    mov EDX, [EDI]
    add ECX, EDX
    leave
    ret 8