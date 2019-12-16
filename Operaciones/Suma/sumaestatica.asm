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
        mensaje db "El resultado es: ", 10 ;0xa 10 = new line
        len equ $-mensaje
section .bss
        n1 resb 1
        n2 resb 1
        suma resb 1

section .text
        global _start
_start:
;****************************** Ingreso del numero 1 **********************************
        escribir msj1, len1
        leer n1,2
        

;******************************** Ingreso numero 2 **************************
        escribir msj2, len2
        leer n2, 2
        

;***************************** Proceso Suma ***************************

         mov ax,[n1]
         mov bx,[n2]
         sub ax, '0'
         sub bx, '0'
         add ax, bx
         add ax, '0'

 ;       mov eax, 2
  ;      mov ebx, 4
   ;     add eax, ebx
    ;    add eax, '0'               ; Para transformar de # a cadena se suma '0' add registro,'0'
                                    ; de cadena a # resto '0' sub registro, '0'
        
        mov [suma], ax

;**************** Imprime Suma *****************
        escribir mensaje, len
        

        escribir suma, 1


        mov eax,1
        int 80h

