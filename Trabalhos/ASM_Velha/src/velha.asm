[bits 32]

section .bss
	data_tabuleiro				resb	9
	data_jogador				resb	1
	data_jogada					resb	1
	data_soma_ponto				resd	1
	
section .data
	cst_vitoria					dd	7, 56, 704, 73, 146, 548, 529, 84
	qtd_cst_vitoria				EQU	($-cst_vitoria)/4
	str_jog_possiveis			db	"QWEASDZXC"
	qtd_jog_possiveis			EQU	$-str_jog_possiveis
	str_instrucoes	 			db	"Use as teclas Q, W, E, A, S, D, Z, X, C para jogar",10,0
	fmt_jogador	 				db	"Jogador: %c",10,0
	fmt_tabuleiro	 			db	"+-----------+",10
		 						db	"| %c | %c | %c |",10
						 		db	"+-----------+",10
						 		db	"| %c | %c | %c |",10
						 		db	"+-----------+",10
						 		db	"| %c | %c | %c |",10
						 		db	"+-----------+",10,0
	str_jogada					db	"Entre com a jogada: ",0
	fmt_scanf					db	" %c*",0
	str_erro_jogada				db	"Nao eh possivel fazer essa jogada!",10,0
	fmt_resultado				db	"Vitoria do jogador %c",10,0
	str_velha					db	"Deu velha!!",10,0
	str_fim_jogo				db	"Jogar novamente? [S/N]",10,0
	cmd_limpar_tela 			db	"cls",0
	
section .text
extern _printf, _system, _scanf
global _main

_main:
	xor eax, eax
	xor ecx, ecx
	call init
	ret

init:
	mov byte [data_jogador], 'X'
	mov dword [data_soma_ponto], 0
	cmp ecx, 9
	je gameloop
	mov al, 20h
	mov byte [data_tabuleiro + ecx], al
	inc ecx
	jmp init

gameloop:
	call clear
	call print_menu
	call msg_player
	call draw
	call read_input

	call check_input
	cmp al, 0
	jne gameloop

	call do_play
	call check_win

	call switch_player
	jmp gameloop

check_win:
	xor ecx, ecx
	mov al, byte [data_jogada]
while_check_win:
	cmp al, byte [data_jogador + ecx]
	je add_points
	inc ecx
	cmp ecx, qtd_jog_possiveis
	jne while_do_play
	jmp check_points
add_points:
	mov eax, 0001h
	shl eax, cl
	add dword [data_soma_ponto], eax
	jmp while_check_win
check_points:
	xor eax, eax
	xor ecx, ecx
	mov eax, dword [data_soma_ponto]
while_check_points:
	cmp eax, dword [cst_vitoria + ecx]
	je check_points_end
	inc ecx
	cmp ecx, qtd_cst_vitoria
	jne while_check_points
	ret
check_points_end:
	movzx eax, byte [data_jogador]
	push eax
	push fmt_resultado
	call _printf
	push str_fim_jogo
	call _printf
	add esp, 12
	ret

do_play:
	xor ecx, ecx
	mov al, byte [data_jogada]
while_do_play:
	cmp al, byte [str_jog_possiveis + ecx]
	je end_do_play
	inc ecx
	cmp ecx, qtd_jog_possiveis
	jne while_do_play
	ret
end_do_play:
	mov al, byte [data_jogador]
	mov byte [data_tabuleiro + ecx], al
	ret

check_input:
	xor ecx, ecx
	mov al, byte [data_jogada]
while_check_input:
	cmp al, byte [str_jog_possiveis + ecx]
	je check_input_end
	inc ecx
	cmp ecx, qtd_jog_possiveis
	jne while_check_input
	ret
check_input_end:
	xor al, al
	ret

switch_player:
	mov al, byte [data_jogador]
	cmp al, 4Fh
	je p2
	mov byte [data_jogador], 4Fh
	ret
p2:	mov byte [data_jogador], 58h
	ret

draw:
	mov ecx, 9
drawloop:
	dec ecx
	movzx eax, byte [data_tabuleiro + ecx]
	push eax
	cmp ecx, 0
	jne drawloop
	push fmt_tabuleiro
	call _printf
	add esp, 40
	ret

read_input:
	push str_jogada
	call _printf
	pop ebx
	push data_jogada
	push fmt_scanf
	call _scanf
	add esp, 8
	ret

print_menu:
	push str_instrucoes
	call _printf
	add esp, 4
	ret

msg_player:
	movzx eax, byte [data_jogador]
	push eax
	push fmt_jogador
	call _printf
	add esp, 8
	ret

clear:
	push cmd_limpar_tela
	call _system
	add esp, 4
	ret
