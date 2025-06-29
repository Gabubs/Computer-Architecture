# Faça um programa que leia números inteiros diferentes de zero e calcule a soma dos
# valores positivos. O laço do programa termina quando o usuário digita um valor zero.
# Em seguida o programa imprime a soma dos valores positivos digitados.
.text
main:
	add $8,$0,1 #gambiarra pra funcionar
for:	beq $8,0,fimfor

	add $2,$0,5
	syscall
	beq $2,0,fimfor
	add $8,$0,$2
	slt $10,$0,$8 # se 8 maior q 0, 10=1, senao, 10=0
	beq $10,1,somar
	j for
somar:	add $20,$20,$8
	j for
fimfor:	
	add $4,$0,$20
	add $2,$0,1
	syscall
	add $2,$0,10
	syscall