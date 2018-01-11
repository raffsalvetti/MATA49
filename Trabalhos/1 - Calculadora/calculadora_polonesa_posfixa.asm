%include "io.inc"

section .data
    inicio          db                      "tratando a expressao: ",0
    estouro         db                      "estouro de pilha",0
    fim             db                      "fim do programa",0
    resultado       db                      "resultado = ",0
    expressao       times 255 db        0   ;   alocando 255 bytes para a expressao de calculo
    counter         dd                 -1
    expressao_len   dd                  0
    power           dd                  0
    base            dd                  0
    expoent         dd                  0
    inteiro         dd                  0
    eh_numero       dd                  0
;section .bss
;    expressao_len   resb                1   ;   alocando espaco para o tamanho da expressao 8bits
;    counter         resd                1   ;   alocando espaco para o contador 32bits   
;    power           resd                1   ;   alocando espaco para um numero inteiro 32bits
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;   ler expressao numerica do usuario
    ;   buscar caractere por caractere na string
    ;   comparar caractere por caractere para buscar numeros e operacoes
    ;   quando encontrar um numero, converter de caractere para inteiro
    ;   juntar numeros contiguos num inteiro maior ex: 123 = 3 + 20 + 100
    ;   colocar o numero inteiro na pilha
    ;   quando encontrar um caractere de operacao, pular para o marcador da operacao
    ;   desempilhar o operando 1
    ;   desempilhar o operando 2
    ;   operar
    ;   empilhar resultado
    ;   voltar para o inicio da rotina
    ;   se a pilha estiver vazia mostrar o resultado
    ;   sair do programa
    
    ;           ENTRADAS DE TESTE
    ;    782 197 - = 585
    ;    403 408 + 917 853 - 568 791 + 692 322 + + + + = 3248
    ;    224 18 309 + 620 683 - - - = -166
    ;    635 114 927 + 557 + + = 2233
    ;    484 390 - = 94
    ;    879 608 + 842 - 251 43 - 906 - + = -53
    ;    199 725 148 + 902 885 + - * = -181886
    ;    4 3 + 7 + 5 - 3 / 2 + 6 + 3 + = 14
    ;    8 3 4 + - 6 4 2 / + * 2 $ 5 + = 69
    
    GET_STRING expressao, 255
    PRINT_STRING inicio
    PRINT_STRING [expressao]
    NEWLINE
    mov eax, 0
    mov ebx, 0
    mov edx, 0
    mov ecx, -1
    mov [dword counter], ecx

countchar:
    inc ecx
    cmp dword [expressao + ecx], 0
    je end_found
    jmp countchar
    
end_found:
    mov dword [expressao_len], ecx
    
while:
    inc dword [counter]
    mov ecx, dword [counter]                ;   pegando o ultimo valor salvo do contador
    cmp ecx, dword [expressao_len]          ;   fim da expressao?
    je end                                  ;   se sim, pula para o fim
    cmp byte [expressao + ecx], 20h         ;   char menor que 'space'
    jl while                                ;   continue
    cmp byte [expressao + ecx], 39h         ;   char maior que 9 (fim dos numeros)
    jg while                                ;   continue
    cmp byte [expressao + ecx], 2Fh         ;   char maior que / (inicio dos numeros)
    jg char2int                             ;   converte char para numero
    cmp byte [expressao + ecx], 20h         ;   char igual a 'space'
    je join_int                             ;   pula para as instrucoes que juntam inteiros se tiver passado por um inteiro
    cmp byte [expressao + ecx], 2bh         ;   char igual a +
    je soma                                 ;   pula para as instrucoes de soma
    cmp byte [expressao + ecx], 2dh         ;   char igual a -
    je subtracao                            ;   pula para as instrucoes de subtracao
    cmp byte [expressao + ecx], 2ah         ;   char igual a *
    je multiplicacao                        ;   pula para as instrucoes de multiplicacao
    cmp byte [expressao + ecx], 2fh         ;   char igual a /
    je divisao                              ;   pula para as instrucoes de divisao
    cmp byte [expressao + ecx], 24h         ;   char igual a $
    je potencia   
    ;else
    jmp while                               ;   loop

end:
    PRINT_STRING fim                        ;   imprime mensagem de fim de programa
    NEWLINE
    PRINT_STRING resultado
    pop eax
    PRINT_DEC 4, eax
    ret                                     ;   retorna

soma:
    mov dword [eh_numero], 0
    pop eax
    pop ecx
    add eax, ecx
    push eax
    jmp while
    
subtracao:
    mov dword [eh_numero], 0
    pop ecx
    pop eax
    sub eax, ecx
    push eax
    jmp while
    
multiplicacao:
    mov dword [eh_numero], 0
    pop ecx
    pop eax
    mul ecx
    push eax
    jmp while
    
divisao:
    mov dword [eh_numero], 0
    pop ecx
    pop eax
    div ecx
    push eax
    jmp while
    
potencia:
    mov dword [eh_numero], 0
    pop ecx
    pop eax
    mov dword [base], dword eax
    mov dword [expoent], ecx
    call pwr
    push dword [power]
    jmp while

join_int:
    cmp dword [eh_numero], 0
    je while
    cmp bl, 0                               ;   verifica se os numeros terminaram
    je end_join_int                         ;   pula para o finalizador de numeros inteiros 
    mov dword [base], dword 10
    mov [expoent], bh
    call pwr
    pop eax                                 ;   retira o inteiro da piha
    mul dword [power]
    add dword [inteiro], eax                ;   acumula o inteiro
    inc bh                                  ;   inverte a contagem de bl (correcao de bug da montagem do numero invertido)
    dec bl                                  ;   decrementa o contador de numeros bl
    jmp join_int                            ;   faz o processo novamente

end_join_int:
    push dword [inteiro]                    ;   devolve a pilha o numero inteiro
    mov dword [inteiro], dword 0            ;   zera edx
    mov dword [power], 0
    mov ebx, 0
    jmp while                               ;   volta para o loop principal
    

char2int:
    mov dword [eh_numero], dword 1
    mov ecx, dword [counter] 
    inc bl                                  ;   incrementa contador de digitos no numero
    mov eax, 0                              ;   limpando o registrador eax                              
    mov al, byte [expressao + ecx]          ;   copia numero char para ax
    sub eax, 30h                            ;   subitraindo 30h do char para obter um numero inteiro
    push eax                                ;   coloca o numero convertido na pilha
    jmp while                               ;   volta para o loop
    
    

pwr:
    mov eax, dword [base]
    mov ecx, dword [expoent]
    cmp ecx, 0
    je pretz
p1:
    cmp ecx, 1
    je pret
    mul dword [base]
    dec ecx
    jmp p1
    
pret:
    mov dword [power], eax
    ret

pretz:
    mov dword [power], 1
    ret