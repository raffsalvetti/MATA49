%include "io.inc"

section .data
str_fim     dd      "fim de programa",0
str_iguais  dd      "sao iguais",0
str_maior   dd      "maior: ",0
str_menor   dd      "menor: ",0

section .bss
num1    resd    1
num2    resd    0

section .text
global CMAIN
CMAIN:
    GET_DEC 4, eax
    GET_DEC 4, ebx
    cmp eax, ebx
    jg maior
    jl menor
    
igual:        
    PRINT_STRING str_iguais
    jmp end
    
maior:
    PRINT_STRING str_maior
    PRINT_DEC 4, eax
    NEWLINE
    PRINT_STRING str_menor
    PRINT_DEC 4, ebx
    jmp end
    
menor:
    PRINT_STRING str_maior
    PRINT_DEC 4, ebx
    NEWLINE
    PRINT_STRING str_menor
    PRINT_DEC 4, eax
    jmp end    
    
end:
    NEWLINE
    PRINT_STRING str_fim
    ret