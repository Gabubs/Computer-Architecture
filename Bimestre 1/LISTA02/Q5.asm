.text

main:	addi $2,$0,5
	syscall
	add $8,$0,$2 #nota1
	
	addi $2,$0,5
	syscall
	add $9,$0,$2 #nota 2
	
	addi $2,$0,5
	syscall
	add $10,$0,$2 #nota 3

	sll $20,$9,1
	mul $21,$10,3
	add $22,$20,$21
	add $22,$22,$8
	add $11,$0,6 # divsao
	div $22,$11
	mflo $23
	#media
	add $4,$0,$23
	add $2,$0,1
	syscall
	
	add $4,$0,'\n'
	add $2,$0,11
	syscall
	
	add $24,$0,60 # se 24>23 reprovado
	
	slt $25,$23,$24 # 23<24 $25 = 1, 24>23 25 = 0
	
	beq $25,1,Repro
	add $4,$0,'A'
	j fim

Repro:	add $4,$0,'R'

fim:
	syscall
	
	add $2,$0,10
	syscall