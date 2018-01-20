%include "io.inc"

section .data
arr          dd     1,2,3,4,5,6,7,8,9,10
arrsize     EQU     ($-arr)/4

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ecx, ecx
    
while:
    cmp ecx, arrsize
    je endwhile
    add eax, dword[arr + ecx * 4]
    inc ecx
    jmp while
    
endwhile:
    PRINT_DEC 2, eax    
    ret