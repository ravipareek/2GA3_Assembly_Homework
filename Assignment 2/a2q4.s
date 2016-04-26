# Pareekshit Ravi
# ravip2
# 1407109
# Partner: 1430273
exp:
	li $t0, 1 						# $t0 = 1
	and $t1, $t0, $a0				# n & 1
	bne $t1, $t0, b1				# if(n & 1 != 1) -> b1
	mul.s $f1,$f1,$f2				# r = r * p
	srl $a0, $a0, 1 				# n = n >> 1
	beqz $a0,done					# if (n == 0) -> done
	mul.s $f2, $f2, $f2				# p = p * p
	j exp							# loop again
b1:
	srl $a0, $a0, 1 				# n = n >> 1
	beqz $a0,done					# if (n == 0) -> done
	mul.s $f2, $f2, $f2				# p = p * p
	j exp							# loop again
done:
	mov.s $f0, $f1 	 				# $f0 = $f1
	jr $ra 							# finish


main:  
	l.s $f12, float1
	li $a0, 3
	li.s $f1, 1.0
	mov.s $f2, $f12
	b  exp
.data   
float1 : .float 2.0