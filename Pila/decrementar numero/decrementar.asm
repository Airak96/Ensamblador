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
    msj db "Ingrese un numero a decrementar: ",10
    len_msj equ $-msj

section .bss
    numero resb 2

section .text
    global _start
_start:
    escribir msj,len_msj
    leer numero,1

principal:

    mov eax,[numero]
    sub eax,'0'
    dec eax
    mov ecx,eax
    add eax,'0'
    mov [numero],eax  
    cmp ecx,0
    jz salir
    jnz imprimir

imprimir:
    escribir numero,1
    jmp principal
salir:
    mov eax, 1
    int 80h