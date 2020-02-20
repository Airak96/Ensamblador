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
    msj db "* "
    len_msj equ $-msj
    espacio db 10,""
section .text
    global _start
_start:

    mov ecx, 5
    mov eax, 5
    jmp imprimir

principal:
    dec eax

    push eax
    escribir espacio,1
    pop eax

    mov ecx, 5

    cmp eax,0
    jz salir
    jmp imprimir

imprimir:
    dec ecx 

    push eax
    push ecx
    escribir msj,len_msj
    pop ecx
    pop eax

    cmp ecx, 0
    je principal
    jmp imprimir


salir:
    mov eax, 1
    int 80h