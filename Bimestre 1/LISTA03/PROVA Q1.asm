.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	beq $8,0,fim
	
	add $2,$0,5
	syscall
	add $20,$0,$2
	add $9,$9,1
	
for:	beq $8,$9,fim

	add $2,$0,5
	syscall
	slt $10,$20,$2
	beq $10,0,maior
	add $20,$0,$2
	add $21,$0,0
maior:	add $19,$0,$2
	beq $19,$20,repetido
	j for
repetido: add $21,$21,1
	j for
fim:	add $2,$0,1
	add $4,$0,$20
	syscall
	add $4,$0,$21
	syscall