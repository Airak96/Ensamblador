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

%macro presentar 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro

section .data
       mensajen1 db "#1: "
       lenn1 equ $ - mensajen1

       mensajen2 db "#2: "
       lenn2 equ $ - mensajen2

       msj1 db 10,"Residuo: "
       len1 equ $-msj1

       msj2 db 10,"Cociente: "
       len2 equ $-msj2
section .bss
       n1 resb 1
       n2 resb 1
       resta resb 1
       residuo resb 1
       cociente resb 1

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
    mov cx,0
    
    

division:
            
        sub al, bl
	    inc cx
	    cmp al,bl
	    jg division
        je division
	    jmp resultado

     

resultado:
        add al,'0'
	    add cx,'0'
	    mov [cociente], cx
	    mov [residuo], al

       escribir msj2,len2
       presentar cociente

       escribir msj1,len1
       presentar residuo

       jmp salir

salir:
       mov eax,1
       int 80h