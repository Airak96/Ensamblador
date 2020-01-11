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

        mensajelado db "Ingrese el valor de los lados: "
        lennlado equ $ - mensajelado

        mensajebase db "Ingresa el valor de la base: "
        lennbase equ $ - mensajebase

        mensajealtura db "Ingresa el valor de la altura: "
        lennaltura equ $ - mensajealtura

        mensajeradio db "Ingrese el valor del radio: "
        lennradio equ $ - mensajeradio

        mensajen3 db "1.Cuadrado",10,"2.Rectangulo",10,"3.Circulo",10,"Selecciones una opcion: "
        lenn3 equ $ - mensajen3

        mensajecuadrado db 10,"Area del Cuadrado: "
        lencuadrado equ $ - mensajecuadrado

        mensajeres db 10,"Rectangulo: "
        lenres equ $ - mensajeres

        mensajeprod db 10,"Area de circulo: "
        lenprod equ $ - mensajeprod

        new_line db 10, " "


section .bss
        n1 resb 1
        n2 resb 1
        opcion resb 2
        suma resb 1
        resta resb 1
        producto resb 1
section .text
        global _start
_start: ; Etiqueta del inicio de segmento de codigo


; ingreso del segundo numero 

        ;escribir mensajen2, lenn2

        ;leer n2, 2

; Leer opcion
         
         escribir mensajen3, lenn3
         leer opcion,2
         mov ah,[opcion]
         sub ah,'0'

         cmp ah,1
         je Cuadrado
         cmp ah,2
         je Rectangulo
         cmp ah,3
         je Circulo
         

        
        
Cuadrado:        
        escribir mensajelado, lennlado

        leer n1, 2
        
        mov al, [n1]
        mov bl, [n1]
        
        sub al, '0'
        sub bl, '0'
        mul bl
        add al, '0'
    
        mov[producto], al

        escribir mensajecuadrado, lencuadrado
        escribir producto, 1
        escribir new_line, 1
        jmp salir

Rectangulo:

        escribir mensajebase, lennbase 
        leer n1, 2

        escribir mensajealtura,lennaltura
        leer n2, 2
        
        mov al, [n1]
        mov bl, [n2]
        
        sub al, '0'
        sub bl, '0'
        mul bl
        add al, '0'
    
        mov[producto], al

        escribir mensajecuadrado, lencuadrado
        escribir producto, 1
        escribir new_line, 1
        jmp salir

Circulo:
        escribir mensajeradio, lennradio
        leer n1,2

        mov al, [n1]
        mov bl, [n1]
        
        sub ax, '0'
        sub bl, '0'

        mul bl
        add al, '0'

        mov al,al
        mov bl,3

        sub ax,'0'
        ;sub bl, '0'

        mul bl
        add al,'0'
        mov [producto], al
        

        escribir mensajeprod, lenprod
        escribir producto, 1
        escribir new_line, 1
        jmp salir


salir:        
        mov eax, 1
        int 80h

        
