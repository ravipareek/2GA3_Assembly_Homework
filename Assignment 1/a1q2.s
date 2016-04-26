# Pareekshit Ravi
# ravip2
# 1407109
multiadd:
	add $t0, $a3, $0
	addi $t0,$t0, -1
loop:
	blt $t0, $0, exit
	sll $t1,$t0,2		#$t1 = $t0*4
	add $t2, $a0,$t1	#$t2 is array1 appended to i index
	add $t3, $a1,$t1	#$t3 is array2 appended to i index
	lw $s0, 0($t2)		#$s0 = array1[i]
	lw $s1, 0($t3)		#$s1 = array2[i]
	addu $t4, $s0, $s1	#$t4 = array1[i] + array2[i]
	add $t4, $t4, $t7	#$t4 = $t4 + (overflow)
	li $t6, 9			#$t6 = 10
	sltu $t7, $t6, $t4	#checking for overflow
	beq $t7,$0,continue	#if there is not an overflow, goto continue
	addi $t4,$t4,-10	#subtracting 10 is there is an overflow
	b continue
continue:
	add $t5, $a2, $t1	#indexing array3 to the i index
	sw $t4, 0($t5)		#array3[i] = $t4
	addi $t0, $t0, -1	#$t0--
	j loop
exit:
	jr $ra

main:
	la $a0, array1		# $a0 = array1 address
	la $a1, array2		# $a1 = array2 address
	la $a2, array3		# $a2 = array3 address
	li $a3, 3			# $a3 = 3
	b multiadd			# goto multiadd
.data
array1:       .word 4, 2, 8, 7
array2:       .word 1, 1, 8, 7
array3:       .word 1, 2, 4, 7