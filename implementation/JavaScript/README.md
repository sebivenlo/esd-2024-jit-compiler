# Welcome to the JavaScript Challenge

## Overview
In this challenge, you will explore the performance of different algorithms in JavaScript. There are currently two exercises:

1. **ALDA Sorting**: This exercise includes three sorting algorithms and demonstrates how their performance varies with the JIT (Just-In-Time) compiler. For more information, visit the [ALDA Sorting explanation](./ALDA_SORTING/README.md).

2. **Fibonacci Sequence**: This exercise includes two implementations of the Fibonacci sequence—one using recursion and the other using an iterative loop. The main goal is to observe the performance differences when using JIT with recursive versus iterative functions. For more information, visit the [Fibonacci explanation](./FIBONACCI/README.md).

---
**Important**: Be sure you are located in the root folder, see image below

![Alt text](/implementation/images/root_image.png)

## Exercise 1: ALDA Sorting

### Steps to Run ALDA Sorting with JIT


1. **Run the tests with JIT enabled** by executing the following command:
   ```bash
   node implementation/JavaScript/ALDA_SORTING/tests.js

2. **Open sort tests file** 
Open the tests.js file located in implementation/JavaScript/ALDA_SORTING/. See image below

![Alt text](/implementation/images/tests_file_javascript.png)

3. **Change the size of the generated Array** 
Once you opened the file change, change line 12 from const size = 100000; to const size = 10000;
This will prevent that the code without jit doesn't take more that a minute to finish

4. **Run the tests without JIT** by executing the following command:
   ```bash
   NODE_OPTIONS="--jitless" node implementation/JavaScript/ALDA_SORTING/tests.js

5. **See difference between JIT and Without JIT**

## Exercise 2: Fibonacci Sequence

### Steps to Run the Fibonacci Exercise

1. **Run the iterative Fibonacci function with JIT**  
   Execute the following command to run the iterative version with JIT enabled:
   ```bash
   node implementation/JavaScript/FIBONACCI/fibonacci-iterative.js


2. **Run the iterative Fibonacci function without JIT**  
   Execute the following command to run the iterative version without JIT:
   ```bash
   NODE_OPTIONS="--jitless" node implementation/JavaScript/FIBONACCI/fibonacci-iterative.js


3. **Run the recursive Fibonacci function with JIT**  
   Execute the following command to run the recursive Fibonacci function with JIT:
   ```bash
   node implementation/JavaScript/FIBONACCI/fibonacci.js

4. **Run the recursive Fibonacci function without JIT**  
   Execute the following command to run the recursive version without JIT:
   ```bash
   NODE_OPTIONS="--jitless" node implementation/JavaScript/FIBONACCI/fibonacci.js

5. **Observe the performance differences**
Compare the execution times of the iterative and recursive functions with and without JIT enabled. Note any significant differences in performance.







