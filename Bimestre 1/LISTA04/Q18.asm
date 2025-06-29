# Escreva uma função que recebe um inteiro n e imprime o Triângulo de Floyd de n
# linhas. Ex.: n = 6
.text

main:	add $2,$0,5
	syscall
	add $4,$0,$2
	jal Floyd

	add $2,$0,10
	syscall
	# EU CONSIDEREI QUE ESSA E UMA FUNCAO VOID JA QUE ELA NAO PRDECISA DE RETORNO(do jeito que eu fiz)
	
#===================
#triangulo
#===================
#Entrada: $2
#Saida: VOID
# Usados: $8,$9

Floyd:	add $8,$4,1

	add $11,$0,1 #numero printado
	add $9,$0,1
	
for:	beq $9,$8,fimfor

	for2:	beq $10,$9,fimfor2
		add $10,$10,1
		add $12,$0,0
	repetir:
		add $12,$12,1
		add $2,$0,1
		add $4,$0,$11
		syscall
		add $11,$11,1
		add $2,$0,11
		add $4,$0,' '
		syscall
		bne $10,$12,repetir
		j for2
	fimfor2:
	
	add $2,$0,11
	add $4,$0,'\n'
	syscall
		
	add $9,$9,1
	j for
fimfor:
	jr $31