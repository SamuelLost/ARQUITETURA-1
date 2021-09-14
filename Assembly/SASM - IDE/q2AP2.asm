%include "io.inc"
extern scanf
extern printf
section .data 
ENTER_KEY EQU 10
fmtCHAR DB "%c", 0
fms DB "%s", 0
InvalidInputMsg DB "Invalida",10,0
Valida DB "Valida", 10, 0
section .bss
caractere RESB 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
StateA:
    call Getnext              
    
    cmp al,'a'                  
    jb DisplayErrorMsg                 
    cmp al,'z'                
    ja DisplayErrorMsg                 
    
    jmp StateB    

StateB:
    call Getnext              
    cmp al, '@'              
    je StateC
    
    cmp al,'a'                
    jb DisplayErrorMsg                 
    cmp al,'z'                
    ja DisplayErrorMsg 
    
    jmp StateB

StateC:
    call Getnext                               
    
    cmp al,'a'                
    jb DisplayErrorMsg                 
    cmp al,'z'                
    ja DisplayErrorMsg 
    
    jmp StateD
    
StateD:
    call Getnext
    cmp al, '.'
    je StateE
    
    jmp StateD
    
StateE:
    call Getnext                             
    
    cmp al,'a'                
    jb DisplayErrorMsg                 
    cmp al,'z'                
    ja DisplayErrorMsg 
    
    jmp StateF
    
StateF:
    call Getnext                               
    
    cmp al,'a'                
    jb DisplayErrorMsg        
    cmp al,'z'                
    ja DisplayErrorMsg 
    
    push Valida
    push fms
    call printf
    add ESP, 8
    
Quit2:

    xor eax, eax 
    ret

;-----------------------------------------------
Getnext: 
;
; Reads a character from standard input.
; Receives: nothing
; Returns: AL contains the character
;-----------------------------------------------
    pushad
    push caractere
    push fmtCHAR
    call scanf
    add ESP, 8
    popad
    mov AL, [caractere] 
    ; input from keyboard
    pushad
    push eax
    push fmtCHAR
    call printf
    ADD ESP, 8
    popad
    ; echo on screen
    ret


;-----------------------------------------------
DisplayErrorMsg:
;
; Displays an error message indicating that
; the input stream contains illegal input.
; Receives: nothing.
; Returns: nothing
;-----------------------------------------------
    push edx
    mov edx, InvalidInputMsg
    PRINT_STRING [edx]
    pop edx
    jmp Quit2