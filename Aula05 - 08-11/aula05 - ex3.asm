%include "io.inc"

%define input_len   256

section .data


section .bss
    string      resb    input_len
    char        resb    1

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0
    mov ebx, 0
    mov ecx, -1
    mov edx, 0            
    GET_STRING string, input_len
    GET_CHAR char

while:
    inc ecx
    cmp byte [string + ecx], 0
    je  

end:
    ret