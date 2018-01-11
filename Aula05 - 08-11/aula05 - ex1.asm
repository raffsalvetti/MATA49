%include "io.inc"

%define str_len 256

section .data
    msg_diferente   db  "as strings sao diferentes",0
    msg_igual       db  "as strings sao iguais",0
    
    
section .bss
    str1        resb    str_len
    str2        resb    str_len
    str1_len    resd    1
    str2_len    resd    1
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_STRING  str1, str_len
    GET_STRING  str2, str_len
    mov eax, 0
    mov ebx, 0
    mov ecx, -1
    mov edx, 0
    mov dword [str1_len], 0
    mov dword [str2_len], 0
        
count_str1: ; o char de fim de linha sera contado
    inc ecx
    cmp byte [str1 + ecx], 0
    je fim_str1
    jmp count_str1
    
fim_str1:
    mov dword [str1_len], ecx
    
    mov ecx, -1     ;   reset do contador        
count_str2: ; o char de fim de linha sera contado
    inc ecx
    cmp byte [str2 + ecx], 0
    je fim_str2
    jmp count_str2
    
fim_str2:
    mov dword [str2_len], ecx


    mov eax, dword [str1_len]
    cmp eax, dword [str2_len]
    jne diferente

check:
    dec ecx
    cmp ecx, -1
    je igual
    mov al, byte [str1 + ecx]
    cmp al, byte [str2 + ecx]
    jne diferente
    jmp check
    
diferente:
    PRINT_STRING msg_diferente
    jmp end

igual:
    PRINT_STRING msg_igual
           
end:
    ret    