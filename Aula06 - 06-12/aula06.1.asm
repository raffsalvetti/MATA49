%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    mov ax, 16
    push ax
    mov ax, 17
    push ax
    call min2
    PRINT_DEC 2, ax
    ret
    
min2:
    pop ecx     ;   salvando o endereco de retorno da funcao principal
    pop ax
    pop bx
    cmp ax, bx
    jg swap
    push ecx    ;   retornando o endereco de execucao
    ret
swap:
    mov ax, bx
    push ecx    ;   retornando o endereco de execucao
    ret

