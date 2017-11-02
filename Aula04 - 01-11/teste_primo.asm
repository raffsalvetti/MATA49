%include "io.inc"

section .data
str_fim db  "fim de programa",0
str_pos db  "o numero eh primo",0
str_neg db  "o numero nao eh primo",0

section .bss
num         resb    1
cont        resb    1


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx        
    xor edx, edx        
        
    GET_DEC 1, [num]
    mov byte [cont], 0
    mov cl, byte [num]
    inc cl
    
while:
    dec cl
    cmp cl, 0
    je teste
    mov ah, 0
    mov al, byte [num]
    div cl
    cmp ah, 0
    je count
    jmp while

count:
    mov al, byte [cont]
    inc al
    mov byte [cont], al
    jmp while

teste:
    cmp dword [num], 2
    je primo
    jmp nprimo
    
primo:
    PRINT_STRING [str_pos]
    jmp end
    
nprimo:
    PRINT_STRING [str_neg]
    jmp end
    
end:
    NEWLINE
    PRINT_STRING str_fim
    ret