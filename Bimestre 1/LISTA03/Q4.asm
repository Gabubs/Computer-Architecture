#Faça um programa que leia do usuário um intervalo fechado e imprima os números
#pares desse intervalo (inclusive os limites).
.text
main:	add $2,$0,5
	syscall
	add $8,$0,$2 # I
	
	add $2,$0,5
	syscall 
	add $9,$0,$2 # N
	add $9,$9,1	
	
	
for:	beq $9,$8,fim
	
	and $10,$8,1
	beq $10,1,impar # check se é par
	
	add $4,$0,$8
	add $2,$0,1
	syscall
	
	
	# Espaçamento
	add $4,$0,' '
	add $2,$0,11
	syscall
	
impar:	add $8,$8,1
	j for
fim:	
	add $2,$0,10
	syscall
