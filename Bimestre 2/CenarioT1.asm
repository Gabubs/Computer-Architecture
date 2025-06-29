# Teste 1 de criacao de cenario

.text
main:	lui $4,0x1001
	
	jal defFundo




	addi $2,$0,10   
	syscall



#================================================
defFundo:

#================================================
### RENDER FUNDO VERDE
#================================================
	lui $8,0x1001

	add $9,$9,0x507C38 # FUNDO Verde

	add $10,$0,8192 # Tamnaho tela toda
	
BG:	beq $10,$0,FBG

	sw $9, 0($8)
	add $8,$8,4
	
	add $10,$10,-1
	j BG
FBG:	
#================================================
### RENDER AGUA
#================================================
	lui $8,0x1001 
	add $9,$0,0x00187C # Cor (Azul)

	add $11,$0,128  # Tamanho da Linha(ignorar)
	mul $11,$11, 10 # Linha de Partida (por algum motivo ta dando a metade entao 1 linha e sempre 1 par)
	
	add $8,$8,$11 # Leitura do ponto inicial	
	
	add $10,$0,4864 # 38 linhas
	add $8, $8, $11

	# No total ficam 48 linhas(10+38)

Agua:	beq $10,$0,FA


	sw $9,0($8)
	add $8,$8,4
	
	add $10,$10,-1
	j Agua
FA:

	
#================================================
### Render Rua
#================================================
    	lui $8,0x1001         
    	add $9,$0,0xF0EA48      # Cor da rua

    	add $11,$0,128          # Linha inicial da pista
    	mul $11,$11,172       
    	add $8,$8,$11      

    	add $10,$0,768          # contador de pixels

Rua:    beq $10,384,Metade      

   	sw $9,0($8)            
    	add $8,$8,4            
    	addi $10,$10,-1        
    	j Rua 

Metade: lui $8,0x1001
	add $11,$0,128     
    	mul $11,$11,244
    	add $8,$8,$11

RuaB:	beq $10,$0,FRua

    	sw $9,0($8)           
    	add $8,$8,4          
    	addi $10,$10,-1         
    	j RuaB                   

FRua:

	lui $8,0x1001
	add $9,$0,0x000000 # Asfalto do jogo
	add $11,$0,128
	mul $11,$11,184
	
	add $8,$8,$11
	
    	add $10,$0,2304        # contador de pixels
Asfalto:	beq $10,384,FimA   

   	sw $9,0($8)            
    	add $8,$8,4            
    	addi $10,$10,-1        
    	j Asfalto
FimA:
	jr $31

