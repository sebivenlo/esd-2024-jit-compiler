## Exercise timeout
The Mandelbrot set is a set of complex numbers that produces a fascinating and infinitely complex fractal pattern when plotted on the complex plane. It is defined by iterating the equation:

Fractal Nature: The Mandelbrot set is famous for its intricate boundary that reveals self-similar structures at various scales, meaning that no matter how much you zoom in, you will continue to see complex patterns.

Visualization: Points in the Mandelbrot set are typically colored black, while points outside the set are colored based on how quickly they escape to infinity when the iteration is applied, resulting in a colorful and mesmerizing image.

Mathematical Beauty: The set exemplifies how simple mathematical rules can lead to complex and beautiful results, making it a popular subject in mathematics, art, and computer graphics.

### Installing image

docker build -t mandelbrot-multi .

##### Without JIT 

run this command: docker run mandelbrot-multi

##### With JIT 

run this command: docker run mandelbrot-multi pypy3 ./mandelbrot.py



### references:

documentation of pypy: https://doc.pypy.org/en/latest/