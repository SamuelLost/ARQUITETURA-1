extern	printf		         ; funcao C a ser chamada
extern  scanf                ; funcao C a ser chamada

SECTION .data		         ; secao de dados, variaveis inicializadas

fms db "%lu", 0              ; formato do printf/scanf de 32 bits, '0'
fmt db "%llu", 0             ; formato do printf/scanf de 64 bits, '0'

SECTION .bss
num1 resd 1
num2 resd 1

SECTION .text                ; secao de codigo
        global main		     ; ponto de entrada padrao do GCC
main:				         ; etiqueta do programa para o ponto de entrada
        push ebp		     ; definindo o ponto de entrada da pilha
        mov  ebp,esp
        
        push num1            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        push num2            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        mov eax, [num1]
        add eax, [num2]
        
        
	    push eax             ; valor do resultado salvo em eax
        push dword fms	     ; endereco da string de controle do printf/scanf
        call printf		     ; chamada da funcao C printf
        add  esp, 8		     ; desempilha 2 valores de 4 bytes empilhados pela instrução push
        mov  esp, ebp	     ; recupera o ponto de entrada da pilha desfazendo a modificação da linha 17
        pop  ebp		     ; mesmo que a operacao "leave" desempilha o inicio da pilha, voltando ao mesmo ponto da linha 16
    	mov	 eax,0		     ; valor de retorno normal, retorno sem erro 
    	ret	