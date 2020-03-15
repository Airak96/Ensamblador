section .data
    numero1 db '518'
    numero2 db '197'
    resultado db '    '
    len_resultado equ $-resultado
section .bss

section .text
    global _start
_start:

    mov esi, 2
    mov ecx, 3
    clc  ;Permite desactivar el bit (estado) de la bandera carry

proceso_suma:
    mov al, [numero1 + esi] ; establece la posicion del ultimo digito posicion 3 [0-3] y longitud 4

    sbb al, [numero2 + esi]
    aas ; trabaja solo con al para ajustar
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
