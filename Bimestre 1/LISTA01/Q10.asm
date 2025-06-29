.text
main:

 addi $2,$0,12
 syscall
 
 add $8,$0,$2
 addi $8,$8,-32
 
 add $2,$0,11
 add $4,$0,'\n'
 syscall
 
 add $2,$0,11
 add $4,$0,$8
 syscall