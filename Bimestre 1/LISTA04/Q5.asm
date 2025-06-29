#Faça uma função para verificar se um número é um quadrado perfeito. Um quadrado
#perfeito é um número inteiro não negativo que pode ser expresso como o quadrado
#de outro número inteiro. Ex: 1, 4, 9...
.text
main:	addi $2,$0,5
	syscall
	add $4,$0,$2 # 4 = n
	jal func
	
	add $4,$0,$2
	add $2,$0,11
	syscall
	
	add $2,$0,10
	syscall
	
#========================================
#checar quadrado perfeito
#=====================================
# Entrada: $4
# Saida: $2
# Usados: $8,$9,$10

func:	add $8,$0,$4 # $8 = n
	add $9,$0,1 # $9 = i
	beq $8,$9,igual
	
for:	beq $8,$9,diferente
		
	mul $10,$9,$9
	beq $10,$8,igual
	add $9,$9,1
	j for
	
igual:	add $2,$0,'S'
	jr $31
diferente:
	add $2,$0,'N'	
	jr $31