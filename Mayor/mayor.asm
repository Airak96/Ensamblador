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
       mensajen1 db "#1: "
       lenn1 equ $ - mensajen1

       mensajen2 db "#2: "
       lenn2 equ $ - mensajen2

       msj1 db "numero mayor"
       len1 equ $-msj1

       msj2 db "numero menor"
       len2 equ $-msj2

       msj3 db "Numero igual"
       len3 equ $-msj3
section .bss
       n1 resb 1
       n2 resb 1

section .text
       global _start
_start:
       escribir mensajen1, lenn1 
       leer n1, 2
       escribir mensajen2, lenn2
       leer n2, 2

    mov al,[n1]
    sub al,'0'
    mov bl,[n2]
    sub bl,'0'

    cmp al,bl
    jg mayor  ; ZF = 0  CF=0
    je igual
    jmp menor
    

mayor:
       mov eax,4
       mov ebx,1
       mov ecx,msj1
       mov edx,len1
       int 80h
       jmp salir

menor:
       mov eax,4
       mov ebx,1
       mov ecx,msj2
       mov edx,len2
       int 80h
       jmp salir
igual:
       mov eax,4
       mov ebx,1
       mov ecx,msj3
       mov edx,len3
       int 80h
salir:
       mov eax,1
       int 80h
