%include "io.inc"

;;  Escreva uma macro que calcule a media de
;;  tres numeros e imprima o resultado no monitor

%macro media3 3         ;   definindo nome da macro e numero de parametros
    mov eax, %1          ;   movendo o valor do paramerto 1 para ax
    add eax, %2          ;   ax += parametro 2
    add eax, %3          ;   ax += parametro 3
    mov edx, 0
    mov ecx, 3
    div ecx
    PRINT_DEC 2, eax     ;   imprimindo o valor de ax
%endmacro

section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    media3 1, 2, 3       ;   chamando o macro
    ret                  ;   fim de programa