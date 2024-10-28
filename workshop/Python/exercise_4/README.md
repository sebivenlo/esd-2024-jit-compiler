# Python

## Exercise

### Compile to Bytecode

    python3 -m py_compile simple_calculator.py

This will create a .pyc file in a directory named __pycache__.

### Compilatin file

    python __pycache__/simple_calculator.cpython-312.pyc

fyi: 3.12 is the cpython version.

You cannot run this .pyc file

### Add inspection to the .py file

add in .py file on top:

    import dis

and in the bottom of the .py file add:

    dis.dis(SimpleCalculator)


### See the python Bytecode
Run the .py file again

    python3 simple_calculator.py

Compare the Python bytecode with the Java bytecode!
Name 3 differences.

