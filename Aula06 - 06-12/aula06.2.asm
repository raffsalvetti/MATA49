%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx    
    push 55
    push -49
    push 12        
    call max3
    PRINT_DEC 2, eax
    ret
    
max3:
    pop ebx     ;   salvando o endereco de memoria
    mov ecx, 3
    pop eax
while:
    dec ecx
    cmp ecx, 0
    je end
    pop edx
    cmp edx, eax
    jg greater
    jmp while
    
greater:
    mov eax, edx
    jmp while
    
end:
    push ebx
    ret