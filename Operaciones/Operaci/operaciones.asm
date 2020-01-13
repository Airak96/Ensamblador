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

        mensajen3 db "1.Suma",10,"2.Resta",10,"3.multiplicacion",10,"4.Division",10,"5.Salir",10,"Seleccione una opcion: "
        lenn3 equ $ - mensajen3

        mensaje_error db "Ingrese una opcion valida!",10
        len_mensaje_error equ $-mensaje_error

        mensajesuma db 10,"suma: "
        lensuma equ $ - mensajesuma

        mensajeres db 10,"resta: "
        lenres equ $ - mensajeres

        mensajeprod db 10,"Producto: "
        lenprod equ $ - mensajeprod

        mensajedivid db 10,"***La división***",10
        lendivid equ $ - mensajedivid

        mensaje2 db 10,"Cociente: "
        len2 equ $ - mensaje2

        new_line db 10, " "

        mensajed db 10, "residuo: "
        lend equ $ - mensajed

        mensaje_opcion db "Desea seguir? si(1) no (0)",10
        len_mensaje_opcion equ $ - mensaje_opcion


section .bss
        n1 resb 1
        n2 resb 1
        opcion resb 2
        opcion1 resb 2
        residuo resb 1
        cociente resb 1
        suma resb 1
        resta resb 1
        producto resb 1
section .text
        global _start
_start: ; Etiqueta del inicio de segmento de codigo

; ingreso del primer numero
ingresar:
        escribir mensajen1, lenn1 

        leer n1, 2

; ingreso del segundo numero 

        escribir mensajen2, lenn2

        leer n2, 2
        ;jmp menu:
; Leer opcion
menu:
         
         escribir mensajen3, lenn3
         leer opcion,2
         mov ah,[opcion]
         sub ah,'0'

         cmp ah,1
         je sumar
         cmp ah,2
         je restar
         cmp ah,3
         je multiplicacion
         cmp ah,4
         je division
         cmp ah,5
         je salir
         
         escribir mensaje_error, len_mensaje_error
         jmp menu


        
        
sumar:        
; ṕroceso de suma
        
        mov al, [n1]
        mov ah, [n2]
        
        sub al, '0'
        sub ah, '0'
        add al, ah
        add al, '0'
    
        mov[suma], al

        escribir mensajesuma, lensuma
        escribir suma, 1
        escribir new_line, 1

        escribir mensaje_opcion, len_mensaje_opcion
        leer opcion1,2
        mov ah,[opcion1]
         sub ah,'0'
        cmp ah,1
        je ingresar
        cmp ah,2
        jmp salir

restar:
; ṕroceso de resta
        mov ax, [n1]
        mov bx, [n2]
        
        sub ax, '0'
        sub bx, '0'
        sub ax, bx
        add ax, '0'
    
        mov[resta], ax

        escribir mensajeres, lenres
        escribir resta, 1
        escribir new_line, 1

        escribir mensaje_opcion, len_mensaje_opcion
        leer opcion1,2
        mov ah,[opcion1]
         sub ah,'0'
        cmp ah,1
        je ingresar
        cmp ah,2
        jmp salir

multiplicacion:
; ṕroceso de producto
        mov al, [n1]
        mov bl, [n2]
        
        sub ax, '0'
        sub bl, '0'

        mul bl
        add al, '0'
        mov [producto], al

        escribir mensajeprod, lenprod
        escribir producto, 1
        escribir new_line, 1
        
        escribir mensaje_opcion, len_mensaje_opcion
        leer opcion1,2
        mov ah,[opcion1]
         sub ah,'0'
        cmp ah,1
        je ingresar
        cmp ah,2
        jmp salir

division:
;  división
        
        escribir mensajedivid, lendivid
       
        mov al, [n1]
        mov bl, [n2]
        
        sub ax, '0'
        sub bl, '0'


        div bl
        add al, '0'  
        mov [cociente], al 
        add ah, '0'
        mov [residuo], ah
        ;++++++++++++++++++cociente++++++++++++++++++++++++++
        escribir mensaje2, len2
        escribir cociente, 1
        ;++++++++++++++++++residuo++++++++++++++++++++++++++
        escribir mensajed, lend
        escribir residuo, 1
        ;++++++++++++++++++resultado++++++++++++++++++++++++++
        escribir new_line, 1
        
        escribir mensaje_opcion, len_mensaje_opcion
        leer opcion1,2
        mov ah,[opcion1]
         sub ah,'0'
        cmp ah,1
        je ingresar
        cmp ah,2
        jmp salir


salir:        
        mov eax, 1
        int 80h
