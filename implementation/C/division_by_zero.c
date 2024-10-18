#include <stdio.h>

int main() {
    float numerator = 10.0;
    float denominator = 0.0; // This will cause a division by zero error
    float result;

    result = numerator / denominator;

    printf("Result: %f\n", result);

    return 0;
}