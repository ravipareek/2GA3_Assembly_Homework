# Pareekshit Ravi
# ravip2
# 1407109
doubleadd:
	addu  $v0, $a0, $a2    # $v0 = $a0 + $a2 ... add least significant word
	sltu  $t0, $v0, $a0    # $t0 = $v0 < $ a0 ... set carry-in bit (capturing overflow)
	addu  $v1, $t0, $a1    # $v1 = $t0 + $a1 ... add in first most significant word to the overflow
	addu  $v1, $v1, $a3    # $v1 = $v1 + $a3 ... add in second most significant word
	jr $ra				   # jump

main:
	li $a0, 0xFFFFFFFF
	li $a1, 0x22
	li $a2, 0x1
	li $a3, 0x44
	b doubleadd