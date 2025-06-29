#Faça um programa que leia números inteiros e calcule a soma. O laço do programa
#termina quando o usuário digita um valor negativo. Em seguida o programa imprime a
#soma dos valores digitados.

.text
main:	

for:	beq $9,1,fimfor
	
	add $2,$0,5
	syscall
	add $9,$0,$2 # Testa se I = negativo.
	
	slt $9,$9,$0
	beq $9,1,fimfor # BREAK
	
	add $8,$8,$2
	
	j for
fimfor:
	add $4,$0,$8
	add $2,$0,1
	syscall
	
	add $2,$0,10
	syscall
	

	