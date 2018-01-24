%include "io.inc"
    
section .data
    frase       db      "o rato roeu a roupa do rei da franca",0
    fraselen    equ     $-frase
    
    busca       db      "franca"
    buscalen    equ     $-busca
    
    troca       db      "italia"
    trocalen    equ     $-troca
    
section .bss
    slot        resb    255

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov esi, busca
    add esi, buscalen
    mov edi, frase
    add edi, fraselen
    std
    jmp s
whl:
    inc edi
s:  mov ecx, buscalen
    repe cmpsb
    cmp ecx, 0
    jne whl
    mov esi, troca
    mov ecx, trocalen
    cld
    inc edi
    repne movsb
    mov edi, frase
    PRINT_STRING [edi]
    ret