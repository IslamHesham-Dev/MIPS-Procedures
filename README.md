# MIPS-Procedures Documentation

1. **Sel_Sort:**
- **Description: This procedure implements the Selection Sort algorithm to sort an array in ascending order.**
- **Input:**
    - **$a0: The address of the first element of the array.**
    - **$a1: The number of elements in the array.**
- **Procedure:**
    - **The procedure uses nested loops to find the smallest element in each iteration and swaps it with the current element.**
    - **It maintains several registers to keep track of the array and the smallest element.**
- **Output:**
    - **The array at the given address is sorted in ascending order.**
2. **Top_rank:**
    - **Description: This procedure finds the maximum grade in the array.**
    - **Input:**
        - **$a0: The address of the first element of the array.**
        - **$a1: The number of elements in the array.**
    - **Procedure:**
        - **The procedure iterates through the array, comparing each element with the current maximum grade and updating it if a larger grade is found.**
        - **It maintains registers to keep track of the array and the maximum grade.**
    - **Output:**
        - **The maximum grade is stored in register $v0.**
3. **Sem_abroad:**
    - **Description: This procedure identifies the students eligible for a semester abroad based on their grades.**
    - **Input:**
        - **$a0: The address of the first element of the array.**
        - **$a1: The number of elements in the array.**
    - **Procedure:**
        - **The procedure iterates through the array, checking each student's grade against the eligibility threshold (70% or more).**
        - **It stores the eligible students' grades in the "eligible_students" array and keeps track of the number of eligible students.**
        - **It maintains registers to keep track of the array, the eligible students' array, and the number of eligible students.**
    - **Output:**
        - **The eligible students' grades are stored in the "eligible_students" array, and the number of eligible students is stored in register $v1.**
4. **main:**
    - **Description: The main program demonstrates the usage of the implemented procedures.**
    - **Procedure:**
        - **The main program assumes that the array is already defined and initialized in the ".data" section.**
        - **It first calls the Sel_Sort procedure to sort the array in ascending order.**
        - **Next, it calls the Top_rank procedure to find the maximum grade in the array.**
        - **Finally, it calls the Sem_abroad procedure to identify the students eligible for a semester abroad.**
        - **After executing these procedures, the main program prints the sorted array to the console by iterating through the elements and printing them separated by spaces.**
    - **Output:**
        - **The sorted array is printed to the console.**
