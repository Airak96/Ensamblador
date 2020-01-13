section .data
	msj_1 db 'Ingresar valor',0xA
	len_1 equ $-msj_1
	msj_p db 10,'EL numero mayor es: '
	len_p equ $-msj_p
	msj_i db 10,'Todos los numeros son iguales'
	len_i equ $-msj_i
section .bss
		n1 resb  5
		n2 resb  5
		n3 resb  5
		n1mayor resb 5
		n2mayor resb 5
		n3mayor resb 5

section .text
	global _start
	
_start:
	
	mov eax,4
	mov ebx,1
	mov ecx,msj_1
	mov edx,len_1
	int 80h
	
	mov eax, 3 
	mov ebx, 2
	mov ecx, n1	
	mov edx, 5
	int 80h
	
	
	
;//////////////////////////////////	
	mov eax,4
	mov ebx,1
	mov ecx,msj_1
	mov edx,len_1
	int 80h
	
	
	mov eax, 3 
	mov ebx, 2
	mov ecx, n2	
	mov edx, 5
	int 80h
	
	
;//////////////////////////
	mov eax,4
	mov ebx,1
	mov ecx,msj_1
	mov edx,len_1
	int 80h
	
	mov eax, 3 
	mov ebx, 2
	mov ecx, n3	
	mov edx, 5
	int 80h	
	
	
	
;///////////////////////////	
	mov eax,[n1]
	;sub eax, '0'
	mov [n1mayor], eax
	mov ebx,[n2]
	;sub ebx, '0'
	mov [n2mayor], ebx
	mov ecx,[n3]
	;sub ecx, '0'
	mov [n3mayor], ecx

	
	cmp eax,ebx
	jg compare
	je compare3
	jmp compare2
	


compare:
	cmp eax,ecx
	jg pmayor
	jmp tmayor
	
compare2:
	cmp ebx,ecx
	jg smayor
	jmp tmayor
compare3:
	cmp ebx,ecx
	je iguales
	jmp compare2


	
pmayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_p
	mov edx,len_p
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,n1mayor
	mov edx,1
	int 80h

	mov eax,1
	int 80h

smayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_p
	mov edx,len_p
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,n2mayor
	mov edx,1
	int 80h

	mov eax,1
	int 80h
	
tmayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_p
	mov edx,len_p
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,n3mayor
	mov edx,1
	int 80h

	mov eax,1
	int 80h

iguales:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj_i
	mov edx, len_i
	int 80h
	
	mov eax,1
	int 80h