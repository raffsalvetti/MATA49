%include "io.inc"

%define S1MAXLEN 20

;;entrada para teste;;
; klapaucius
; rosebud
; s
; p
; k


section .bss
    S1      resb    S1MAXLEN
    S2      resb    S1MAXLEN
    ST      resb    S1MAXLEN
    S1L     resd    1
    S2L     resd    1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
;;INICIO LETRA A
    mov ecx, -1
    GET_STRING S1, S1MAXLEN
    PRINT_STRING "a) S1 LIDO: "
    PRINT_STRING S1
    NEWLINE
;;FIM LETRA A

;;INICIO LETRA B
whb1:
    inc ecx
    cmp byte[S1 + ecx], 10
    jne whb1
    mov dword[S1L], ecx
    PRINT_STRING "b) TAMANHO DE S1: "
    PRINT_DEC 4, ecx
    NEWLINE
;;FIM LETRA B

;;INICIO LETRA C
    mov ecx, -1
    GET_STRING S2, S1MAXLEN
    PRINT_STRING "c) LIDO S2: "
    PRINT_STRING S2
    NEWLINE
whc1:
    inc ecx
    cmp byte[S2 + ecx], 10
    jne whc1
    mov dword[S2L], ecx
    cmp dword[S1L], ecx
    jne c_dif
    xor eax, eax
    xor ecx, ecx
whc2:
    mov al, byte[S1 + ecx]
    cmp al, byte[S2 + ecx]
    jne c_dif
    inc ecx
    cmp ecx, dword[S1L]
    jne whc2
    jmp c_igual
c_dif:
    PRINT_STRING "S1 e S2 sao diferentes!"
    NEWLINE
    jmp c_fim
c_igual:
    PRINT_STRING "c) S1 e S2 sao iguais!"   
    NEWLINE
c_fim:
;;FIM LETRA C

;;INICIO LETRA D
    mov esi, S1
    mov edi, S2
    add edi, dword[S2L]
    mov ecx, dword[S1L]
    repnz movsb
    add dword[S2L], ecx
    PRINT_STRING "d) CAT(S2, S1): "
    PRINT_STRING S2
    NEWLINE
;;FIM LETRA D
    
;;INICIO LETRA E
    mov ecx, dword[S1L]
    PRINT_STRING "e) S1 REVERSO: "
    NEWLINE
whe1:
    dec ecx
    PRINT_CHAR [S1 + ecx]
    cmp ecx, 0
    jne whe1
    NEWLINE
;;FIM LETRA E

;;INICIO LETRA F
    xor eax, eax
    GET_CHAR al
    mov ecx, dword[S1L]
    
whf1:
    dec ecx
    cmp ecx, -1
    je f_fim
    cmp al, byte[S1 + ecx]
    je f_cnt
    jmp whf1
f_cnt:
    inc ah
    jmp whf1
f_fim:
    PRINT_STRING "f) "
    PRINT_CHAR al 
    PRINT_STRING " FOI ENCONTRADO "
    PRINT_DEC 1, ah
    PRINT_STRING " VEZES EM S1!"
    NEWLINE
;;FIM LETRA F

;;INICIO LETRA G
    xor eax, eax
    xor ecx, ecx
    GET_CHAR al ;;  correcao de bug que pega o char 10
    GET_CHAR al
    GET_CHAR ah ;;  correcao de bug que pega o char 10
    GET_CHAR ah
whg1:
    cmp al, byte[S1 + ecx]
    je g_xch
    inc ecx
    cmp ecx, dword[S1L]
    je g_fim
    jmp whg1
g_xch:
    mov byte[S1 + ecx], ah
g_fim:
    PRINT_STRING "g) SUBSTITUINDO "
    PRINT_CHAR al
    PRINT_STRING " POR "
    PRINT_CHAR ah
    PRINT_STRING " EM S1: "
    PRINT_STRING S1
    NEWLINE
;;FIM LETRA G

;;INICIO LETRA H
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    mov ch, -1
whh1:
    inc ch
    cmp ch, byte[S2L]
    je h_n_eh_substr
    xor cl, cl
    movzx ebx, ch
    mov al, byte[S2 + ebx]
    
whh2:
    movzx ebx, cl
    cmp al, byte[S1 + ebx]
    je h_add
    xor ah, ah
    inc cl
    cmp cl, byte[S1L]
    je whh1
    jmp whh2

h_add:
    inc ah
    cmp ah, byte[S1L]
    je h_eh_substr
    jmp whh2
    
h_eh_substr:
    PRINT_STRING "h) "
    PRINT_STRING S1
    PRINT_STRING " EH SUBSTRING DE "
    PRINT_STRING S2
    NEWLINE
    jmp h_end
h_n_eh_substr:
    PRINT_STRING "h) "
    PRINT_STRING S1
    PRINT_STRING " NAO EH SUBSTRING DE "
    PRINT_STRING S2
    NEWLINE
h_end:    
;;FIM LETRA H

;;INICIO LETRA I
    xor eax, eax
    mov esi, S1
    mov edi, ST
    GET_DEC 1, al
    GET_DEC 1, ah
    movzx ebx, al
    add esi, ebx
    movzx ecx, ah
    repnz movsb
    PRINT_STRING "i) INICIO: "
    PRINT_DEC 1, al
    PRINT_STRING "; TAMANHO: "
    PRINT_DEC 1, ah
    PRINT_STRING "; SUBSTRING: "
    PRINT_STRING [ST]
;;FIM LETRA I

;;INICIO LETRA G
    mov ch, byte[S1L]
    mov cl, byte[S2L]    
    cmp cl, ch
    jle g_xch
    jmp whg1
g_xch:    
    xchg cl, ch
    mov ah, 1
whg1:
    movzx ebx, cl
    mov al, byte[S1 + ebx]
    cmp al, byte[S2 + ebx]
    jg g_invert
    inc cl
    cmp cl, 
;;FIM LETRA G
    ret