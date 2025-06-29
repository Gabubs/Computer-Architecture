# Faça uma função para verificar se um número é positivo ou negativo. Sendo que o
# valor de retorno será 1 se positivo, -1 se negativo e 0 se for igual a 0.
.text

main:	addi $2,$0,5
	syscall
	add $4,$0,$2
	
	jal func
	
	add $4,$0,$2
	add $2,$0,1
	syscall
	
	add $2,$0,10
	syscall
	
#=================
#definidor de tipo de numero
#==============
# Entrada: $4
# Saida: $2
# Reg usados: $8
#======================
func:	bne $4,0,difzero
	add $2,$0,$0
	jr $31
	
difzero:	slt $8,$0,$4 # se 0 menorq 4 return 1 senao return 0
	beq $8,0,nega
	add $2,$0,1
	jr $31
	
nega:	add $2,$0,-1
	jr $31