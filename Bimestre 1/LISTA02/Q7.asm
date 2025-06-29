#Faça um programa que leia um ano e informe se esse ano é bissexto.
.text

main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	add $9,$0,4
	div $8,$9
	mfhi $11
	
	slt $20,$0,$11 # se 0 for menor que $11, 1 senao, 0
	beq $20,1,naobis
	
	add $4,$0,'S'
	j fim

naobis:	add $4,$0,'N'
	
fim:	add $2,$0,11
	syscall
	
	add $2,$0,10
	syscall