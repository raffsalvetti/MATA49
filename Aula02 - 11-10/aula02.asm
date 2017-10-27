%include "io.inc"
section .data
    string  db  "MAS QUE RAIVA RPZ!",0
    endstring db "THE END!",0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, 18
    mov ebx, string
    jmp print
    ; 00000000 00000000
print:
    dec ecx
    jz end
    PRINT_CHAR [ebx + ecx]
    mov ax, [ebx + ecx]
    PRINT_DEC 1, ax
    jmp print
    
end:
    NEWLINE
    PRINT_STRING endstring
    ret