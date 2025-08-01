.include "Macros.asm"

.data 0x10000000
carro_cor: .word 0xFF00FF
carro_cor2: .word 0xFF
carro_posicao: .word 64, 41
carro_posicao2: .word 100, 49
carro_pixels:
.word -3 0 
.word -2 0
.word 0 0
.word 1 0	
.word 2 0
.word 3 0
.word 0 1
.word 1 1
.word 2 1
.word 3 1
.word 4 1
.word -1 1
.word -2 1
.word -3 1
.word -4 1
.word 0 2
.word 1 2
.word 2 2
.word 3 2
.word 4 2
.word -1 2
.word -2 2
.word -3 2
.word -4 2
.word 0 3
.word 1 3
.word 2 3
.word 3 3
.word -2 3
.word -3 3

.word 99 99 # isso � o fim

caminhao_cor: .word 0xFFFFFF
caminhao_posicao: .word 100, 45
caminhao_pixels:
.word -3 0 
.word -2 0
.word 0 0
.word 1 0	
.word 2 0
.word 3 0
.word 4 0
.word 0 1
.word 1 1
.word 2 1
.word 3 1
.word 4 1
.word -1 1
.word -2 1
.word -3 1
.word -4 1
.word 0 2
.word 1 2
.word 2 2
.word 3 2
.word 4 2
.word -1 2
.word -2 2
.word -3 2
.word -4 2
.word 0 3
.word 1 3
.word 2 3
.word 3 3
.word 4 3
.word -2 3
.word -3 3
.word 99 99 # isso � o fim

tronco_cor: .word 0x8B4513
tronco_posicao: .word 105, 33
tronco_posicao2: .word 20,29
tronco_posicao3: .word 74,29
tronco_posicao4: .word 40,33
tronco_pixels:
.word -7 0
.word -6 0
.word -5 0
.word -4 0
.word -3 0
.word -2 0
.word -1 0
.word 0 0
.word 1 0
.word 2 0
.word 3 0
.word 4 0
.word 5 0
.word 6 0
.word 7 0

.word -7 1
.word -6 1
.word -5 1
.word -4 1
.word -3 1
.word -2 1
.word -1 1
.word 0 1
.word 1 1
.word 2 1
.word 3 1
.word 4 1
.word 5 1
.word 6 1
.word 7 1

.word -7 2
.word -6 2
.word -5 2
.word -4 2
.word -3 2
.word -2 2
.word -1 2
.word 0 2
.word 1 2
.word 2 2
.word 3 2
.word 4 2
.word 5 2
.word 6 2
.word 7 2

.word -7 3
.word -6 3
.word -5 3
.word -4 3
.word -3 3
.word -2 3
.word -1 3
.word 0 3
.word 1 3
.word 2 3
.word 3 3
.word 4 3
.word 5 3
.word 6 3
.word 7 3
.word 99 99

sapo_cor: .word 0x2A9F00
sapo_posicao: .word 64,53
sapo_pixels:
.word -2 0
.word 0 0
.word 2 0

.word -1 1
.word 0 1
.word 1 1

.word -2 2
.word 0 2
.word 2 2

.word -2 3
.word 2 3

.word 99  99

vitoria_cor: .word 0x2F4538
vitoria_posicao: .word 64,25
vitoria_posicao2: .word 56,25
vitoria_posicao3: .word 72,25
vitoria_posicao4: .word 23,25
vitoria_posicao5: .word 104,25
vitoria_pixels:
.word -2 0
.word -1 0
.word 0 0
.word 1 0
.word 2 0

.word -3 1
.word -2 1
.word -1 1
.word 0 1
.word 1 1
.word 2 1
.word 3 1

.word -3 2
.word -2 2
.word -1 2
.word 0 2
.word 1 2
.word 2 2
.word 3 2

.word -2 3
.word -1 3
.word 0 3
.word 1 3
.word 2 3

.word 99 99

sapo_amassado_pixels:

.word -3 0
.word -1 0
.word 0 0
.word 1 0
.word 3 0

.word -2 1
.word -1 1
.word 0 1
.word 1 1
.word 2 1

.word -2 2
.word -1 2
.word 0 2
.word 1 2
.word 2 2

.word -2 3
.word 2 3

.word -3 4
.word 3 4

.word 99 99


.text
.include "Cenario.asm"
main:	lui $s0, 0x1001
	lui $s1, 0xffff
	desenha (sapo_cor,sapo_posicao,sapo_pixels)

	
#===================Mover===================
Movimentos:
	desenha (sapo_cor,sapo_posicao,sapo_pixels)
	delay
	check_vitoria
	entrou_no_rio

#==================PISTA=====================


	sapo_colidiu (carro_posicao,carro_pixels)
	move_esquerda (carro_cor,carro_posicao,carro_pixels)
	move_esquerda (carro_cor,carro_posicao,carro_pixels)
	
	sapo_colidiu (carro_posicao2,carro_pixels)	
	move_direita (carro_cor2,carro_posicao2,carro_pixels)
	move_direita (carro_cor2,carro_posicao2,carro_pixels)
	move_direita (carro_cor2,carro_posicao2,carro_pixels)

	sapo_colidiu (caminhao_posicao,carro_pixels)	
	move_esquerda (caminhao_cor,caminhao_posicao,caminhao_pixels)
	move_esquerda (caminhao_cor,caminhao_posicao,caminhao_pixels)

	
#=================RIO=======================
	mover_juntos(sapo_posicao,tronco_posicao,4)
	move_esquerda (tronco_cor,tronco_posicao,tronco_pixels)
	move_esquerda (tronco_cor,tronco_posicao,tronco_pixels)

	

	move_esquerda (tronco_cor,tronco_posicao4,tronco_pixels)
	move_esquerda (tronco_cor,tronco_posicao4,tronco_pixels)
	
	mover_juntos(sapo_posicao,tronco_posicao2,2)
	move_esquerda (tronco_cor,tronco_posicao2,tronco_pixels)

	
	mover_juntos(sapo_posicao,tronco_posicao3,2)
	move_esquerda (tronco_cor,tronco_posicao3,tronco_pixels)

	
	desenha_fim
	check_movimento(sapo_cor,sapo_posicao,sapo_pixels)
	
j Movimentos
