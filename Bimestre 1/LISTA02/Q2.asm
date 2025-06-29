#Faça um programa para ler um número inteiro. Se o número for positivo, imprima o
#dobro do número, se for negativo, imprima o quadrado do número.
.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2
	
	srl $9,$8,31
	
	beq $9,1,Nega #if( 31-bit de $8 = 1, negativo )
	add $11,$8,$8
	j fimse
	
Nega:	mul $11,$8,$8

fimse:	add $4,$0,$11
	addi $2,$0,1
	syscall
	
	addi $2,$0,10
	syscall
