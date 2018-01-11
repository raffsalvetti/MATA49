%include "io.inc"

;   Faca um programa que dado uma string em
;   minusculo converta os seus caracteres para
;   maiusculos


section .data
    string      db      "socorram me subi no onibus em marrocos",0
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
    cmp eax, 61h                ;   compara o caractere AL com 'a'
    jl p                        ;   se for menor pula para p
    cmp eax, 7Ah                ;   compara o caractere AL com 'z'
    jg p                        ;   se for maior pula para p
    sub al, 20h                 ;   eh subtraido 32 (20 em hexa) a AL para qualquer outro caso
                                ;   transformando uma lefra minuscula em maiuscula
                                ;   os valores dos caracteres foram obtidos na tabela ASCII
p:  PRINT_CHAR al               ;   imprime AL
    loop l                      ;   volta para l enquanto ECX > 0
    ret