%include "io.inc"

section .data
    str1        db  "teste1",0
    str1_len    EQU $-str1
    str2        db  "teste1",0
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    mov esi, str1
    mov edi, str2
    mov ecx, str1_len
    repe cmpsb
    cmp ecx, 0 ; igual
    je  igual
    
diferente:
    PRINT_STRING "diferentes" 
    jmp end    
    
igual:    
    PRINT_STRING "iguais" 
end:
    ret