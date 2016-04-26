# Pareekshit Ravi
# ravip2
# 1407109
# Partner: 1430273
.globl FUNC
FUNC:
	mul $t0, $a0, $a0
	addi $v0, $0, -16
	add $s1, $v0, $t0
	jr $ra
xintersect:
	addi $s7, $ra, 0
	addi $s6, $a0, 0
find:
	sub $t0, $a2, $a1
	li $t1, 1
	ble $t0,$t1,done
	add $t0, $a1, $a2
	li $t2, 2
	div $t0,$t0,$t2
	addi $s0, $t0, 0
	addi $a0, $t0, 0
	add $sp, $sp, -20
	sw $t0, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $ra, 16($sp)
	jal $s6
	lw $ra, 16($sp)
	lw $a2, 12($sp)
	lw $a1, 8($sp)
	lw $a0, 4($sp)
	lw $t0, 0($sp)
	bgtz $s1,lessEqual
	addi $a1, $s0, 0
	j find
lessEqual:
	addi $a2, $s0, 0
	j find
done:
	addi $v0, $a1, 0
	addi $ra, $s7, 0
	jr $ra


main:
	la $a0, FUNC
	li $a1, 0						#a
    li $a2, 100 					#b
    b  xintersect