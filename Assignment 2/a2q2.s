# Pareekshit Ravi
# ravip2
# 1407109
# Partner: 1430273
exp:
	li $t0, 1 						# $t0 = 1
	and $t1, $t0, $a1				# n & 1
	bne $t1, $t0, b1				# if(n & 1 != 1) -> b1
	mul $s0,$s0,$s1					# r = r * p
	srl $a1, $a1, 1 				# n = n >> 1
	beqz $a1,done					# if (n == 0) -> done
	mul $s1, $s1, $s1				# p = p * p
	j exp							# loop again
b1:
	srl $a1, $a1, 1 				# n = n >> 1
	beqz $a1,done					# if (n == 0) -> done
	mul $s1, $s1, $s1				# p = p * p
	j exp							# loop again
done:
	addi $v0, $s0, 0 				# $v0 = $s0
	jr $ra 							# finish

main:
	 li $a0, 3 					#base (x)
	 li $a1, 0						#exponent (n)
	 li $s0, 1 						# r = 1
	 addi $s1, $a0, 0 				# p = x
	 b exp