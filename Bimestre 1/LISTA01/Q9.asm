#Faça u m programa que leia um número inteiro, representando a duração em segundos
#de um experimento científico e imprima o tempo decorrido nesse experimento no
#formato h:m:s.
#Exemplo: 3755 gera uma saída 1:2:35
.text
main:

 addi $2,$0,5
 syscall
 
 add $8,$0,$2
 add $9,$0,3600
 
 div $8,$9
 mfhi $8
 mflo $20 # tempo em hr
 add $9,$0,60
 
 div $8,$9
 mfhi $22 # tempo em sec
 mflo $21 # tempo em min
 
 addi $2,$0,1
 add $4,$0,$20
 syscall # Hora
 
 addi $2,$0,11
 add $4,$0,':'
 syscall # 1:XX:XX
 
 addi $2,$0,1
 add $4,$0,$21
 syscall # Minuto
 
 addi $2,$0,11
 add $4,$0,':'
 syscall # 1:23:XX
	
 addi $2,$0,1
 add $4,$0,$22
 syscall # Segundo

 addi $2,$0,10
 syscall
 