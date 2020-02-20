%macro escribir 2
	mov eax,4  
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    mensaje db "Ingrese un numero: ",10
    len_mensaje equ $-mensaje
    mensaje_n_1 db "0001",10
    len_mensaje_n_1 equ $-mensaje_n_1
    mensaje1 db 10," "
    len_mensaje1 equ $-mensaje1
section .bss
    numero resb 2
    residuo resb 2
    cociente resb 2

    residuo1 resb 2
    cociente1 resb 2

    residuo2 resb 2
    cociente2 resb 2

    residuo3 resb 2
    cociente3 resb 2
section .text
    global _start
_start:

    escribir mensaje,len_mensaje
    leer numero,1
    mov al, [numero]
    sub al, '0'

    cmp al,1
    je imprimir_1
    cmp al,8
    je division_8
    cmp al,9
    je division_8
    
    ;mov ecx, 4
division:
    mov al,[numero]
    mov bl,2
    sub ax,'0'
    div bl

    add ah,'0'
    add al, '0'
    mov [residuo],ah
    mov [cociente],al
    mov eax,[residuo]
    push eax
    
    
    mov al,[cociente]
    mov bl,2
    sub ax, '0'
    div bl

    add ah, '0'
    add al, '0'
    mov [residuo1],ah
    mov [cociente1],al
    mov ax,[residuo1]
    push ax

    mov al,[cociente1]
    mov bl,2
    sub ax, '0'
    div bl

    add ah, '0'
    add al, '0'
    mov [cociente2],al
    mov [residuo2],ah
    ;mov bx,[residuo2]
    ;push bx
    escribir residuo2,1

    mov al,[cociente2]
    mov bl,2
    sub ax, '0'
    div bl

    add ah, '0'
    add al, '0'
    mov [cociente3],al
    ;escribir cociente3,1
    pop eax
    pop ax
   ; pop bx
    jmp imprimir

division_8:
    mov al,[numero]
    mov bl,2
    sub ax,'0'
    div bl

    add ah,'0'
    add al, '0'
    mov [residuo],ah
    mov [cociente],al
    push ecx
    escribir residuo,1
    pop ecx

    mov al,[cociente]
    mov bl,2
    sub ax, '0'
    div bl

    add ah, '0'
    add al, '0'
    mov [residuo],ah
    mov [cociente],al
    escribir residuo,1

    mov al,[cociente]
    mov bl,2
    sub ax, '0'
    div bl

    add ah, '0'
    add al, '0'
    mov [residuo],ah
    mov [cociente],al
    escribir residuo,1
    escribir cociente,1

    jmp salir
imprimir_1:
    escribir mensaje_n_1,len_mensaje_n_1
    jmp salir
imprimir:
    mov eax, [residuo]
    mov ax, [residuo1]
    ;mov bx, [residuo2]
    escribir mensaje1,1
    escribir cociente3,1
    escribir residuo2,1
    escribir residuo1,1
    escribir residuo,1
salir: 
    mov eax, 1
    int 80h

