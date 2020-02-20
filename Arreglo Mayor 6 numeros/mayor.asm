%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
%macro leer 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data
	msj1 db "Ingrese 6 números:", 10
	len1 equ $-msj1	

	arreglo db 0,0,0,0,0,0
	len_arreglo equ $-arreglo

	msj_mayor db "El número mayor es:"
	len_mayor equ $-msj_mayor

    msj_menor db "El numero menor es: "
    len_menor equ $-msj_menor

    espacio db 10," "
section .bss
	dato resb 2
    mayor resb 2
    menor resb 2

section .text
	global _start

_start:
	;se define el arreglo en los registros índices
	mov esi, arreglo
	mov edi, 0

    escribir msj1, len1

leer_arreglo:

    leer dato,2

	mov al, [dato]
	sub al, '0'		;se convierte a decimal 
	
	mov [esi] , al
	
	add edi, 1     		; inc edi
	add esi, 1

	cmp edi, len_arreglo
	jb leer_arreglo

	mov ecx, 0
	mov bl, 0		; se registra el mayor número

comparacion:
	mov al,[arreglo + ecx] 
	cmp al, bl
	jb contador
	mov bl, al

contador:
	inc ecx
	cmp ecx, len_arreglo
	jb comparacion

imprimir_mayor:
	add bl, '0'   
	mov [mayor], bl
    
    escribir msj_mayor,len_mayor
    escribir mayor, 1
    escribir espacio,1

imprimir_menor:
    add al, '0'
    mov [menor],al
    escribir msj_menor,len_menor
    escribir menor, 1
    escribir espacio,1	

salir:
	mov eax, 1
	int 0x80	