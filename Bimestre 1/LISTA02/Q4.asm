#Faça um programa que leia dois números e escreva a relação de grandeza entre eles.
#Ex. 345 e 23 gera a saída 345>23. Ex.: 24 e 38 gera a saída 24<38. Ex.: 12 e 12 gera a saída 12=12

.text
main:	addi $2,$0,5
	syscall
	add $8,$0,$2 #n1
	
	addi $2,$0,5
	syscall
	add $9,$0,$2 #n2
	
	#print N1
	add $4,$0,$8
	add $2,$0,1
	syscall
	
	beq $8,$9,ingual
	slt $10,$8,$9 # se 8>9 entao 0 senao 1
	beq $10,1,n2maior
		
	add $4,$0,'>'
	add $2,$0,11
	syscall	
	j fim
	
ingual:	
	addi $4,$0,'='
	addi $2,$0,11
	syscall
	j fim
n2maior: 
	
	add $4,$0,'<'
	add $2,$0,11
	syscall

fim: 	add $4,$0,$9
	add $2,$0,1
	syscall
	
	add $2,$0,10
	syscall