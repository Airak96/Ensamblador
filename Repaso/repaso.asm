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
    path db "/home/fabricio/Escritorio/carpeta", 0
	archivo db "/home/fabricio/Escritorio/carpeta/codigo.txt", 0
    mensaje_error db "error en el archivo",10
    len_error equ $ -mensaje_error

    mensaje db "Ingrese el arreglo: ",10
    len_mensaje equ $-mensaje
    numero1 db '3277'
    numero2 db '2566'
    resultado db '    '
    len_resultado equ $-resultado
section .bss
    texto resb 35
    idarchivo resb 1
    num1 resb 2
    num2 resb 2
section .text
    global _start

_start:
    escribir mensaje,len_mensaje
    leer num1,5
    escribir mensaje,len_mensaje
    leer num2,4
    mov esi, 3
    mov ecx, 4
    clc  ;Permite desactivar el bit (estado) de la bandera carry

proceso_suma:
    mov al, [num1 + esi] ; establece la posicion del ultimo digito posicion 3 [0-3] y longitud 4
    ;mov ah, [numero2 + esi]
    ;adc al, ah

    adc al, [num2 + esi]
    aaa ; trabaja solo con al para ajustar
    pushf
    ; aas no afecta a al
    or al, 30h
    popf
    mov [resultado + esi], al
    
    dec esi
    loop proceso_suma

    mov eax, 39
    mov ebx, path
    mov ecx, 0x1FF
    int 80h 
; leer
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 4
    int 80h

    mov eax, 8
    mov ebx, archivo
    mov ecx, 2  ; acceso
    mov edx, 0x1FF ; permiso
    int 80h

    test eax, eax; verifica la direccion establecido hace un testeo de la subrutina
    jz error
    ;********asignar id archivo*********
    mov dword [idarchivo], eax


    mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, resultado
	mov edx, 35
	int 80h

    jmp salir
error:
    escribir mensaje_error, len_error
salir:
    mov eax, 1
    int 80h