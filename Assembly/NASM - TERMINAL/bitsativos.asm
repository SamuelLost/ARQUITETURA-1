extern printf
extern scanf
section .data
fmt DB "%c", 0
ativ DB "Os bits estão ativados", 0, 10
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
    mov AL, 01010000b
    and AL, 01010001b
    cmp AL, 01010001b
    je ON
    jne OFF
    
EXIT:
    mov ESP, EBP
    pop EBP
    xor eax, eax
    ret
    
ON:
    movzx ECX, BYTE [sizeON]
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
    
OFF: 
    movzx ECX, BYTE [sizeOFF]
    mov EDI, desat
L2:
    pushad
    push DWORD[EDI]
    push DWORD fmt
    call printf
    add ESP, 8
    popad
    inc EDI
    loop L2
    jmp EXIT