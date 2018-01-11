%include "io.inc"

;   Faca um programa que busque um caractere
;   em uma string e diga a sua quantidade


%define input_max_len   256

section .bss
    string      resb        input_max_len
    char        resb        1
    ocorrencias resd        1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov dword[ocorrencias], 0               ;   zerando o valor de ocorrencias
    GET_STRING  string, input_max_len       ;   lendo string do campo INPUT(primeira linha)
    GET_CHAR    char                        ;   lendo char do campo INPUT(segunda linha)
    mov eax, 0                              ;   definindo o caracter nulo como parametro de busca
    mov ecx, input_len                      ;   tamanho maximo de busca
    mov edi, string                         ;   copiando o endereco de string para EDI
    repnz scasb                             ;   buscando pelo caracter em EAX(al no caso)
                                            ;   repnz repete scasb enquando ECX > 0
    add ecx, 2                              ;   adicionando duas unidades ao contatdor
                                            ;   referente ao caracter 10 ou \n (nova linha) +
                                            ;   o caracter 0 ou \0 (fim de linha)
    mov eax, input_max_len
    sub eax, ecx                            ;   calcula o tamanho de string
    mov ecx, eax
    xor eax, eax                            ;   zera o valor de eax
    mov edi, string                         ;   recarrega o endereco de string em EDI
    mov al, byte[char]                      ;   define caracter de busca
    cld                                     ;   define direcao esqueda para direita (nao precisa pois o FD ja eh zero)
w:  repne scasb                             ;   inicia busca pelo caractere que esta em AL
                                            ;   scasb sai de repne se encontrar o caractere
    cmp ecx, 0                              ;   se ECX nao chegou a zero, nao acabou a string
    jg s                                    ;   pula para o label s se a string nao acabou
    PRINT_STRING "OCORRENCIAS DE '"         ;   se a string acabou, comeca a imprimir o resultado
    PRINT_CHAR char                     
    PRINT_STRING "': "
    mov eax, dword[ocorrencias]             ;   imprime a quantidade de ocorrencias
    PRINT_DEC 2, eax
    ret                                     ;   sai do programa
s:  inc dword[ocorrencias]                  ;   incrementa o valor de ocorrencias
    jmp w                                   ;   volta a verificar os caracteres