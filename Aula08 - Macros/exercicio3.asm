%include "io.inc"

;;  Escreva uma macro que chame uma procedure
;;  para realizar a subtracao entre tres numeros e
;;  imprima o resultado no monitor caso o
;;  resultado seja maior que zero

%macro macro_sem_nome 3
    mov eax, %1
    mov ebx, %2
    mov edx, %3
    call subtracao
    cmp eax, 0
    jle fim
    PRINT_DEC 4, eax
    fim:
%endmacro

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    macro_sem_nome 4, 2, 1
    ret
    
    
subtracao:
    sub eax, ebx
    sub eax, edx
    ret