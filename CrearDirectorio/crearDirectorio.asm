%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx,%1
    mov edx,%2
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
    msj db 10, "Carpeta o directorio creado",10
    len_msj equ $- msj

    mensaje db "Ingrese la ruta donde desea crear el directorio: ",10
    len_mensaje equ $- mensaje

    ;path db '/home/fabricio/Escritorio/coronel',0
    ;len_path equ $- path
section .bss
    dir resb 2
section .text
    global _start
_start:
    escribir mensaje, len_mensaje
    leer dir, 35

    mov eax, 39    ; servicio para crear un directorio
    mov ebx, dir  ; define la ruta del servicio
    mov ecx, 0x1FF ; definimos el permiso 777
    int 80h

    escribir msj, len_msj
    
    mov eax, 1
    int 80h