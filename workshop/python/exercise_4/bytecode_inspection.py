import dis
import marshal

# Path to the .pyc file
pyc_file_path = "__pycache__/simple_calculator.cpython-312.pyc"

# Open the .pyc file and read the bytecode (skip the first 16 bytes which contain metadata)
with open(pyc_file_path, "rb") as f:
    f.read(16)  # Skip the header
    code_object = marshal.load(f)

# Disassemble and display the bytecode
dis.dis(code_object)