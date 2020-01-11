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
    numero1 db "Ingrese el primer numero",10
    len_numero1 equ $ - numero1
    numero2 db "Ingrese el segundo numero",10
    len_numero2 equ $ - numero2
    msj_negativo db'es negativo',10
    len_negativo equ $ - msj_negativo
    msj_positivo db'es positivo',10
    len_positivo equ $ - msj_positivo

section .bss
        n1 resb 2
        n2 resb 2
section .text
    global _start:
_start:
       escribir numero1, len_numero1
       leer n1, 2
       escribir numero2, len_numero2
       leer n2, 2

    mov ax,[n1]
    sub ax,'0'
    mov bx,[n2]
    sub bx,'0'
    sub ax,bx ;Movimiento o cambio de las banderas
    js negativo
    jmp positivo

positivo:
    escribir msj_positivo, len_positivo
    jmp salir

negativo:
    escribir msj_negativo, len_negativo
    jmp salir

salir:
    mov eax,1
    int 80h