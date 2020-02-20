%macro escribir 2
	mov eax,4  
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    asterisco db '*'
    vacio db ' '
    new_line db 10,''
section .bss
 

section .text
    global _start

_start:

    mov ecx, 7
  

l1:
    push ecx
    call imprimir
    pop ecx
    push ecx

    mov eax, 7
    mov ebx, ecx
    sub eax, ebx 

    cmp ecx, 7
    je l2
    jmp asteriscos

l2:

    loop l2

    pop ecx
    loop l1

    jmp salir

asteriscos:
    push eax
    push ecx
    escribir asterisco, 1
    pop ecx
    pop eax
    dec eax
    cmp eax, 0
    jz l2
    jnz asteriscos


imprimir:
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 1
    int 80h

    ret 

            

salir: 
    escribir new_line,1
    mov eax, 1
    int 80h

