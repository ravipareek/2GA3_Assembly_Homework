# Pareekshit Ravi
# ravip2
# 1407109
encodeparity:
	add $s0,$a0,$0		#$s0 = $a0 ... $s0 is going to be the sum
	li $t1,16			#$t1 = 16 ... max bit size
	li $t2,0			#$t0 = 0 ... counter for the loop
	addi $t0,$a0,0		#$t0 = $a0 ... value that is added everytime
loop:
	bgt $t2, $t1, exit	#if ($t2 > $t1) -> exit else
	srl $t0,$t0,1		#$t0 = $t0 >>> 1
	add $s0,$s0,$t0		#$s0 = $s0 + $t0
	addi $t2,$t2,1		#$t2++
	j loop				#jump to loop

exit:
	andi $t3, $s0, 1	#$t3 = $s0 && 1
	sll $t3, $t3, 16	#$t3 = $t3 <<< 16
	add $s1, $t3, $a0	#$s1 = $t3 + $a0
	add $v0, $s1, $0	#$v0 = $s1
	jr $ra				#jump return

main:
	li $a0, 0x1161		#test case
	b encodeparity		#goto encodeparity