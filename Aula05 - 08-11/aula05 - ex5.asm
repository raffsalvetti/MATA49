%include "io.inc"

;   Faca um programa que dado uma string em
;   maiusculo converta os seus caracteres para
;   minusculos


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
    xor eax, eax
    mov esi, string             ;   copia o endereco de string para ESI(Extended Source Index)
    mov ecx, length
l:  lodsb                       ;   lodsb copia o valor do ponteiro de ESI, DS para AL
    cmp eax, 41h                ;   compara o caractere AL com 'A'
    jl p                        ;   se for menor pula para p
    cmp eax, 5Ah                ;   compara o caractere AL com 'Z'
    jg p                        ;   se for maior pula para p
    add al, 20h                 ;   eh somado 32 (20 em hexa) a AL para qualquer outro caso
                                ;   transformando uma lefra maiuscula em minuscula
                                ;   os valores dos caracteres foram obtidos na tabela ASCII
p:  PRINT_CHAR al               ;   imprime AL
    loop l                      ;   volta para l enquanto ECX > 0
    ret