%include "io.inc"

section .text

global CMAIN

CMAIN:
    mov             ebp,    esp     ; for correct debugging
    xor             eax,    eax     ; fazendo xor de dois valores iguais resulta em zero. o objetivo é zerar os registradores
    mov             ebx,      0     ; equivalente a "xor eax, eax", move o valor zero para ebx
    mov              ch,      0     ; parte "alta" (h de high) do registrador c(de 8 bits)
    mov              cl,      0     ; parte "baixa" (l de low) do registrador c(de 8 bits)
    mov              cx,    136     ; movendo o valor 136 (1000 1000) para o registrador cx (composto por ch+cl)
    mov             edx,    500     ; movendo o valor 500 para o registrador edx - extended dx ou 16bits(que é a parte extendida) + dh + dl = 32bits
    add             ebx,    edx     ; somando o valor de edx a ebx, equiv a fazer ebx = ebx + edx em C
    PRINT_DEC         2,    ebx     ; macro que imprime em stdout um valor decimal de 2bytes
    NEWLINE                         ; imprime \n
    add             ebx,    edx     ; executando a soma anterior
    PRINT_DEC         2,    ebx
    ret

delay:
