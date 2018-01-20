%include "io.inc"

;;  para a logica funcionar, nlin e ncol devem ser maiores que 0 e menores que 10
%define nlin 8
%define ncol 8

section .bss
matrix      resw    nlin*ncol

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    ;;  ch conta as colunas
    ;;  cl conta as linhas
    
    ;;  incrementa colunas
col:
    cmp ch, ncol
    je inclin 
    
    ;; colocando o caractere que representa linha e coluna em ax
    mov ah, 31h
    add ah, ch
    mov al, 41h
    add al, cl
    call pos_mat_in_ebx             ;   chamando rotina calcula a posicao da matriz
    mov word[matrix + ebx], ax      ;   copiando caracteres para a matriz. 1A para col 1 e lin A, 2B para col 1 e lin B e etc
    
    inc ch                          ;   incrementando coluna
    jmp col
    
    ;;  incrementa linhas
inclin:
    mov ch, 0                       ;   retornando para a coluna 0
    cmp cl, nlin                    ;   verificando fim de linhas
    je end                          ;   se chegar ao fim das linhas, termina o programa
    inc cl                          ;   caso contrario, incrementa o numero de linhas
    jmp col                         ;   e volta para a contagem de colunas
    
end:
    ;;  a saida do programa deve ser verificada via depurador
    ;;  verificando a variavel de memoria matrix
    ret  
    
pos_mat_in_ebx:
    ;;  calculando posicao da matriz e movendo ax para o lugar certo
    ;;  [(lin * num_colunas + col) * tam_alocacao_em_byte] calcula a posicao da matriz
    ;;  ebx eh usado como registrador temporario para fazer o calculo da posicao da matriz
    movzx ebx, cl                   ;   adicionando contador de linha. movzx copia registradores com tamanhos diferentes preenchendo com zero o resto do registrador maior
    imul ebx, ncol                  ;   miltiplicando pelo numero de colunas
    movzx edx, ch                   ;   edx eh usado como registrador temporario
    add ebx, edx                    ;   adicionando contador de coluna
    imul ebx, 2                     ;   multiplicando pelo tamanho da alocacao, no caso 2bytes
    ret