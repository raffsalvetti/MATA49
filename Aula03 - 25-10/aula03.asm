%include "io.inc"

; cf = carry flag
; pf = party flag
; zf = zero flag
; sf = sign flag
; of = overflow flag

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    
;ex1:
    mov al, -5      ;   00000101 ; inverter o numero 5 (em binario)
                    ;   11111010 ; resultado da inversao
                    ;   00000001 ; soma 1 ao inverso de 5 (isso é o complemento de 2)
                    ;   --------
                    ;   11111011 ; 251 em decimal
    sub al, 123     ;   entao a operacao é 251-123=128. 

;ex2:
    mov al, -5      ;   11111011
    sub al, 124     ;   10000100
                    ;  101111111
    
;ex3:
    mov al, -5
    add al, 132
    add al, 1
    ;inc al ; testar com a instrucao inc

;ex4:
    sub al, al
    
;ex5:
    mov al, 127
    add al, 129

    ret