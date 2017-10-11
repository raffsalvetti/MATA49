%include "io.inc"

section .text

global CMAIN



CMAIN:
    mov ebp, esp; for correct debugging
    call zero
    mov eax, (10 << 2)
    mov ebx, 100
    add eax, ebx
    PRINT_DEC 4, eax;
    NEWLINE
    PRINT_DEC 4, ebx;
    ret
    
zero:
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0
    ret    