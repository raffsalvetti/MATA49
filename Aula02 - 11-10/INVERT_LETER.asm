%include "io.inc"
section .data

end     db  "THE END!",0
input   db  "O-rAtO_rOeU+a=rOuPa$DO@REI!DE#ROMA",0    

section .text
global CMAIN
CMAIN:
    mov ebp, esp    ; for correct debugging
    xor ecx, ecx    ;   zerando ecx
    mov ecx,  -1    ;   contador de inicio da string
    mov ebx, input
    jmp repeat
    
repeat:
    inc ecx
    cmp ecx, 34              ;   tamaho da string, se for maior sai
    je exit      
        
    cmp byte [ebx + ecx], 65
    jl print
    cmp byte [ebx + ecx], 91
    jl tolower
    cmp byte [ebx + ecx], 97
    jl print
    cmp byte [ebx + ecx], 123
    jl toupper
    
    jmp print
    
tolower:
    mov eax, [ebx + ecx]
    add eax, 32
    PRINT_CHAR eax
    jmp repeat

toupper:
    mov eax, [ebx + ecx]
    sub eax, 32
    PRINT_CHAR eax
    jmp repeat
    
print:
    PRINT_CHAR [ebx + ecx]
    jmp repeat

exit:
    NEWLINE
    PRINT_STRING end
    ret