#Crie um programa que lê 6 valores inteiros e, em seguida, mostre na tela os valores
#lidos.

.data
.word 0,0,0,0,0,0

.text
main:	lui $10,0x1001

	add $8,$0,6 # n
	add $9,$0,0
for:	beq $8,$9,fimfor
	
	add $2,$0,5
	syscall
	sw $2,0($10)
	add $10,$10,4
	
	add $9,$9,1
	j for
fimfor: lui $10,0x1001
	
	add $9,$0,0
for2:	beq $9,$8,fim

	lw $4,0($10) 
	add $2,$0,1 # souf(a[i])
	syscall
	add $10,$10,4
	
	add $2,$0,11 # souf(" ")
	add $4,$0,' '
	syscall
	
	add $9,$9,1
	j for2	
fim:
	add $2,$0,10
	syscall
