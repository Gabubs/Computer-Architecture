#Faça um programa que solicite ao usuário um número para ser a referência e outro
#para ser a quantidade de valores a ser impresso no caso do programa da Q1. Para a
#mesma resposta, por exemplo, o usuário forneceria a referência 3 e a quantidade 10.
.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2 #nunmero Ref
	
	add $2,$0,5
	syscall
	add $9,$0,$2 # N
	add $9,$9,1 # N+1
	add $10,$0,1 # I
	
for:	beq $10,$9,fim

	add $20,$20,$8
	add $4,$0,$20
	add $2,$0,1
	syscall
	
	add $4,$0,' '
	add $2,$0,11
	syscall
	
	add $10,$10,1
	j for
	
fim:	add $2,$0,10
	syscall
	
	