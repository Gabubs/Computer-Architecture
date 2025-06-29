# Faça uma função chamada DesenhaLinha. Ele deve desenhar uma linha na tela usando
# vários símbolos de igual (Ex: ========). A função recebe por parâmetro quantos
# sinais de igual serão mostrados.
.text
main:	addi $2,$0,5 #input(n)
	syscall
	add $4,$0,$2
	jal func
	
	add $2,$0,10
	syscall
	
#===========Funcao DesenhaLinha=========
# imprimir '=' n vezes
#---------------------------------------
# Entrada: $4
# Saida: $2
# Reg Usados: 

func:	add $8,$0,$4
	# $9 = i = 0
	
for:	beq $9,$8,fim

	add $4,$0,'='
	add $2,$0,11
	syscall
	
	add $9,$9,1
	j for
fim:	jr $31