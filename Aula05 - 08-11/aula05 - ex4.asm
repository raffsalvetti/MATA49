%include "io.inc"

;   Faca um programa que remova os espacos em
;   branco de uma string

section .data
    string      db      "SOCORRAM ME SUBI NO ONIBUS EM MARROCOS",0
    length      EQU     $-string;   $ marca a posicao da instrucao atual
                                ;   $-string subtrai da posicao atual o tamanho da instrucao string
                                ;   o resultado eh o tamanho da string

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax                ;   limpa eax
    mov esi, string             ;   copia o endereco de string para ESI(Extended Source Index)
    mov ecx, length
l:  lodsb                       ;   lodsb copia o valor do ponteiro de ESI, DS para AL
    cmp  al, ' '                ;   comparando AL com ' ' (espaco)
    je z                        ;   se for igual pula pra o marcador de loop
    PRINT_CHAR al               ;   caso contrario imprime o caractere
z:  loop l                      ;   executa o codigo enquando ECX > 0
    ret