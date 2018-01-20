%include "io.inc"

;;  Dada uma sequencia de n numeros, imprimi-la
;;  na ordem inversa a da leitura.

section .data
    numeros     dd  1,2,3,4,5,6,7,8,9,10            ;   define um array com numeros
    qtd_num     EQU ($-numeros)/4                   ;   define o tamanho do array com numeros

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax                                    ;   limpa eax
    xor ecx, ecx                                    ;   limpa ecx
    mov ecx, qtd_num                                ;   carrega o contador ecx com o tamanho do array
while:
    dec ecx                                         ;   decrementa o contador
    cmp ecx, -1                                     ;   compara o contador com o a posicao de inicio de array
    je endwhile                                     ;   se o contador estiver no inicio do array, pula para o final
    mov eax, dword[numeros + ecx * 4]               ;   copia o valor do array para eax (4 eh o tamanho da alocacao em bytes, no caso 4 bytes)
    PRINT_DEC 4, eax                                ;   impreime o inteiro
    PRINT_STRING " "                                ;   imprime espaco entre os numeros inteiros
    jmp while                                       ;   volta para o inicio do laco para imprimir mais numeros
endwhile:    
    ret                                             ;   fim de rotina