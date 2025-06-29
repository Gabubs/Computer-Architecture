#Q15) Faça um programa que leia um número inteiro 
#     entre 0 e 9999 e imprima esse
#     número com 4 caracteres, 
#     substituindo o algarismo 0 por espaço.
#     Exemplo.: 304 gera uma saída 3 4

.text
main:	addi $2, $0, 5
	syscall
	add $20, $0, $2
	div $8, $20, 1000
	mfhi $20

	not $9, $8		#logica
	addi $10, $9, 1		#logica
	srl $11, $10, 31	#logica
	
	add $12, $8, 32		#logica
	mul $13, $11, 16	#logica
	
	add $4, $13, $12	#logica
	addi $2, $0, 11
	syscall
	
	div $8, $20, 100
	mfhi $20
	
	not $9, $8		#logica
	addi $10, $9, 1		#logica
	srl $11, $10, 31	#logica
	
	add $12, $8, 32		#logica
	mul $13, $11, 16	#logica
	
	add $4, $13, $12	#logica
	addi $2, $0, 11
	syscall
	
	div $8, $20, 10
	mfhi $20
	
	not $9, $8		#logica
	addi $10, $9, 1		#logica
	srl $11, $10, 31	#logica
	
	add $12, $8, 32		#logica
	mul $13, $11, 16	#logica
	
	add $4, $13, $12	#logica
	addi $2, $0, 11
	syscall
	
	add $8, $0, $20
	
	not $9, $8		#logica
	addi $10, $9, 1	#logica
	srl $11, $10, 31	#logica
	
	add $12, $8, 32	#logica
	mul $13, $11, 16	#logica
	
	add $4, $13, $12	#logica
	addi $2, $0, 11
	syscall
	
	addi $2, $0, 10
	syscall
	

	
