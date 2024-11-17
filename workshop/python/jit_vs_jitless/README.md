## Exercise Jit vs Jitless Python - Mandelbrot
The Mandelbrot set is a set of complex numbers that produces a fascinating and infinitely complex fractal pattern when plotted on the complex plane. It is defined by iterating the equation:
Mathematical Beauty: The set exemplifies how simple mathematical rules can lead to complex and beautiful results, making it a popular subject in mathematics, art, and computer graphics.

![Mandelbrot](/workshop/_images/mandelbrot_sequence_new.gif)


### Benchmarking

Navigate to the correct folder

    cd /workspaces/esd-2024-jit-compiler/workshop/python/jit_vs_jitless


#### Without JIT (CPython = reference implementation)
Run the command

    python3 mandelbrot.py

> **_NOTE:_**  Our container has CPython 3.12. In 3.13 (not yet available in apt-get) is JIT introduced.

#### With JIT ([PyPy](https://doc.pypy.org/en/latest/))
Run the command

    pypy3 mandelbrot.py


Question: What is the time difference?

Back to [challenges overview](/README.md)
