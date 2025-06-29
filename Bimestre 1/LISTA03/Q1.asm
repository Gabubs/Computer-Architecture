#Faça um programa que calcule e mostre os 10 primeiros números múltiplos de 3,
#considerando valores maiores que 0

.text
main:	addi $8,$0,3
	add $20,$0,1 # I
	add $21,$0,11 # N
	
for:	beq $20,$21,fimfor # for(i=0;i<n;i++)
	
	add $4,$0,$8
	add $2,$0,1
	syscall
	add $8,$8,3
	
	add $4,$0,' '
	add $2,$0,11
	syscall
	
	add $20,$20,1
	j for	
fimfor:	
	add $2,$0,10
	syscall
	