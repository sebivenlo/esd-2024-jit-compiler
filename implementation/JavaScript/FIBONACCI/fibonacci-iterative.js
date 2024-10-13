function fibonacci(n) {
    if (n < 2) return 1; // Base case for n = 0 or 1

    let a = 1, b = 1; // Initial values for Fibonacci(0) and Fibonacci(1)

    for (let i = 2; i <= n; i++) {
        let temp = a + b; // Sum of the previous two numbers
        a = b; // Shift the numbers for the next iteration
        b = temp;
    }

    return b; // The nth Fibonacci number
}

let n = 32;
let start = Date.now();
let fibResult = fibonacci(n);
let stop = Date.now();

console.log(`Fibonacci(${n}): ${fibResult}`);
console.log(`Time: ${(stop - start) / 1000} seconds`);