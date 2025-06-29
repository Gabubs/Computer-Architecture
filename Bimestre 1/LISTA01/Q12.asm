# Faça um programa que calcule uma média ponderada de três números inteiros, com
# pesos 3, 9 e 15, sem usar a operação de multiplicação.
# Q12

.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	addi $2,$0,5
	syscall
	add $9,$0,$2
		
	addi $2,$0,5
	syscall 
	add $10,$0,$2
	
	sll $20,$8,2 # 2²=4
	sub $20,$20,$8 # 4-1=3
	
	sll $21,$9,3
	add $21,$21,$9
	
	sll $22,$10,4
	sub $22,$22,$10
	
	add $23,$22,$21
	add $23,$23,$20
	add $11,$0,27
	
	div $23,$11
	mflo $23
	
	add $2,$0,1
	add $4,$0,$23
	syscall
