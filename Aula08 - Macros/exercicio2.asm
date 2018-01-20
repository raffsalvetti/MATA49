%include "io.inc"

;;  Escreva uma macro que calcule a media de
;;  tres numeros e imprima o resultado no monitor

section .text

%macro soma3 3          ;   definindo nome da macro e numero de parametros
    mov ax, %1          ;   movendo o valor do paramerto 1 para ax
    add ax, %2          ;   ax += parametro 2
    add ax, %3          ;   ax += parametro 3
    PRINT_DEC 2, ax     ;   imprimindo o valor de ax
%endmacro

global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    soma3 1, 2, 3       ;   chamando o macro
    ret                 ;   fim de programa