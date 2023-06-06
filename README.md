# MIPS-Procedures Documentation

# **MIPS Procedures Documentation**

## **Selection Sort (Sel_Sort)**

**The Sel_Sort procedure implements the Selection Sort algorithm in MIPS assembly. It takes as input the address of the first element of an array and the number of elements in the array. The procedure sorts the array in ascending order.**

**Algorithm:**

1. **Initialize the loop counter `i` to 0.**
2. **Start the outer loop.**
3. **If `i` is equal to the length of the array, exit the loop.**
4. **Calculate the address of the current element using the base address and `i`.**
5. **Initialize the loop counter `j` to `i+1`.**
6. **Start the inner loop.**
7. **If `j` is less than the length of the array, proceed to the comparison step.**
8. **If `j` is equal to or greater than the length of the array, increment `i` and jump to the outer loop.**
9. **Compare the current element with the element at index `j`.**
10. **If the current element is greater than the element at index `j`, swap them.**
11. **Increment `j` and jump to the inner loop.**
12. **Exit the inner loop.**
13. **Exit the outer loop.**

## **Top Rank (Top_rank)**

**The Top_rank procedure finds the maximum grade in an array of grades and returns the result.**

**Algorithm:**

1. **Initialize the maximum grade to a very low value (e.g., -infinity).**
2. **Iterate through the array of grades.**
3. **Compare each grade with the current maximum grade.**
4. **If the current grade is greater than the maximum grade, update the maximum grade.**
5. **Return the maximum grade.**

## **Semester Abroad (Sem_abroad)**

**The Sem_abroad procedure identifies students who are eligible for a semester abroad based on their grades. It takes as input an array of grades and the number of students in the array. The procedure returns an array of eligible students and the number of eligible students.**

**Algorithm:**

1. **Initialize the count of eligible students to 0.**
2. **Create an array to store the eligible students.**
3. **Iterate through the array of grades.**
4. **Check if each grade is 70% or more.**
5. **If a student's grade is eligible, store their information in the array of eligible students and increment the count.**
6. **Return the array of eligible students and the count of eligible students.**
