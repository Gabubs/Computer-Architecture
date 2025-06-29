#Faça um programa que leia um número inteiro e imprima -1 se o valor for ímpar e 0
#se o valor for par.


.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	andi $9,$8,1
	add $10,$0,-1
	
	mult $9,$10 # se o valor for 0 0x-1=0 se for 1 1x-1=-1
	mflo $9
	
	add $4,$0,$9
	add $2,$0,1
	syscall
