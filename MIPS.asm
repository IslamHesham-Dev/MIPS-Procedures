.data
result:.word
 
Sel_Sort:

	addi $sp, $sp, -4
	sw $s0, 0($sp) # int min
	li $s0, 0      # min = 0
	li $t0, 0 # i = 0
  outer_loop:
  	bge $t0, $a1, goOut
  	
  	sll $t2, $t0, 2
  	add $t2, $t2, $a0
  	lw $t4, 0($t2)	# a[i]
  	addi $s0, $t4, 0 # min = a[i]
  	
        addi $t3, $t0, 0 # p = i
  	addi $t1, $t0, 0 # j = i
  	
  inner_loop:
  	bge $t1, $a1, nextIteration
  	
  	sll $t5, $t1, 2
  	add $t5, $t5, $a0
  	lw $t6, 0($t5) 	# a[j]
  	
  	blt $t6, $t4, logic
  	addi $t1, $t1, 1 # j++
  	j inner_loop 
  	logic:

  		move $s0, $t6	# min = a[j]
  		
  		addi $t3, $t1, 0  # p = j
		
		sll $t7, $t3, 2
		add $t7, $t7, $a0
		lw  $t8, 0($t7) # a[p]
		
		
		move $t8, $t4	# a[p] = a[i]
		move $t4, $s0	# a[i] = min = a[j]

  nextIteration:
  	addi $t0, $t0, 1
  	j outer_loop	
  goOut:
	addi $sp, $sp, 4
	lw $s0, 0($sp)	
	jr $ra
	
	
	
Sem_Abroad:
    li $t5, 0
    li $t0, 0 # i = 0

    loopp:
        beq $a1, $t0, exit_Sem_Abroad
	
	sll $t1, $t0, 2
	add $t1, $t1, $a0
        lw $t2, 0($t1) # a[i]
        
        bge $t2, 70, addValue # a[i] >= 70
	addi $t0, $0, 1
        j loopp

    addValue:
   	sll $t6, $t5,2
   	add $t6, $t6, $a2
   	lw $t7, 0($t6)	# result[$t5] 
        sw $t2, 0($t7) # store a[i] in result array
        addi $t5, $0, 1
	j loopp

    exit_Sem_Abroad:
        jr $ra
        
	
	
	
	
Top_Rank:
    li $t0, 0
    li $v1, 0

loop:
    beq $t0, $a1, exit
    lw $t2, 0($a0)

    bgt $t2, $v1, update

    addi $a0, $a0, 4
    addi $t0, $t0, 1
    j loop

update:
    move $v1, $t2
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    j loop

exit:
    sw $v1, result
    jr $ra	
	
	
exit1:

