import dis

class SimpleCalculator:
    def main(self):
        total_sum = 0
        for i in range(1, 6):
            total_sum += i
        print(f"The sum of numbers from 1 to 5 is: {total_sum}")

# Create an instance and call the main method
calculator = SimpleCalculator()
calculator.main()

dis.dis(SimpleCalculator)