import time
from llvmlite import binding

# Original Python code (equivalent to both LLVM implementations)
# --------------------------------------------------------------
# This Python code computes the sum of the first 1,000,000 integers.
# The non-optimized and optimized LLVM IR implementations both calculate this.
#
# def compute_sum():
#     n = 1000000
#     # Formula-based optimized implementation
#     return (n - 1) * n // 2
#
# print("Sum:", compute_sum())

# Initialize LLVM
binding.initialize()
binding.initialize_native_target()
binding.initialize_native_asmprinter()

# Define the LLVM IR for both cases
non_optimized_ir = """
; Non-optimized summation loop
define i32 @main() {
entry:
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %loop

loop:
  %i_val = load i32, i32* %i, align 4
  %sum_val = load i32, i32* %sum, align 4
  %add = add i32 %sum_val, %i_val
  store i32 %add, i32* %sum, align 4
  %next_i = add i32 %i_val, 1
  store i32 %next_i, i32* %i, align 4
  %cond = icmp slt i32 %next_i, 1000000
  br i1 %cond, label %loop, label %exit

exit:
  %final_sum = load i32, i32* %sum, align 4
  ret i32 %final_sum
}
"""

optimized_ir = """
; Optimized summation using formula
define i32 @main() {
entry:
  %sum = mul i32 999999, 1000000
  %result = udiv i32 %sum, 2
  ret i32 %result
}
"""

# Function to run and time LLVM IR code
def run_and_time(llvm_ir, label):
    # Parse the IR
    llvm_module = binding.parse_assembly(llvm_ir)
    llvm_module.verify()

    # Create a target machine and execution engine
    target = binding.Target.from_default_triple()
    target_machine = target.create_target_machine()
    engine = binding.create_mcjit_compiler(llvm_module, target_machine)

    # Finalize the module and compile it
    engine.finalize_object()

    # Get a pointer to the 'main' function
    func_ptr = engine.get_function_address("main")

    # Convert the pointer to a callable Python function
    import ctypes
    cfunc = ctypes.CFUNCTYPE(ctypes.c_int)(func_ptr)

    # Time the execution
    start_time = time.perf_counter()
    result = cfunc()
    end_time = time.perf_counter()

    # Print the result and execution time
    print(f"{label} Result: {result}")
    print(f"{label} Execution Time: {end_time - start_time:.6f} seconds\n")

# Run and benchmark both implementations
run_and_time(non_optimized_ir, "Non-Optimized")
run_and_time(optimized_ir, "Optimized")