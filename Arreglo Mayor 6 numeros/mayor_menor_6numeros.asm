%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db "Ingrese 6 numeros: ",10
    len equ $-msj

    msj1 db "El numero mayor es: ",10
    len1 equ $-msj1

    m_mayor db "El numero mayor: "
    len_mayor equ $-m_mayor

    m_menor db "El numero menor: "
    len_menor equ $-m_menor

    salto db "",10
    len_salto equ $-salto
    
    arreglo db 0,0,0,0,0,0
    len_arreglo equ $-arreglo

section .bss
    numero resb 2
    mayor resb 2
    menor resb 2

section .text
    global _start

_start:
    imprimir msj, len

    ; asignacion del arreglo en las posiciones efectivas
    mov esi, arreglo
    mov edi, 0

lectura:
    leer numero, 2

    ; asignacion de un numero al arreglo
    mov al, [numero]
    sub al, '0'
    mov [esi], al

    add esi, 1
    add edi, 1

    ; comparar para el salto
    cmp edi, len_arreglo
    jb lectura

    sub esi, len_arreglo
    mov edi, 0

    mov al, 0
    mov [mayor], al

    mov al, [esi]
    mov [menor], al


impresion:
    mov al, [esi]

    mov bl, [mayor]
    mov cl, [menor]

    cmp al, bl 
    jg asignar_mayor

    cmp cl, al
    jg asignar_menor
    
    add al, '0'
    mov [numero], al

    add esi, 1
    add edi, 1

    cmp edi, len_arreglo
    jb impresion

    mov al, [mayor]
    add al, '0'

    mov [mayor], al

    mov al, [menor]
    add al, '0'

    mov [menor], al    
   imprimir m_menor, len_menor
    imprimir menor,2
      imprimir salto, 2
    imprimir m_mayor, len_mayor
    imprimir mayor,2


 

    imprimir salto, 2

    jmp salida
asignar_menor:
    mov [menor], al
    jmp impresion
asignar_mayor:
    mov [mayor], al
    jmp impresion
salida:
    mov eax, 1
    int 80h