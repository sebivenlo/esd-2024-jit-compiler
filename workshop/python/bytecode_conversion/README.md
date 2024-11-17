# Python bytecode

## Exercise

Navigate to the correct folder

    cd /workspaces/esd-2024-jit-compiler/workshop/python/bytecode_conversion

### Step 1: Run .py file

    python3 simple_calculator.py

See the output.

### Step 2: Compile to Bytecode

    python3 -m py_compile simple_calculator.py

This will create a .pyc file in a directory named __pycache__.

### Step 3: Run the .pyc (compilation file)

    python3 __pycache__/simple_calculator.cpython-312.pyc

fyi: 3.12 is the cpython version.

Is the output the same as running the .py file?

### Step 4: Add inspection to the simple_calculator.py file

add in .py file on top:

    import dis

and in the bottom of the .py file add:

    dis.dis(SimpleCalculator)


### Step 5: See the python bytecode
Run the .py file again

    python3 simple_calculator.py > output-python.txt

fyi: > is called 'output redirection'

Questions:
1. Is the Python bytecode statically or dynamically typed?
2. Is the Python bytecode (already) optimised by a JIT?

### Step 6: Compare both outputs
Compare the Python bytecode with the Java bytecode!
Question: Name 2 differences.

Back to [challenges overview](/README.md)