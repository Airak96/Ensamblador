
section .data
    numero1 db '3277'
    numero2 db '2566'
    resultado db '    '
    len_resultado equ $-resultado
section .bss

section .text
    global _start
_start:

    mov esi, 3
    mov ecx, 4
    clc  ;Permite desactivar el bit (estado) de la bandera carry

proceso_suma:
    mov al, [numero1 + esi] ; establece la posicion del ultimo digito posicion 3 [0-3] y longitud 4
    ;mov ah, [numero2 + esi]
    ;adc al, ah

    adc al, [numero2 + esi]
    aaa ; trabaja solo con al para ajustar
    pushf
    ; aas no afecta a al
    or al, 30h
    popf
    mov [resultado + esi], al
    
    dec esi
    loop proceso_suma

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado 
    mov edx, len_resultado
    int 80h

    mov eax, 1
    int 80h





