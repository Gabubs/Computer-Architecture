.text
#Questão 5
main:

	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	div $9,$8,100 #div t0/100
	mfhi $10
	div $11,$10,10 #div resto/10
	mfhi $12
	#11 + 12 + 9
	
	add $14,$11,$12
	add $15,$14,$9
	
	add $2,$0,1
	add $4,$0,$15
	syscall
	
	
	
	