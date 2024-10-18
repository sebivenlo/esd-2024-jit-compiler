#include <stdio.h>

int main() {
    int numerator = 10;
    int denominator = 0; // This will cause a division by zero error
    int result;

    result = numerator / denominator;

    printf("Result: %d\n", result);

    return 0;
}