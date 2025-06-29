# Faça um programa que leia 1 inteiro entre 100 e 999 e o imprima escrito de trás para
# frente. Exemplo: 384 gera uma saída 483

.text

main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	add $9,$0,10 # 9 = Divisor
	
	div $8,$9
	mfhi $20 #unidade
	mflo $8
	
	div $8,$9
	mfhi $21 # dezena
	mflo $22 #centena

	
	
	
	add $2,$0,1
	add $4,$0,$20
	syscall
	
	add $2,$0,1
	add $4,$0,$21
	syscall
	
	add $2,$0,1
	add $4,$0,$22
	syscall
	add $2,$0,10
	syscall
