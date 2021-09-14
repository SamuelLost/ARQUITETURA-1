extern printf
extern scanf
section .data
fmt DB "%c", 0
ativ DB "Pelo menos um dos bits 0, 4 e 6 estão ativados", 0, 10
sizeON DB ($-ativ)
desat DB "Os bits não estão ativados", 0, 10
sizeOFF DB ($-desat)
section .text
global main
main:
    mov ebp, esp; for correct debugging
    push EBP
    mov EBP, ESP
    
    mov EAX, 0
    mov AL, 0b00000010
    bt Ax, 0
    jc BIT
    bt AX, 4
    jc BIT
    bt AX, 6
    jc BIT
    jmp NOBIT
EXIT: 
    mov ESP, EBP
    pop EBP
    xor eax, eax
    ret
    
BIT:
    movzx ECX, BYTE[sizeON]
    mov ESI, ativ
L1: 
    pushad
    push DWORD[ESI]
    push DWORD fmt
    call printf
    add ESP, 8
    popad
    inc ESI
    loop L1
    jmp EXIT
    
NOBIT:
    movzx ECX, BYTE[sizeOFF]
    mov EDI, desat
L2:
    pushad
    push DWORD [EDI]
    push DWORD fmt
    call printf
    add ESP, 8
    popad
    inc EDI
    loop L2
    jmp EXIT