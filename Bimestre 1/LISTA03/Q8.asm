# Faça um programa leia certa quantidade de números e imprima o maior deles e
# quantas vezes o maior número foi lido. A quantidade de números a serem lidos deve
# ser fornecido pelo usuário.
.text
main:	
	add $2,$0,5
	syscall
	add $9,$0,$2 # N
	# $20 = I = 0
	add $21,$0,2147483647 # gambiarra pra 21 pegar o primeiro numero
	add $22,$0,-2147483648
	
for:	beq $20,$9,fimfor
	
	add $2,$0,5
	syscall
	add $8,$0,$2
	
	slt $24,$8,$21 # 21 = MENOR
se1:	beq $24,0,fimse1
	add $21,$0,$8

fimse1:
	slt $24,$8,$22 # 22 = MAIOR
se2:	beq $24,1,fimse2
	add $22,$0,$8

fimse2:
	add $20,$20,1
	j for
fimfor: 
	add $4,$0,$21
	add $2,$0,1
	syscall
	
	add $4,$0,'\n'
	add $2,$0,11
	syscall
	
	
	add $4,$0,$22
	add $2,$0,1
	syscall

	add $2,$0,10
	syscall