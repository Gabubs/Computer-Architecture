#Faça um programa que implementa um laço com um teste no início que conte de 0 a
#10 imprimindo esses números, um em cada linha da saída.
.text
main:	addi $8,$0,0 # I
	add $9,$0,11

for:	beq $9,$8,fim
	
	add $4,$0,$8
	add $2,$0,1
	syscall
	# Quebra de linha
	add $4,$0,'\n'
	add $2,$0,11
	syscall
	
	add $8,$8,1
	j for
fim:	
	add $2,$0,10
	syscall
