%include "io.inc"

%define str_len 256

section .data
    lbl_str1    db  "tamanho str1: ",0
    lbl_str2    db  "tamanho str2: ",0
    
section .bss
    str1        resb    str_len
    str2        resb    str_len
    str1_len    resd    1
    str2_len    resd    1
    
section .text
global CMAIN
CMAIN:
    GET_STRING  str1, str_len
    GET_STRING  str2, str_len
    mov eax, 0
    mov ebx, 0
    mov ecx, -1
    mov edx, 0
    
    
count1:
    inc ecx
    cmp byte [str1 + ecx], 0
    je print1
    jmp count1
    
print1:
    dec ecx
    PRINT_STRING lbl_str1
    PRINT_DEC 1, ecx

count2:
    inc eax
    cmp byte [str2 + eax], 0
    je print2
    jmp count2
    
print2:
    dec eax
    NEWLINE
    PRINT_STRING lbl_str2    
    PRINT_DEC 1, eax

end:
    ret    