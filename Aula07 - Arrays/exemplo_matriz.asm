%include "io.inc"


section .data
n_rows	equ	5
n_cols	equ	3
n_row_bytes	equ	n_cols * 2
class_m		dw	90,89,99
		dw	79,66,70
		dw	70,60,77
		dw	60,55,68
		dw	51,59,57
sum_msg		db	"blabla: ",0


section .text
global CMAIN

    ;;  esse programa calcula a soma de todos os inteiros 
    ;;  que estao na ultima coluna da matriz

CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, n_rows
    xor eax, eax
    xor ebx, ebx
    mov esi, n_cols - 1

sloop:
    add ax, [class_m + ebx + esi * 2]
    add ebx, n_row_bytes
    loop sloop

PRINT_STRING sum_msg
PRINT_DEC 2, ax
ret

    


