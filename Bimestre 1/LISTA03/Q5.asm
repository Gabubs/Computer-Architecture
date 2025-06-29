# Faça um programa que leia 10 valores e imprima a sua soma.
.text
main:	add $9,$0,10 # N

for:	beq $8,$9, fimfor
	
	add $2,$0,5
	syscall
	add $20,$20,$2
	
	add $8,$8,1
	j for

fimfor:	add $4,$0,$20
	add $2,$0,1
	syscall

	add $2,$0,10
	syscall
	