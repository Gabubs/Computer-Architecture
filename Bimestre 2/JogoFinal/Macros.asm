.macro pinta_pixel (%x, %y)
sll $8,%x,2
sll $9,%y,9
add $10,$8,$9
add $11,$10,$s0
sw $5,0($11) # Cor = $5
.end_macro

.macro verificaXY (%x1, %y1, %x2, %y2 )
bne %x1, %x2, diferentes
bne %y1, %y2, diferentes
li $t9, 1
diferentes:
.end_macro

.macro delay
addi $2, $0, 32
addi $4,$0,10 # em ms
syscall   
.end_macro

.macro delayM
addi $2, $0, 32
addi $4,$0,300 # em ms
syscall   
.end_macro

.macro desenha(%cor,%posicao,%pixels)
lw $5,%cor
la $6,%posicao
la $7,%pixels
loop_desenha:
	lw $8,0($7)
	lw $9,4($7)
	beq $8,99,fim_desenha
	
	lw $10,0($6)
	lw $11,4($6)
	
	add $10,$10,$8
	add $11,$11,$9
	
	blt $10, 10, auxiliar_desenha
    	bgt $10, 117, auxiliar_desenha

	
	pinta_pixel($10,$11)
auxiliar_desenha:
    add $7, $7, 8
    j loop_desenha
fim_desenha:
nop
.end_macro

.macro recupera_cor(%y)

blt %y 37 azul
blt %y 41 amarelo
blt %y 53 preto

amarelo:	add $5,$0,0xF0EA48
	j fim_rec_cor
azul:	add $5,$0, 0x00187
	j fim_rec_cor
preto:	add $5,$0,0x00
fim_rec_cor:
.end_macro

.macro apaga (%posicao, %pixels)
la $6, %posicao
la $7, %pixels
apaga_loop:
    lw $8, 0($7)
    lw $9, 4($7)
    beq $8, 99, fim_apaga_loop

    lw $10, 0($6)
    lw $11, 4($6)

    add $10, $10, $8
    add $11, $11, $9

    blt $10, 10, auxiliar_apaga
    bgt $10, 117, auxiliar_apaga

    recupera_cor($11)
    pinta_pixel ($10, $11)
auxiliar_apaga:
    add $7, $7, 8
    j apaga_loop
fim_apaga_loop:
.end_macro

.macro esquerda(%posicao)
lw $8, %posicao
addi $8,$8,-1
sw $8, %posicao
.end_macro

.macro direita(%posicao)
lw $8, %posicao
addi $8,$8,1
sw $8, %posicao
.end_macro

.macro cima(%posicao)
lw $8, %posicao+4
addi $8,$8,-1
sw $8, %posicao+4
.end_macro

.macro baixo(%posicao)
lw $8, %posicao+4
addi $8,$8,1
sw $8, %posicao+4
.end_macro

.macro move_esquerda(%cor,%posicao,%pixels)
apaga (%posicao,%pixels)
esquerda(%posicao)
respawn(%posicao)
desenha (%cor,%posicao,%pixels)
.end_macro

.macro move_direita(%cor,%posicao,%pixels)
apaga (%posicao,%pixels)
direita(%posicao)
respawn(%posicao)
desenha (%cor,%posicao,%pixels)
.end_macro

.macro move_cima(%cor,%posicao,%pixels)
apaga (%posicao,%pixels)
cima(%posicao)
desenha (%cor,%posicao,%pixels)
.end_macro

.macro move_baixo(%cor,%posicao,%pixels)
lw $8,%posicao+4
bgt $8,52,nao_move_baixo
apaga (%posicao,%pixels)
baixo(%posicao)
desenha (%cor,%posicao,%pixels)
nao_move_baixo:
.end_macro

.macro game_over
add $2,$0,10
syscall
.end_macro

.macro respawn(%posicao)
lw $8,%posicao
blt $8,5,reset_posicao_direita
bgt $8,123, reset_posicao_esquerda
j fim_respawn

reset_posicao_esquerda:
add $8,$0,5
sw $8,%posicao
j fim_respawn

reset_posicao_direita:
add $8,$0,123
sw $8,%posicao

fim_respawn:
.end_macro


.macro check_colisao (%n1_posicao, %n1_pixels, %n2_posicao, %n2_pixels)
la $4, %n1_posicao
la $5, %n1_pixels
la $6, %n2_posicao
li $t9, 0
LEColisao:
	lw $8, 0($5)
	lw $9, 4($5)
	
	beq $8, 99, fLEColisao
	la $7, %n2_pixels
	LIColisao:
		lw $10, 0($7)
		lw $11, 4($7)
		
		beq $10, 99, fLIColisao
		
		lw $12, 0($4)
		lw $13, 4($4)
		lw $14, 0($6)
		lw $15, 4($6)
		add $12, $12, $8
		add $13, $13, $9
		add $14, $14, $10
		add $15, $15, $11
		
		verificaXY ($12, $13, $14, $15)
		
		addi $7, $7, 8
		j LIColisao
	fLIColisao:
		addi $5, $5, 8
		j LEColisao
fLEColisao:
.end_macro

