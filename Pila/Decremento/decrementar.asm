
%macro escribir 2
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

    msj db "Ingrese un numero: ",10
    len_msj equ $-msj

    espacio db 10, ""
section .bss

    numero resb 2

section .text
    global _start
_start:

        ;*************** imprimir mensaje **************
        escribir msj, len_msj

        ;*********** leer numero ********
        leer numero, 1

        ;*********** Proceso ***********
        jmp imprimir
imprimir:
        mov eax,[numero]
        push eax

        escribir numero, 1
        escribir espacio,1
        
        pop eax
        sub eax,'0'   ; numero
        dec eax
        mov ecx, eax
        add eax,'0'    ; cadena
        mov [numero], eax

        cmp ecx, 0
        jz salir
        jmp imprimir


salir:
        mov eax, 1
        int 80h