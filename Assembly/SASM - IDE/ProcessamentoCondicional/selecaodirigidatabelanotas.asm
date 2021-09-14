%include "io.inc"

section .data

aprovado db "Voce foi aprovado na disciplina de Arquitetura I",0
tamanhoapr EQU $-aprovado     ; Calcula o tamnho da string aprovado
af db "Voce esta em AF na disciplina de Arquitetura I",0
tamanhoaf EQU $-af            ; Calcula o tamnho da string af
reprovado db "Voce foi reprovado na disciplina de Arquitetura I",0
tamanhorep EQU $-reprovado    ; Calcula o tamnho da string reprovado


; cada elemento da tabela é composto pela chave(valor usado para comparação), endereço da string, e pela quantidade de caracteres que será impressa na mensagem
;FORMATO: valor(byte) | endereco(dword) | tamanhanho da string(dword)
tabela db 7
condicao EQU $-tabela
       dd 0
       dd tamanhoapr
elemento EQU $-tabela
       db 4
       dd 0
       dd tamanhoaf
       db 0
       dd 0
       dd tamanhorep
       
section .bss
nota resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    LEA EBX, [aprovado]     ;copia o endereço efetivo da memória
    mov [tabela+condicao], EBX
    MOV EDX, aprovado
    mov DWORD [tabela+elemento+condicao], af
    mov DWORD [tabela+(2*elemento)+condicao], reprovado
        
    GET_UDEC 1, nota
    mov al, [nota]
    
    mov ecx, 3    ; 3 é a quantidade de linhas das tabela
    mov edi, 0
L1:       
    
    cmp al, BYTE [tabela+edi*elemento]                
    pushfd    
    inc edi
    popfd
    js L1   
    
    ;O problema que estava ocorrendo era no PRINT_STRING
    mov eax, 4      ; sys_write()
    mov ebx, 1      ; ... para STDOUT
    mov ecx, [tabela+(edi-1)*elemento+condicao]; ... using the following memory address
    mov edx, [tabela+(edi-1)*elemento+condicao+4]      ; quantidade de caracteres +4 para saltar o endereço na tabela e pegar a quantidade de caracteres
    int 80h         ; SYSCALL
    
    xor eax, eax
    ret
    
    