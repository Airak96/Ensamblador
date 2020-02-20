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




;Nombre: Roberth Fabricio Carrion vega
;Curso: 6to A


section .data
    ingresar db "Ingrese un numero: ",10
    len_ingresar equ $-ingresar

    presentar db "Numero: "
    len_presentar equ $-presentar

    nummayor db "Numero mayor: ",10
    len_nummayor equ $-nummayor

    nummenor db "Numero menor: ",10
    len_nummenor equ $-nummenor

    orden db "Numeros Ordenados",10
    len_orden equ $-orden
    espacio db "",10

section .bss
    num1 resb 2
    num2 resb 2
    num3 resb 2
    num4 resb 2
    num5 resb 2
section .text
    global _start
_start:

    escribir ingresar,len_ingresar
    leer num1,2
    
    escribir ingresar,len_ingresar
    leer num2,2

    escribir ingresar,len_ingresar
    leer num3,2
    ;escribir espacio,1

    ;escribir ingresar,len_ingresar
    ;leer num4,1
    escribir espacio,1
    ;escribir ingresar,len_ingresar
    ;leer num5,1

    
    mov ax, [num1]
    sub ax, '0'
    mov bx, [num2]
    sub bx, '0'
    mov cx, [num3]
    sub cx, '0'
    ;mov dx, [num4]
    ;sub dx, '0'
    

;menor1:
    ;cmp cx,dx
    ;jng menor
    ;jg ordenarMenor

menor:
    cmp bx, cx
    jng ordenarMenor
    jmp mayor

mayor:
    cmp ax, bx
    jng ordenarMayor
    jmp comprobar

ordenarMenor:
    
    push dx
    mov dx, bx
    mov bx, cx   
    mov cx, dx
    pop dx

    jmp mayor

ordenarMayor:
    push dx
    mov dx, ax
    mov ax, bx 
    mov bx, dx
    pop dx
    jmp comprobar

comprobar:
    cmp bx, cx
    jng ordenar
    jmp numeros

ordenar:
    push dx
    mov dx, bx  
    mov bx, cx
    mov cx, dx
    pop dx

    jmp numeros

numeros:
    add ax, '0'
    add bx, '0'
    add cx, '0'
    add dx, '0'

    mov [num1], ax
    mov [num2], bx
    mov [num3], cx
    ;mov [num4],dx
    int 80h

    jmp imprimir

imprimir:
    escribir orden,len_orden
    
    ;escribir presentar,len_presentar
    ;escribir num4, 1
    ;escribir espacio,1

    escribir presentar,len_presentar
    escribir num3, 1
    escribir espacio,1

    escribir presentar,len_presentar
    escribir num2, 1
    escribir espacio,1

    escribir presentar,len_presentar
    escribir num1, 1
    escribir espacio,1

    escribir espacio,1

    escribir nummayor,len_nummayor
    escribir num1,1
    escribir espacio,1
    

    escribir nummenor,len_nummenor
    escribir num3,1
    escribir espacio,1

    jmp salir



salir:
    mov eax, 1
    int 80h