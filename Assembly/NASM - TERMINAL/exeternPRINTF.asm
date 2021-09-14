extern printf

global main

section .data
	format DB 'O resultado é: ', "%d", 0Ah, 0

section .text 

main: 

	mov EAX, 1024
	push EAX
	push format
	call printf
	add esp, 8
	xor eax, eax
	ret
