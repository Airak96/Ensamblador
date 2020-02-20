section .data
    msj db ":v "
    len_msj equ $-msj

    espacio db "",10


section .bss
    numero resb 2
section .text
    global _start
_start:
    mov ecx, 50
    
    
ciclo:

    
    push ecx
    mov al,cl
    mov cl,10
    div cl
    add ax,'00'
    mov [numero],eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len_msj
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,numero
    mov edx, 2
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,espacio
    mov edx, 1
    int 80h

    pop ecx

    loop ciclo


    mov eax, 1
    int 80h