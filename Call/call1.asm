section .data
    msj db "*"

    new db 10,""

section .bss
    contador_bx resb 1
    contador_cx resb 1

section .text
    global _start
_start:
    
    mov ecx, 9
    mov ebx, 9

l1:
    
    
    push ecx
    ; imprimir linea
    call imprimir_linea 
    pop ecx
    push ecx
   
    

l2:

    push ecx
    ; imprimir el asterisco
    call imprimir_asterisco
    pop ecx
    loop l2

    pop ecx
    
    
    loop l1
    jmp salir


imprimir_linea:

    mov eax, 4
    mov ebx, 1
    mov ecx, new
    mov edx, 1
    int 80h
    ret

imprimir_asterisco:

    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, 1
    int 80h
    ret

salir:

    mov eax, 1
    int 80h



