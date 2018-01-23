%include "io.inc"

section .data
    string      db      "socorrammesubinoonibusemmarrocos"
    strlen      equ      $-string

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    mov ecx, strlen
while:
    dec ecx
    mov ah, byte [string + ebx]
    cmp ah, byte [string + ecx]
    jne npal
    inc ebx
    cmp ecx, 0
    jne while
    jmp pal
    
npal:
    PRINT_STRING "NAO "
pal:
    PRINT_STRING "EH PALINDROMO!"
    ret    