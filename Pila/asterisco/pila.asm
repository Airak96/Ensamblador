section .data
    msj db "* * * * * ",10
    len_msj equ $-msj
section .text
    global _start
_start:

    mov ecx, 5
    jmp principal

principal:
    cmp ecx,0
    jz salir ;ecx = 0
    jmp imprimir

imprimir:
    dec ecx    ; loop permite incrementar automaticamente
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx,len_msj
    int 80h
    pop ecx
    jmp principal


salir:
    mov eax, 1
    int 80h
