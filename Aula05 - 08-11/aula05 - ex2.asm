%include "io.inc"

;	Faca um programa que conte quantos
;	caracteres existem em uma string

%define str_max_len 256
section .data
    lbl_str1    db  "tamanho str1: ",0
    
section .bss
    str1        resb    str_max_len
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_STRING  str1, str_max_len       ;   le a string no campo input
    xor eax, eax                        ;   zera o valor de eax
    mov edi, str1                       ;   copia o endereco de str1 para edi (EDI = Extended Destination Index)
    mov eax, 0                          ;   copia 0 para eax
                                        ;   scasb usa eax como valor de referencia para a busca
    mov ecx, str_max_len
    repnz scasb                         ;   repete o comando scasb enquanto ecx > 0
                                        ;   scasb busca pelo caractere que esta EAX e se encontrar define FZ
    inc ecx                             ;   ECX eh incrementado pois repnz executa o comando mais uma vez depois de encontrar o caractere
    mov eax, str_max_len
    sub eax, ecx                        ;   subtrai a posicao final do tamanho total da string
    PRINT_DEC 2, eax
    ret    