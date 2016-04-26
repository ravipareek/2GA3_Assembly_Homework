# Pareekshit Ravi
# ravip2
# 1407109
stringlength:
	li $t0, 0				#$t0 = 0 ... counter set to 0
loop:
	lb $t1, 0($a0)			#loading first byte at $a0
	beqz $t1, exit			#if($t0 == 0), exit
	addi $a0, $a0, 1		#$a0++ ... changing the pointer to the next byte
	addi $t0, $t0, 1		#$t0++ ... incrementing the counter
	j loop
exit:
	add $v0, $t0, $0		#$v0 = $t0 ... saving the answer in $v0
	jr $ra

main:
	la $a0, string
	b stringlength
.data
string:	.asciiz "there"