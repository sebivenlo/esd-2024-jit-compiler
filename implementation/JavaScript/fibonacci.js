function fibonacci(n) {
    return (n < 2) ? 1 : fibonacci(n - 2) + fibonacci(n - 1);
}

let n = 32;
let start = Date.now(); // Get current time in milliseconds
let fibResult = fibonacci(n);
let stop = Date.now(); // Get current time again

console.log(`Fibonacci(${n}): ${fibResult}`);
console.log(`Time: ${(stop - start) / 1000} seconds`);