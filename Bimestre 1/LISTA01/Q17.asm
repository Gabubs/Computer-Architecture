.text

main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	add $2,$0,5
	syscall
	add $9,$0,$2
	
	add $10,$8,$9
	add $11,$0,2
	
	div $10,$11
	mflo $20
	
	mfhi $21 #resto
	mul $21,$21,10
	div $21,$11
	mflo $21

	
	add $2,$0,1
	add $4,$0,$20
	syscall
	
	add $2,$0,11
	add $4,$0,44
	syscall
	
	add $2,$0,1
	add $4,$0,$21
	syscall
	