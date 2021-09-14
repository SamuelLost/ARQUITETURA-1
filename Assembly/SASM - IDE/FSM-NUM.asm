%include "io.inc"

section .data 
ENTER_KEY EQU 10
InvalidInputMsg DB "Invalid input",13,10,0
ValidInputMsg DB "Valid input",13,10,0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    jmp A    
    
Valid:
    jmp DisplayNoErrorMsg

FIM:
    ;print string reconhecida
    xor eax, eax
    ret
    
    
A:
call Getnext              ; read next char into AL
cmp al, '+'
je B
cmp al, '-'
je B
cmp al, 48
jb DisplayErrorMsg
cmp al, 57
ja DisplayErrorMsg    
jmp C        
           
B:
call Getnext              ; read next char into AL
cmp al, 48
jb DisplayErrorMsg
cmp al, 57
ja DisplayErrorMsg    
jmp C
    
        
C:    
call Getnext              ; read next char into AL
cmp al, 10
je Valid
cmp al, 48
jb DisplayErrorMsg
cmp al, 57
ja DisplayErrorMsg    
jmp C    
    
DisplayErrorMsg:
mov edx, InvalidInputMsg
PRINT_STRING [edx]
jmp FIM

DisplayNoErrorMsg:
mov edx, ValidInputMsg
PRINT_STRING [edx]
jmp FIM




;-----------------------------------------------
Getnext: 
;
; Reads a character from standard input.
; Receives: nothing
; Returns: AL contains the character
;-----------------------------------------------
GET_CHAR AL
; input from keyboard
PRINT_CHAR AL
; echo on screen
ret


    
