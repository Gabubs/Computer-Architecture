# Faça uma função que receba 3 números inteiros como parâmetro, representando
# horas, minutos e segundos, e os converta em segundos.
.text
main:	add $2,$0,5
	syscall
	add $4,$0,$2 #Horas
	
	add $2,$0,5
	syscall
	add $5,$0,$2 # Minutos
	
	add $2,$0,5
	syscall
	add $6,$0,$2 # Segundos
	
	jal func
	
	add $4,$0,$2
	add $2,$0,1
	syscall
	
	add $2,$0,10
	syscall

#============================
#conversor em segundos
#============================
# Entrada: $4,$5,$6
#Saida: $2
#usados: $8,$9,$10

func:	add $8,$0,$4 #horas
	add $9,$0,$5 # minutos
	add $10,$0,$6 # segundos
	
	mul $8,$8,3600
	mul $9,$9,60
	add $9,$9,$8
	add $10,$10,$9
	add $2,$0,$10
	jr $31





  
