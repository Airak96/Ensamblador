

section .data
    mensaje db 10,"Hola: "
    len_mensaje equ $ - mensaje
section .bss
    valor resb 2
section .text
    global _start
_start:

    mov cx,9
ciclo:
    cmp cx,0
    jz salir
    dec cx
    jnz imprimir


imprimir:
        
        mov eax, 4
        mov ebx, 1
        push cx
        add cx,'0'
        mov [valor],cx
        mov ecx, mensaje
        mov edx, len_mensaje
        int 80h
        
        mov eax, 4
        mov ebx, 1
        mov ecx, valor
        mov edx, 1
        int 80h
        pop cx
              
        jmp ciclo
salir:
    mov eax,1
    int 80h