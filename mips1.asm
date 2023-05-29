# Sel_Sort - Sorts an array using Selection Sort
# $a0 - Address of the first element of the array
# $a1 - Number of elements in the array
Sel_Sort:
    add $t0, $zero, $a0         # $t0 holds the address of the current element
    li $t1, 0                   # $t1 holds the current index
    li $t2, 0                   # $t2 holds the smallest element index
    
outer_loop:
    bge $t1, $a1, end_sort      # If current index >= number of elements, exit
    
    addi $t3, $t1, 1            # $t3 holds the next index
    add $t4, $t0, $t1           # $t4 holds the address of the current element
    
    li $t5, 9999                # $t5 holds the smallest element (initialize with a large value)
    li $t6, 0                   # $t6 holds the index of the smallest element
    
inner_loop:
    bge $t3, $a1, swap          # If next index >= number of elements, go to swap
    
    add $t7, $t0, $t3           # $t7 holds the address of the next element
    
    lw $t8, 0($t7)              # Load next element
    slt $t9, $t8, $t5           # Compare next element with current smallest element
    beqz $t9, check_next        # If next element >= smallest element, go to check_next
    
    move $t5, $t8               # Update smallest element
    move $t6, $t3               # Update index of smallest element
    
check_next:
    addi $t3, $t3, 1            # Increment next index
    j inner_loop
    
swap:
    lw $t8, 0($t4)              # Load current element
    sw $t5, 0($t4)              # Store smallest element at current position
    sw $t8, 0($t0)              # Store current element at smallest element position
    
    addi $t1, $t1, 1            # Increment current index
    addi $t0, $t0, 4            # Increment current element address
    
    j outer_loop

end_sort:
    jr $ra                      # Return

# Top_rank - Returns the maximum grade in the array
# $a0 - Address of the first element of the array
# $a1 - Number of elements in the array
# $v0 - Maximum grade
Top_rank:
    add $t0, $zero, $a0         # $t0 holds the address of the current element
    li $t1, 0                   # $t1 holds the current index
    li $v0, -9999               # $v0 holds the maximum grade (initialize with a small value)
    
top_loop:
    bge $t1, $a1, end_top       # If current index >= number of elements, exit
    
    lw $t2, 0($t0)              # Load current element
    slt $t3, $v0, $t2           # Compare current element with maximum grade
    beqz $t3, check_next_top    # If current element <= maximum grade, go to check_next_top
    
    move $v0, $t2               # Update maximum grade
    
check_next_top:
    addi $t1, $t1, 1            # Increment current index
    addi $t0, $t0, 4            # Increment current element address
    
    j top_loop
    
end_top:
    jr $ra                      # Return

# Sem_abroad - Returns an array of students eligible for a semester abroad and their number
# $a0 - Address of the first element of the array
# $a1 - Number of elements in the array
# $v0 - Address of the eligible students array
# $v1 - Number of eligible students
Sem_abroad:
    add $t0, $zero, $a0         # $t0 holds the address of the current element
    li $t1, 0                   # $t1 holds the current index
    li $v1, 0                   # $v1 holds the number of eligible students
    
    la $v0, eligible_students   # $v0 holds the address of the eligible students array
    
eligible_loop:
    bge $t1, $a1, end_sem       # If current index >= number of elements, exit
    
    lw $t2, 0($t0)              # Load current element
    slti $t3, $t2, 70           # Check if current element < 70
    beqz $t3, check_next_sem    # If current element >= 70, go to check_next_sem
    
    sw $t2, ($v0)               # Store eligible student in the eligible students array
    addi $v0, $v0, 4            # Increment eligible students array address
    addi $v1, $v1, 1            # Increment number of eligible students
    
check_next_sem:
    addi $t1, $t1, 1            # Increment current index
    addi $t0, $t0, 4            # Increment current element address
    
    j eligible_loop

end_sem:
    jr $ra                      # Return

.data
eligible_students: .space 400  # Array to store eligible students (assuming each element is 4 bytes)

.text
main:
    # Assume the array is already defined and initialized
    
    # Call Sel_Sort procedure
    jal Sel_Sort
    
    # Call Top_rank procedure
    jal Top_rank
    
    # Call Sem_abroad procedure
    jal Sem_abroad

# Print the sorted array
    la $t0, array               # Load the address of the first element of the array
    move $a0, $t0               # Set the address as the argument for printing
    li $v0, 4                   # Print the array label
    syscall

    li $v0, 4                   # Print a newline
    la $a0, newline
    syscall

    li $t1, 0                   # Set the current index to 0

print_loop:
    bge $t1, $a1, end_program   # If current index >= number of elements, exit

    lw $t2, ($t0)               # Load current element
    move $a0, $t2               # Set the element as the argument for printing
    li $v0, 1                   # Print the element
    syscall

    li $v0, 4                   # Print a space
    la $a0, space
    syscall

    addi $t1, $t1, 1            # Increment current index
    addi $t0, $t0, 4            # Increment current element address

    j print_loop

end_program:
    li $v0, 10                  # Exit program
    syscall

.data
array: .word 5, 2, 7, 1, 9, 3    # Example array
newline: .asciiz "\n"           # Newline character
space: .asciiz " "              # Space character

.text

