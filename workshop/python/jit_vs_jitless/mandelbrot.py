import time
import threading

# A computationally heavy function for calculating Mandelbrot set
def mandelbrot_set(width, height, max_iterations):
    result = [[0] * height for _ in range(width)]

    
    for x in range(width):
        for y in range(height):
            zx, zy = x * (3.5 / width) - 2.5, y * (2.0 / height) - 1.0
            c_x, c_y = zx, zy
            iteration = 0
            while zx * zx + zy * zy < 4 and iteration < max_iterations:
                temp = zx * zx - zy * zy + c_x
                zy, zx = 2.0 * zx * zy + c_y, temp
                iteration += 1
            result[x][y] = iteration
    return result

# Function to run the mandelbrot_set and time it
def run_with_timeout(func, timeout, *args, **kwargs):
    # Create a result holder
    result_holder = {"result": None}
    
    # Define a wrapper function to execute the task
    def wrapper():
        result_holder["result"] = func(*args, **kwargs)

    # Create a thread to run the function
    thread = threading.Thread(target=wrapper)
    thread.start()

    # Wait for the thread to complete within the timeout
    thread.join(timeout)

    # If the thread is still alive after the timeout, raise an exception
    if thread.is_alive():
        print(f"Execution exceeded the time limit of {timeout} seconds. Terminating...")
        return None
    return result_holder["result"]

if __name__ == "__main__":
    width, height = 800, 800
    max_iterations = 1000
    timeout = 50  # Timeout in seconds

    start_time = time.time()
    
    # Call the function with a timeout
    result = run_with_timeout(mandelbrot_set, timeout, width, height, max_iterations)

    end_time = time.time()

    if result is not None:
        print(f"Execution completed in {end_time - start_time:.2f} seconds")
    else:
        print(f"Execution was terminated after exceeding {timeout} seconds.")
