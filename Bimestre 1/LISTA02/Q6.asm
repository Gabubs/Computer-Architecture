# As condições para aposentadoria são: 1) ter, ao menos, 65 anos; OU 2) ter trabalhado 40 anos; OU ter
#pelo menos 60 anos e mais de 35 anos de trabalho.

.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2 # IDADE
	
	add $2,$0,5
	syscall
	add $9,$0,$2 # T de Servico
	
	# ter ao menos 65
	add $20,$0,65
	slt $10,$8,$20 # se $8 menor que 65, $10 = 1, senao $10 = 0
	beq $10,0,pode
	
	# ter trabalhado 40
	add $20,$0,40 
	slt $10,$9,$20 # se $8 menor que 40, $10 = 1, senao $10 = 0
	beq $10,0,pode
	
	# ter 60I e 35T
	add $20,$0,60
	slt $10,$8,$20 # se 8 menor que 60, $10 = 1, senao 10 = 0
	add $20,$0,35
	slt $11,$9,$20
	add $10,$10,$11
	beq $10,0,pode


npode:	add $4,$0, 'N'
	j fim
	
pode:	add $4,$0,'S'

fim:	add $2,$0,11
	syscall
	
	add $2,$0,10
	syscall