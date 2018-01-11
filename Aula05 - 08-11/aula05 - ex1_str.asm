%include "io.inc"

;	Faça um programa que compare duas strings e
;	indique se elas são iguais
;	implementacao usando funcoes de string

section .data
    str1        db  "teste1",0
    str1_len    EQU $-str1
    str2        db  "teste1",0
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    mov esi, str1			;	ESI = Extended Source Index
    mov edi, str2			;	EDI = Extended Destination Index
    mov ecx, str1_len
    repe cmpsb				;	repe repete o comando cmpsb enquanto FZ for definido
							;	cmpsb compara as strings em ESI e EDI byte a byte e atualiza FZ(flag zero) de acordo com o resutado
							;	DS indica a posicao atual de (E)SI
							;	ES indica a posicao atual de (E)DI
    cmp ecx, 0 				; 	se o contador chegou ao final, significa que as strings sao iguais
    je  igual
    
diferente:
    PRINT_STRING "diferentes" 
    jmp end    
    
igual:    
    PRINT_STRING "iguais" 
end:
    ret