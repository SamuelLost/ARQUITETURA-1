section	.text
global main   ;deve ser declarado para o ligador (ld)
	
main:	            ;indica ao ligador o ponto de entrada
    mov edx,len     ;comprimento da messagem
    mov ecx,msg     ;message a ser escrita
    mov ebx,1       ;descritor de arquivo (stdout)
    mov eax,4       ;numero de chamada de sistema(sys_write)
    int 0x80        ;call kernel

    mov eax,1       ;numero de chamada de sistema (sys_exit)
    int 0x80        ;call kernel
	
section .data
msg db 'Hello, world!', 0xa  ;string a ser escrito
len equ $ - msg     ;comprimento da string
