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
    mensaje db "Ingrese un numero",10
    len_mensaje equ $-mensaje

    espacio db "",10
    len_espacio equ $-espacio
section .bss
    n1 resb 3
    valor resb 2
section .text
    global _start
_start:
    escribir mensaje, len_mensaje
    leer n1, 1
    

   

imprimir:
    escribir n1,1
    escribir espacio,len_espacio
    mov eax,[n1]
    sub eax,'0'
    dec eax
    mov ecx,eax
    add eax,'0'
    mov [n1],eax
    

    cmp ecx,0
    jz salir
    jnz imprimir

salir:
    mov eax, 1
    int 80h


