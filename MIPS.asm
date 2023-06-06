.data
	list: .word 3, 2, 10, 0, 1, 2
	enter: .asciiz "\n"
.text


.globl main
main:
	la $a0,list
	addi $al,$zero,6

	jal Sel_Sort
	jal Top_rank
	j END

Sel_Sort:
	add $t0 Szero,$zero   #i=0

Loop2:  beq $t0, $a1, exit1   #i==a.length then exit1

	sll $t1,$t0,2 
	add $t1,$t1,$a0
	lw  $t2,0(St1)        #t2=min
	
	add $t3,$t0,$zero     #index=t3
	
	add $t4,$t0,$zero     #j=i
Loop1: 
	beq $t4,$a1,exit2     #i==a.length then exit2
	
	sll $t5,$t4,2
	add $t5,$t5,$a0
	lw $t5,0($t5)       #t5=a[j]
	
	slt $t6,$t5,$t2     #if(t5 < t2) then t6 = 1 else t6 = O
	beq $t6,$zero,cont1
	
	add $t2,$t5,$zero  #min = a[j]
	add $t3,$t4,$zero  #index = j
	
contl: 
	addi $t4,$t4,1    #j++
	j    Loop1
	
exit2: 
	sll $t6,$t0,2
	add $t6,$t6,$a0
	lw $t7,0($t6)    #t7=a[i]
	
	sll $t8,$t3,2
	add $t8,$t8,$a0
	lw $t9,0($t8)    #t9=a[index]
	
	sw $t7,0($t8)    #store t7 at a[index]
	
	sw $t2,0,($t6)   #store t2(min) into a[i]
	
	addi $t0,$t0,1   #i++
	
	j	Loop2
	
exit1:
	jr $ra
	
Top_rank:
	add $t0,$zero,$zero   #i=0
	add $v0,$zero,$zero   #max=0
	
Loop3:
	beq $t0,$a1,exit3     #if(i==length)exit the loop
	
	sll $t1,$t0,2
	add $t1,$t1,$a0
	lw $t1,0($t1)         #t1=a[i]
	
	slt $t2,$v0,$t1       #if(max<a[i]) then make max is a[i]
	beq $t2,$zero,cont2
	
	add $v0,$t1,$zero     #max=a[i]
	
cont2:
	addi $t0,$t0,1       #i++
	j	Loop3
	
exit3:
	jr $ra
	
Sem_abroad:
	add $t0,$zero,$zero	#i=0
	add $t1,$zero,$zero	#j=0
	addi $t2,$t2,70		#t2=70
	
Loop4:
	beq $t0,$a1,exit4
	
	sll $t3,$t0,2
	add $t3,$t3,$a0
	lw $t3,0($t3)           #t3=a[i]
	
	slt $t4,$t3,$t2		#if(a[i]<70)
	beq $t4,$zero,cont3
	
	sll $t5,$t1,2
	add $t5,$t5,$a2         #base address of new array assumed to be in a2
	sw $t3,0($t5)           #store t3 which is a[i] into address t5
	addi $t1,$t1,1          #j++
	
cont3:
	addi $t0,$t0,1          #i++
	j	Loop4
	
exit4:
	jr $ra

print_array:
	add $s0,$a0,$zero
	li $v0,1
	
	add $s1,$zero,$zero
	
L1:
	beq $s1,$a1,exit5
	
	sll $s2,$s1,2
	add $s2,$s2,$s0
	lw $a0,0($s2)
	
	syscall
	
	addi $s1,$s1,1
	j	L1
	
exit5:
	li $v0,4
	la $a0,enter
	syscall
	
	add $a0,$s0,$zero
	jr $ra
	
END:
