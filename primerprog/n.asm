section .data
        nombre db "Fabricio", 10
        tamano equ $-nombre ;calcular el tamano del mensaje 
        apellido db "Carrion", 10
        tamano2 equ $-apellido ;calcular el tamano del mensaje 
section .text
        global _start
_start: 
        mov eax, 4 ; operacion de escritura
        mov ebx,1  ; tipo de escritura 
        mov ecx, nombre ; lo que se va a imprimir 
        mov edx, tamano ; # de caracteres
        int 80H 

        mov eax, 4 ; operacion de escritura
        mov ebx,1  ; tipo de escritura 
        mov ecx, apellido ; lo que se va a imprimir 
        mov edx, tamano2 ; # de caracteres
        int 80H 

        mov eax, 1 
        int 80H  