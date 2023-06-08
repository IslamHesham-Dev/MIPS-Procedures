 # MIPS-Procedures Documentation

# **MIPS Procedures Documentation**

## **A) Sel-Sort works as following: -**

## **Java Code**

```java
int[] sort(int n, int a[]) {
	for(int i=0; i<n; i++) {
		int min = a[i];
		int p = i;
		for(int j=i; j<n; j++) {
			if(a[j] < min) {
				min = a[j];
				p = j;
			}
		}
		a[p] = a[i];
		a[i] = min;
	}
	return a;
}
```

**This code simply sorts the array by looping from a[I] to a[n-1] and saving the smallest ones at the
beginning of the array and start again by looping a[I+1] to a[n-1] till I reaches n so the loop will stop, and the array will be then sorted correctly.**

**The MIPS code that implements this logic is as following:**

1. **Takes $a1 as the length of the array “int n “**
2. **Takes $a0 as the array “int a []”**
3. **Save the $s0 items in the stack and make it equals 0 at the beginning, also note that $s0
represents the min variable in the java code**
4. **Initialize outer loop counter ‘i’ with 0, and then enters the loop and checks whether the counter is reached to the n-1 or the last index in the array**
5. **I get the value of a[i] by doing shift left logical by 2 since each index in the array is 4 bytes, and add it to the base address of the array “$a0 in this case” and lastly load this word into a temp register $t4, so now we have $t4 = a[I]**
6. **Doing the part min = a[I], by doing $s0 = $t4 + 0, to use it to compare with the other elements in the array**
7. **This part “addi $t3, $t0, 0 # p = i” is responsible to save the position of the min element so if I found any other element that is smaller than the a[i] so I will store it in this position instead**
8. **Initializing the j = i, if it has reached the length-1 it should go for the nextIteration label which increments the i and goes for new outer loop where i = i + 1**
9. **Entering the inner loop and check whether the j reached the length of the array, if so, it should go for the next iteration of I, so it increments the I and goes for another iteration. If not, it prepares the a[j] and compare it with a[I], if a[j] is less than the a[I] it enters the logic label which does the switch mechanism, otherwise it increments the j and enters the inner loop again**
10. **The logic label switches the a[j] in the min variable which represents the minimum number and the position of this number in the array at this specific iteration by using the move instruction**
11. **The loop then continues till it reaches to the last index of the array it will enter the goOut label which returns the stack pointer to its first status and returns the old value of $s0 if there’s a one and jump return to the return address which will be the main method when using this method.**

## **B) Top_Rank works as following: -**

1. **initializing the $t0 as the loop counter “ i” with the value of 0, and $v1 as the chosen number in the array which will be the top rank in this case.**
2. **Check if the counter reached the length – 1 of the array, if so, go to the exit label which store
the result of the or the biggest number in the register $v1 and store it to the data label that
called result “result: .word“**
3. **If not, it should enter the loop label and set the $t2 to the first value of the array and compares this value with the $v1 which is the result register if $t2 smaller than $v0 it will enter the update label**
4. **The update label set the value of $v1 to be equal $t2 “$v1 = $t2”, and then add 4 on the base
address of the array to go for the next item on the array. And lastly increments the counter I
“i++” and jumps again to the loop untill it reaches to the last elements or index in the array**
5. **When it reaches to the last index it should be finished comparing and have assigned the element which is the biggest one in the $v1 so it will store it and the result .data label**

## **C)Sem_Abroad work as following: -**

1. **Initializing $t0 = 0 as the loop counter and $t5 = 0 as the index of the result array since this
method should return an array of the eligible students**
2. **Enter the loopp label and check whether we reached the end of the array, if so it should go to the exit label and jump return to $ra “return address”**
3. **It shifts the counter by 2 and add it to the base address of the array $a0 and loads the word a[i] in the $t2 register and then check whether this grade is bigger than or equal to 70. If so, it should enter the addValue label which has the logic of the sem_abroad method. Otherwise, it should increment the counter by 1 “i++” and enter the loop again**
4. **AddValue label simply sheft left logical the $t5 which is the index of the result array and add it to the base address of the result array which is taken as an argument in $a2 register, so we now have the result[$t5] so lastly it is assigning the value of a[i] inside the result[$t5] which in the first iteration for example will be result[0] and so on, finally it increments the $t5 so the next time we assign anything in the result array it will be in result[1] and so on. Jump the loop again until the counter reaches to the length - 1**
