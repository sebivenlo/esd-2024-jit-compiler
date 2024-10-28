// In your main.js file
const sorters = require('./sorters');


// Testing Function

function generateRandomArray(size) {
    return Array.from({ length: size }, () => Math.floor(Math.random() * 10000));
}


const size = 100000; // Size of the array
const originalArray = generateRandomArray(size);

// Test Selection Sort
const selectionArray = [...originalArray]; // Copy for sorting
console.time('Selection Sort Duration');
const selectionSorted = sorters.selectionSort(selectionArray);
console.timeEnd('Selection Sort Duration');

// Validate Selection Sort
console.assert(JSON.stringify(selectionSorted) === JSON.stringify(selectionSorted.slice().sort((a, b) => a - b)), 'Selection Sort Test Failed');

// Test Insertion Sort
const insertionArray = [...originalArray]; // Copy for sorting
console.time('Insertion Sort Duration');
const insertionSorted = sorters.insertionSort(insertionArray);
console.timeEnd('Insertion Sort Duration');

// Validate Insertion Sort
console.assert(JSON.stringify(insertionSorted) === JSON.stringify(insertionSorted.slice().sort((a, b) => a - b)), 'Insertion Sort Test Failed');

// Test Quick Sort
const quickArray = [...originalArray]; // Copy for sorting
console.time('Quick Sort Duration');
const quickSorted = sorters.quickSort(quickArray);
console.timeEnd('Quick Sort Duration');

// Validate Quick Sort
console.assert(JSON.stringify(quickSorted) === JSON.stringify(quickSorted.slice().sort((a, b) => a - b)), 'Quick Sort Test Failed');
