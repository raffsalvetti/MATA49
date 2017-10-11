%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov al, 0
    mov ah, 0
    mov al, 1
    mov ebx, 0FFFFFFFFh
    movzx bx, al
    ret