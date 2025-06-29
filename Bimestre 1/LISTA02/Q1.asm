.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2 #n1
	
	addi $2,$0,5
	syscall
	add $9,$0,$2 #n2
	
	sub $10 $8,$9
	
	srl $11, $10,31 # se n1>n2 $11 = 0, else $11 = 1
	
	beq $11,0,N1Maior
	add $4,$0,$9 #N2 maior
	addi $2,$0,1
	syscall
	j Fimse
	
N1Maior:add $4,$0,$8
	addi $2,$0,1
	syscall	
	
Fimse:	addi $2,$0,10
	syscall
	
