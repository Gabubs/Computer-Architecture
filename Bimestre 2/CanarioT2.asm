# Teste 2 de criacao de cenario

.text
main:	lui $5,0x1001


#================Funcoes_Cenario=========================	
	jal defFundo
	jal defSapo

#========================================================


	addi $2,$0,10   
	syscall



#=====================DEFFUNDO===========================
defFundo:
	add $8,$0,$5 # lui vem pra ca
	add $9,$0,0 # Indice(I)

	add $10, $0, 7296 # Tamanho da tela
	add $25,$0, 4736 # Pouco mais da metade do cenario
	
	#Ocupacao dos Atributos
	# Altere para reduzir/aumentar as bordas laterais
	add $11, $0, 10	 #começo do rio na linha
	add $12, $0, 118 #fim do rio na linha
	
Laco_BG: # for (i=0;i<$10;) 
	beq $10,$9,Fim_BG
	
	 
	# a partir da metade do cenario, printa rua invez de agua
	
	sge $13, $9, $11 # if ($9 >= $11) $13 = 1.
	sle $14, $9, $12 # if ($9 <= $12) $14 = 1.
	and $15, $13, $14 # $15 = and($13, $14)
	bne $15, 1, bordas # se $15 = 1 vai pintar as bordas
 	ble $25,$9,ruas

agua:	
	add $4,$0,0x00187 # Agua(Azul)
	sw $4,0($8) # Valor[i]
	add $9,$9,1 # i++
	add $8,$8,4 # Proximo valor
	beq $9,$12,Quebrar_Linha	# Quebra a linha caso $9 =111(tamanho max)
	j Laco_BG

bordas:	
	add $4,$0, 0x507C38 # Bordas(verde)
	sw $4,0($8) # Valor[i]
	add $9,$9,1 # i++
	add $8,$8,4 # Proximo_valor[i}
	j Laco_BG

ruas:	
	bge $9,5248,estrada # Linhas pra calcada
	# a pista tem 12"pixels" entao teria espaço para 3 carros
	#tamanho das calcadas = 4 para caber o sapo
calcada:		
    	add $4,$0,0xF0EA48 # Cor da calcada(Amarelo)
	sw $4,0($8) # Valor[i]
	add $9,$9,1 # i++
	add $8,$8,4 # Proximo valor
	beq $9,$12,Quebrar_Linha	# Quebra a linha caso $9 =111(tamanho max)
	j Laco_BG
     
estrada:
	# INTERLIGA rua com calcada para fazer a calcada de baixo
	bge $9,6784,calcada 
	#---------------
    	add $4,$0,0x000000 # Cor da estrada
	sw $4,0($8) # Valor[i]
	add $9,$9,1 # i++
	add $8,$8,4 # Proximo valor
	beq $9,$12,Quebrar_Linha	# Quebra a linha caso $9 =111(tamanho max)
	
	j Laco_BG

Quebrar_Linha:
	add $11,$11,128
	add $12,$12,128
	j Laco_BG    
	
Fim_BG:
#=====================Linhas_Nos_Extremos===========================

LinhasExtremos:
	add $8,$0,$5 # lui vem pra ca
	add $9,$0,0 # Indice(I)
	add $4,$0,0x507C38 # Verde

	add $10,$0,8192 # Tamanho da tela
	add $11,$0,384 # (128*Qtd linhas)
	add $12,$0,7296 # Começo da borda de baixo

Laco_LinhasExtremos_Topo:

	beq $9,$11,LinhasExtremos_Fundo
	
	sw $4,0($8) # Valor[i]
	add $9,$9,1 # i++
	add $8,$8,4 # Proximo valor
	
	j Laco_LinhasExtremos_Topo
	
LinhasExtremos_Fundo:
	mul $13, $12, 4    # Calculo em bytes(4b = 1GU) 
	add $8, $5, $13
	add $9,$9, 6912
Laco_LinhasExtremos_Fundo:
	beq $9,$10,Fim_LE
	sw $4,0($8) # Valor[i]
	add $9,$9,1 # i++
	add $8,$8,4 # Proximo valor
	
	j Laco_LinhasExtremos_Fundo
Fim_LE:	
	jr $31


#=============================Sapo=================================
defSapo:	add $8,$0,$5
	add $4,$0,0x2A9F00 # cor temp do sapo
	add $9, $0, 64
	mul $10,$9,428 # e 428
	
	add $8,$8,$10

	
	sw $4,0($8) # PIXEIS PRIMEIROS
	add $8,$8,8
	sw $4,0($8)
	add $8,$8,8
	sw $4,0($8)
	
	add $8,$8,500 # Qubra de linha
	
	sw $4,0($8) # PIXEIS SEGUNDOS
	add $8,$8,4
	sw $4,0($8)
	add $8,$8,4 
	sw $4,0($8)
	
	add $8,$8,500 # Quebra de linha
	
	sw $4,0($8) # PIXEIS TERCEIROS
	add $8,$8,8
	sw $4,0($8)
	add $8,$8,8
	sw $4,0($8)

	add $8,$8,496 # Quebra de linha
	
	sw $4,0($8)
	add $8,$8,16
	sw $4,0($8)
jr $31

