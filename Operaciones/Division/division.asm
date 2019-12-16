;Division
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
        msj1 db "Ingrese el primer numero: "
        len1 equ $-msj1
        msj2 db "Ingrese el segundo numero: "
        len2 equ $-msj2
        mensaje db "El resultado es: ",10;0xa 10 = new line
        len equ $-mensaje
        
section .bss
        n1 resb 1
        n2 resb 1
        division resb 2

section .text
        global _start
_start:
;****************************** Ingreso del numero 1 **********************************
        escribir msj1, len1
        leer n1,2
        

;******************************** Ingreso numero 2 **************************
        escribir msj2, len2
        leer n2, 2
        

;***************************** Proceso division ***************************
         
         mov ax,[n1]
         mov bx,[n2]
         
         ;sub ax, '0'
         ;sub bx, '0'
         
         div bx
         
        
        mov [division], al

;**************** Imprime Division *****************
        escribir mensaje, len
        

        escribir division, 1


        mov eax,1
        int 80h