.text
#Questão 4
main:

	addi $2,$0,5 #input
	syscall
	add $8,$0,$2 # primeiro valor
	
	addi $2,$0,5 
	syscall
	add $9,$0,$2 # segundo valor
	
	add $10,$9,$8 # Soma dos 2 valores
	
	divu $11,$10,2 # Divisão dos 2 valores
	
	add $4, $0, $11   
	addi $2, $0, 1      
	syscall
