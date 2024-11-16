module.exports = {
     selectionSort(arr) {
        const n = arr.length;
        for (let i = 0; i < n - 1; i++) {
            let minIndex = i;
            for (let j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }
            if (minIndex !== i) {
                [arr[i], arr[minIndex]] = [arr[minIndex], arr[i]]; // Swap
            }
        }
        return arr;
    },
    
    
    insertionSort(arr) {
        const n = arr.length;
        for (let i = 1; i < n; i++) {
            const key = arr[i];
            let j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
        return arr;
    },
    
    
    
    medianOfThree(arr, left, right) {
        const mid = Math.floor((left + right) / 2);
        if (arr[left] > arr[mid]) [arr[left], arr[mid]] = [arr[mid], arr[left]];
        if (arr[left] > arr[right]) [arr[left], arr[right]] = [arr[right], arr[left]];
        if (arr[mid] > arr[right]) [arr[mid], arr[right]] = [arr[right], arr[mid]];
        return arr[mid];
    },
    
    quickSort(arr, left = 0, right = arr.length - 1) {
        if (left < right) {
            const pivot = this.medianOfThree(arr, left, right);
            let i = left;
            let j = right;
            let lt = left;
            let gt = right;
    
            while (i <= gt) {
                if (arr[i] < pivot) {
                    [arr[i], arr[lt]] = [arr[lt], arr[i]];
                    lt++;
                    i++;
                } else if (arr[i] > pivot) {
                    [arr[i], arr[gt]] = [arr[gt], arr[i]];
                    gt--;
                } else {
                    i++;
                }
            }
            
            this.quickSort(arr, left, lt - 1);
            this.quickSort(arr, gt + 1, right);
        }
        return arr;
    }
    
}