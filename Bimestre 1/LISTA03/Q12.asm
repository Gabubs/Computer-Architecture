# Faça um programa que imprima os n primeiros números da série de Fibonacci, sendo n
# fornecido pelo usuário.
.text
main:	add $2,$0,5
	syscall
	add $8,$0,$2
	add $10,$0,1
	add $11,$0,1
	
for:	beq $20,$8,fimfor
	
	
	
	add $2,$0,1 # Printa 10 
	add $4,$0,$10 
	syscall # Espaço
	add $2,$0,11
	add $4,$0,' '
	syscall
	
	add $12,$10,$11
	add $10,$0,$11
	add $11,$0,$12
		

	add $20,$20,1
	j for
fimfor:
