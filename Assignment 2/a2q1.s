# Pareekshit Ravi
# ravip2
# 1407109
# Partner: 1430273
sqrt:
	addi $t3, $a1, 1 			#$t3 = a + 1
	beq $t3, $a2, found			# (a+1)!=b, else -> found
	add $t0, $a1, $a2			# m = a + b
	srl $t0, $t0, 1 			# m (a + b) / 2
	mul $t1,$t0,$t0				#$t1 = m ^ 2
	bgtu $t1,$a0,otherCase		# m ^ 2 <= x, else -> otherCase
	addi $a1, $t0, 0 			# a = m
	j sqrt						#loop again
found:
	addi $v0, $a1, 0 			# $v0 = $a1
	j $ra 						# finish
otherCase:
	addi $a2, $t0, 0 			# b = m
	j sqrt						#loop again

main:
	li $a0, 144 				# argument
	li $a1, 0 					#lower limit
	li $a2, 0x10000				#upper limit
	b sqrt