.macro check_movimento(%cor,%posicao,%pixels)
apaga (sapo_posicao,sapo_pixels)
lw $8,0($s1)
beq $8,$0,fim_macro_teclado
lw $9,4($s1)

addi $10, $0,'w'
beq $10,$9,teclado_w
addi $10,$0,'a'
beq $10,$9,teclado_a
addi $10,$0,'s'
beq $10,$9,teclado_s
addi $10,$0,'d'
beq $10,$9,teclado_d

teclado_w:
	move_cima(%cor,%posicao,%pixels)
	move_cima(%cor,%posicao,%pixels)
	move_cima(%cor,%posicao,%pixels)
	move_cima(%cor,%posicao,%pixels)
	j fim_macro_teclado
teclado_a:
	move_esquerda(%cor,%posicao,%pixels)
	move_esquerda(%cor,%posicao,%pixels)
	move_esquerda(%cor,%posicao,%pixels)
	move_esquerda(%cor,%posicao,%pixels)
	j fim_macro_teclado
teclado_s:

	move_baixo(%cor,%posicao,%pixels)
	move_baixo(%cor,%posicao,%pixels)
	move_baixo(%cor,%posicao,%pixels)
	move_baixo(%cor,%posicao,%pixels)
	j fim_macro_teclado
teclado_d:

	move_direita(%cor,%posicao,%pixels)
	move_direita(%cor,%posicao,%pixels)
	move_direita(%cor,%posicao,%pixels)
	move_direita(%cor,%posicao,%pixels)
	j fim_macro_teclado

fim_macro_teclado:
desenha(%cor,%posicao,%pixels)
.end_macro

.macro mover_juntos(%posicao_sapo,%posicao2,%vezes)
lw $8, %posicao2
lw $9, %posicao_sapo
li $10,%vezes
li $11,0 #check de morte

#verifica X
addi $8,$8,-5
blt $9,$8,fim_macro_mover_juntos
addi $8,$8,12
bgt $9,$8,fim_macro_mover_juntos
#verificar Y
lw $8, %posicao2+4
lw $9,%posicao_sapo+4

add $11,$11,1
bne $9,$8,fim_macro_mover_juntos
add $11,$11,-1

beq $10,4,mover_duas_vezes
	
	move_esquerda(sapo_cor,sapo_posicao,sapo_pixels)
	
	j fim_macro_mover_juntos
	
mover_duas_vezes:
	move_esquerda(sapo_cor,sapo_posicao,sapo_pixels)
	move_esquerda(sapo_cor,sapo_posicao,sapo_pixels)
	

fim_macro_mover_juntos:
.end_macro

.macro sapo_colidiu (%npc_posicao, %npc_pixels)
check_colisao(sapo_posicao, sapo_pixels, %npc_posicao, %npc_pixels)
beq $t9, $0, fim_colisao_sapo
apaga(sapo_posicao,sapo_pixels)
desenha (sapo_cor,sapo_posicao,sapo_amassado_pixels)
game_over
fim_colisao_sapo:
.end_macro

.macro entrou_no_rio
lw $8,sapo_posicao+4
bgt $8,33,nao_morreu

check_colisao(sapo_posicao, sapo_pixels, tronco_posicao, tronco_pixels)
bne $t9,0,nao_morreu
check_colisao(sapo_posicao, sapo_pixels, tronco_posicao2, tronco_pixels)
bne $t9,0,nao_morreu
check_colisao(sapo_posicao, sapo_pixels, tronco_posicao3, tronco_pixels)
bne $t9,0,nao_morreu
check_colisao(sapo_posicao, sapo_pixels, tronco_posicao4, tronco_pixels)
bne $t9,0,nao_morreu

game_over
nao_morreu:
.end_macro

.macro check_vitoria
lw $8,sapo_posicao+4
bgt $8,28,nao_afogou
check_colisao(sapo_posicao,sapo_pixels,vitoria_posicao,vitoria_pixels)
bne $t9,0,nao_afogou
check_colisao(sapo_posicao,sapo_pixels,vitoria_posicao2,vitoria_pixels)
bne $t9,0,nao_afogou
check_colisao(sapo_posicao,sapo_pixels,vitoria_posicao3,vitoria_pixels)
bne $t9,0,nao_afogou
check_colisao(sapo_posicao,sapo_pixels,vitoria_posicao4,vitoria_pixels)
bne $t9,0,nao_afogou
check_colisao(sapo_posicao,sapo_pixels,vitoria_posicao5,vitoria_pixels)
bne $t9,0,nao_afogou

apaga(sapo_posicao,sapo_pixels)
desenha (sapo_cor,sapo_posicao,sapo_amassado_pixels)
game_over

venceu:
game_over
j fim_jogoporra

nao_afogou:
ble $8,28,venceu
fim_jogoporra:
.end_macro

.macro desenha_fim
desenha (vitoria_cor,vitoria_posicao,vitoria_pixels)
desenha (vitoria_cor,vitoria_posicao2,vitoria_pixels)
desenha (vitoria_cor,vitoria_posicao3,vitoria_pixels)
desenha (vitoria_cor,vitoria_posicao4,vitoria_pixels)
desenha (vitoria_cor,vitoria_posicao5,vitoria_pixels)
.end_macro
