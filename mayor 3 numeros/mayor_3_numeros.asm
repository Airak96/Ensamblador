section .data
	msj_1 db 'Ingresar valor',0xA
	len_1 equ $-msj_1
	msj_p db 'Primero mayor',0xA
	len_p equ $-msj_p
	msj_s db 'Segundo mayor',0xA
	len_s equ $-msj_s
	msj_t db 'Tercero mayor',0xA
	len_t equ $-msj_t
	msj_i db 'Todos iguales',0xA
	len_i equ $-msj_i
section .bss
		n1 resb  5
		n2 resb  5
		n3 resb  5
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
	mov ebx,[n2]
	mov ecx,[n3]

	
	cmp eax,ebx
	jg compare
	je compare2
	jmp compare2
	


compare:
	cmp eax,ecx
	jg pmayor
	jmp tmayor
	
compare2:
	cmp ebx,ecx
	jg smayor
	je iguales
	jmp tmayor

	
pmayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_p
	mov edx,len_p
	int 80h

	mov eax,1
	int 80h

smayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_s
	mov edx,len_s
	int 80h

	mov eax,1
	int 80h
	
tmayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_t
	mov edx,len_t
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