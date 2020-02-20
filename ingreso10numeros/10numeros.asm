%macro escribir 2
    mov eax, 4
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro
section .data
	msg1 dd	10, 'Ingrese 10 numeros', 10
	len_msg1 equ $ - msg1

	msg2 db	10, '**********', 10
	len_msg2 equ $ - msg2

    arreglo db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    ln_arreglo equ $ - arreglo

	nlinea db 10, 10, 0
	lnlinea equ $ - nlinea

section .bss
	num: resb 2
	resultado: resb 2
	mos: resb 2

section .text
	global _start

_start:
    escribir msg1, len_msg1
    mov esi, arreglo
    mov edi, 0

leer:
    mov eax, 03
    mov ebx, 01
    mov ecx, resultado
    mov edx, 2
    int 80H

    mov al, [resultado]
    sub al, '0'

    mov [esi], al
    inc esi
    inc edi

    cmp edi, ln_arreglo ; cuando edi sea menor al tamaño del arreglo
    jb leer

    mov ecx, 0
    mov ebx, 12

mostrar:
    mov ax, [arreglo + ecx]
    push ax

    inc ecx
    cmp ecx, ln_arreglo
    jb mostrar
    mov ecx, 10

mostrar2:
    pop ax
    add ax, '0'

    mov[msg2 + ecx], dword ax
    push ecx

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len_msg2
	int 80H

    pop ecx
    loop mostrar2

salir:
	escribir nlinea, lnlinea

	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
