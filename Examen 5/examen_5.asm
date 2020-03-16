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
%macro abrir_archivo 1
    mov eax, 5
    mov ebx, %1
    mov ecx, 0
    mov edx, 0
    int 80h
%endmacro
%macro cerrar_archivo 1
    mov eax, 6
    mov ebx, %1
    mov ecx, 0
    mov edx, 0
    int 80h
%endmacro

section .data
    archivo_a_leer db "/home/fabricio/Escritorio/Examen_5/carrion_roberth.txt",0
    msj_error db "error en el archivo",10
    len_error equ $- msj_error
    msj_contenido db "El arreglo en el archivo es: "
    len_msj_contenido equ $-msj_contenido
    resultado db "  "
    len equ $ - resultado
    repeticiones1 db "El numero "
    len_repeticiones1 equ $-repeticiones1
    veces db " veces."
    len_veces equ $-veces
    repeticiones db " se repite "
    len_repeticiones equ $-repeticiones
    salto db "  ",10
    suma_arreglo db 10,"El resultado de la suma total es: "
    len_suma_arreglo equ $-suma_arreglo
    espacio db 10,"",10

section .bss
    idArchivo resb 1
    contenido_archivo resb 20
    numero resb 1
    repetir resb 1
    resultado_suma resb 1

section .text
    global _start

_start:
 
        abrir_archivo archivo_a_leer
        test eax, eax 
        jz imprimir_error

        mov dword [idArchivo], eax

        mov eax, 3
        mov ebx, [idArchivo]
        mov ecx, contenido_archivo
        mov edx, 30
        int 80h

        imprimir espacio,1
        imprimir msj_contenido,len_msj_contenido
        imprimir contenido_archivo,20
        imprimir espacio,1

        cerrar_archivo idArchivo

        mov esi, contenido_archivo
        mov edi, 0
        
        mov cl, 0
        mov dl, 0

        mov [resultado_suma], cl

        jmp comparacion

imprimir_error:

        imprimir msj_error,len_error
        jmp salir

comparacion:
        mov al, [esi]
        sub al, '0'
        add edi, 1
        add esi, 1

        cmp al, dl
        je aux
        cmp edi, 20
        jb comparacion

        jmp comparacion_suma

aux:
        inc cl
        cmp edi, 20
        jb comparacion

comparacion_suma:
        cmp cl, 0
        jg imprimir_repeticiones
        inc dl
        mov esi, contenido_archivo
        mov edi, 0    
        mov cl, 0
        cmp dl, 9
        jng comparacion
        clc

        jmp imprimir_suma


imprimir_repeticiones:
        push dx
        add dl, '0'
        mov [numero], dl
        add cl, '0'

        mov [repetir], cl
        imprimir espacio,1
        imprimir repeticiones1,len_repeticiones1
        imprimir numero,1
        imprimir repeticiones,len_repeticiones
        imprimir repetir,1
        imprimir veces,len_veces
        imprimir salto,2
        pop dx
        inc dl
        mov esi, contenido_archivo
        mov edi, 0    
        mov cl, 0

        cmp dl, 9
        jng comparacion

        clc

        jmp imprimir_suma

imprimir_suma:
        mov al, [resultado + 1]
        mov ah, [esi]
        sub ah, '0'
        adc al, ah
        aaa
        pushf
        or al, 30h
        popf
        mov [resultado + 1], al
        mov al, [resultado + 0]
        mov ah, 0
        adc al, ah
        aaa
        pushf
        or al, 30h
        popf
        mov [resultado + 0], al
        add edi, 1
        add esi, 1

        cmp edi, 20
        jb imprimir_suma

        imprimir suma_arreglo,len_suma_arreglo
        imprimir resultado,2
        imprimir salto,2

        jmp salir

salir:
    mov eax, 1
    int 80h