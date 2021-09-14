extern	printf		         ; funcao C a ser chamada
extern  scanf                ; funcao C a ser chamada

SECTION .data		         ; secao de dados, variaveis inicializadas

fms db "%lu", 0              ; formato do printf/scanf, '0'
fmt db "%llu", 0             ; formato do printf/scanf, '0'

SECTION .bss
num1 resd 1
num2 resd 1
num3 resq 1
result resq 1

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
        
        push num3            ; endereco do inteiro sem sinal de 64 bits num3
        push fmt             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        mov  eax, [num1]
        mov  ebx, [num2]
        mul  ebx
        add  eax, [num3]
        adc  edx, [num3+4]
        mov  [result], eax
        mov  [result+4], edx
	    
	    push dword [result+4]; valor da variavel result+4
        push dword [result]	 ; valor da variavel result
        push dword fmt	     ; endereco da string de controle do printf/scanf
        call printf		     ; chamada da funcao C printf
        add  esp, 12		 ; desempilha 3 valores de 4 bytes
        mov  esp, ebp	     ; recupera o ponto de entrada da pilha
        pop  ebp		     ; mesmo que a operacao "leave" 
    	mov	 eax,0		     ; normal, valor de retorno sem erro 
    	ret	