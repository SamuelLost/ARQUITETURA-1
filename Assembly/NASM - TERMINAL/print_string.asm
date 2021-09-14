extern printf
section .data
fmp DB "%c", 0
fms DB "%s", 0
string DB "Olá", 0, 0xA
size DB ($-string)
section .text
global main
main:
    push ebp
    mov ebp, esp
    mov ecx, [size]
    mov edi, 0
PRINT1:
    pushad
    ;push DWORD[string+edi]
    ;push fmp
    ;call printf
    ;add esp, 8
    popad
    ;add edi, 1
    ;loop PRINT1
    mov eax, string
    push dword eax
    push dword fms
    call printf
    add esp, 8
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret