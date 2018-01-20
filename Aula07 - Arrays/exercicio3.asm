%include "io.inc"

;;  Dado dois arrays, A (5 elementos) e B (8 elementos),
;;  faca um programa em assembly que imprima todos os
;;  elementos comuns aos dois arrays.

section .data
    A   dd  1,10,3,7,5          ;   definindo array A
    sA  EQU ($-A)/4             ;   calculando o tamanho do array A
    B   dd  3,4,5,6,7,8,9,10    ;   definindo array B
    sB  EQU ($-B)/4             ;   calculando o tamanho do array B

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax                ;   limpando eax
    xor ecx, ecx                ;   limpando eax

    
    ;;    ch conta os elementos de A
    ;;    cl conta os elementos de B      
whileA:
    cmp ch, sA                  ;   comparando o contador do array A com o a quantidade de elementos
    je endwhileA                ;   se foi igual, acabou de verificar os elementos do array e acabou o programa
    movzx ebx, ch               ;   copia ch para ebx preenchendo com zero os bits faltantes
    mov ebx, dword[A + ebx * 4] ;   copia o valor de teste do array A para ebx
whileB:
    cmp cl, sB                  ;   comparando o contador do array B com o a quantidade de elementos
    je endwhileB                ;   se foi igual, acabou de verificar os elementos do array B
    movzx edx, cl               ;   copia cl para ebx preenchendo com zero os bits faltantes
    inc cl                      ;   incrementa o contador do array B
    cmp ebx, dword[B + edx * 4] ;   compara os numeros entre os arrays
    jne whileB                  ;   se nao for igual, volta para whileB
    PRINT_DEC 4, ebx            ;   se for igual, imprime o numero na saida
    PRINT_STRING " "            ;   imprime espaco para separar os numeros
    jmp whileB                  ;   volta para whileB
endwhileB:
    mov cl, 0                   ;   zera o contador do array B
    inc ch                      ;   incrementa o contador do array A
    jmp whileA                  ;   volta para whileA
endwhileA:
    ret                         ;   fim de programa!