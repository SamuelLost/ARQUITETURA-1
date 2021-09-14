%include "io.inc"
section .data 
ENTER_KEY EQU 10
InvalidInputMsg DB "Invalid input",13,10,0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    StateA:
call Getnext              ; read next char into AL
cmp al,'+'                ; leading + sign?
je StateB                 ; go to State B
cmp al,'-'                ; leading - sign?
je StateB                 ; go to State B
call IsDigit              ; ZF = 1 if AL contains a digit
jz StateC                 ; go to State C
call DisplayErrorMsg      ; invalid input found
jmp Quit

StateB:
call Getnext              ; read next char into AL
call IsDigit              ; ZF = 1 if AL contains a digit
jz StateC
call DisplayErrorMsg      ; invalid input found
jmp Quit

StateC:
call Getnext              ; read next char into AL
call IsDigit              ; ZF = 1 if AL contains a digit
jz StateC                 
NEWLINE
cmp al, ENTER_KEY         ; Enter key pressed?
je Quit                   ; yes: quit
call DisplayErrorMsg      ; no: invalid input found
jmp Quit

Quit:

    xor eax, eax 
    ret

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
ret


;---------------------------------------------------------------------
IsDigit: 
;
; Determines whether the character in AL is a valid decimal digit.
; Receives: AL = character
; Returns: ZF = 1 if AL contains a valid decimal digit; otherwise, ZF = 0.
;---------------------------------------------------------------------
cmp al,'0'
jb ID1                   ; ZF = 0 when jump taken
cmp al,'9'
ja ID1                   ; ZF = 0 when jump taken
test ax,0                ; set ZF = 1
ID1: ret
