%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    archivo_entrada db "/home/fabricio/Escritorio/Prueba/prueba.txt",0

    ruta db "/home/fabricio/Escritorio/prueba", 0
    archivo_salida db "/home/fabricio/Escritorio/prueba/resultado.txt", 0

    salto db "",10

    msj_err db "¡Error en el archivo!",10
    lenerror equ $- msj_err

    numero1 db "1 se repite "
    len_numero1 equ $-numero1

section .bss
    idarchivo resb 1
    text resb 30
    resultado resb 2
    num0 resb 1
    num1 resb 1
    num2 resb 1
    num3 resb 1
    num4 resb 1
    num5 resb 1
    num6 resb 1
    num7 resb 1
    num8 resb 1
    num9 resb 1

section .text
    global _start

_start:
    mov eax, 5
    mov ebx, archivo_entrada
    mov ecx, 0
    mov edx, 0
    int 80h

    test eax, eax 
    jz err

    mov dword [idarchivo], eax

    mov eax, 3
    mov ebx, [idarchivo] ; aquí vinculamos el archivo
    mov ecx, text
    mov edx, 30
    int 80h
    
    mov eax, 6
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0

    mov esi, text
    mov edi, 0
    
    jmp imprimir_arreglo

imprimir_arreglo:
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
    
    cmp edi, 2; cuando edi sea menor al tamaño del arreglo
    jb imprimir_arreglo
    
    mov ecx, 0
    mov ebx, 0

sumar: 
    mov al, [esi + ecx]
    add bl, al

contador:
    inc ecx
    cmp ecx, 2
    jb sumar
  
imprimirR:
    add bl, '0'
    mov [resultado], bl

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2 
    int 80H


err:
    imprimir msj_err, lenerror

salir:
    mov eax, 1
    int 80h