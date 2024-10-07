## Java Core 1 Book
Core Java Volume I- Fundamentals 9th Edition 2012- Horstmann

Snapshots related to (just-in-time) compiler

## 1.2.6. Architecture-Neutral
> The compiler generates an architecture-neutral object file format—the compiled code is executable on many processors, given the presence of the Java runtime system. The Java compiler does this by generating bytecode instructions which have nothing to do with a particular computer architecture. Rather, they are designed to be both easy to interpret on any machine and easily translated into native machine code on the fly.

This is not a new idea. More than forty years ago, both Niklaus Wirth’s original implementation of Pascal and the UCSD Pascal system used the same technique.

Of course, interpreting bytecodes is necessarily slower than running machine instructions at full speed, so it isn’t clear that this is even a good idea. However, virtual machines have the option of translating the most frequently executed bytecode sequences into machine code—a process called just-in-time compilation. This strategy has proven so effective that even Microsoft’s .NET platform relies on a virtual machine.

Java’s virtual machine has other advantages. It increases security because it can check the behavior of instruction sequences. Some programs even produce bytecodes on the fly, dynamically enhancing the capabilities of a running program.

## 1.2.8. Interpreted
> The Java interpreter can execute Java bytecodes directly on any machine to which the interpreter has been ported. Since linking is a more incremental and lightweight process, the development process can be much more rapid and exploratory.

Incremental linking has advantages, but its benefit for the development process is clearly overstated. Early Java development tools were, in fact, quite slow. Today, the bytecodes are translated into machine code by the just-in-time compiler.

## 1.2.9. High-Performance
> While the performance of interpreted bytecodes is usually more than adequate, there are situations where higher performance is required. The bytecodes can be translated on the fly (at runtime) into machine code for the particular CPU the application is running on.

In the early years of Java, many users disagreed with the statement that the performance was “more than adequate.” Today, however, the just-in-time compilers have become so good that they are competitive with traditional compilers and, in some cases, even outperform them because they have more information available. For example, a just-in-time compiler can monitor which code is executed frequently and optimize just that code for speed. A more sophisticated optimization is the elimination (or “inlining”) of function calls. The just-in-time compiler knows which classes have been loaded. It can use inlining when, based upon the currently loaded collection of classes, a particular function is never overridden, and it can undo that optimization later if necessary.

## 1.5. Common Misconceptions about Java
[]

> Java is interpreted, so it is too slow for serious applications.

In the early days of Java, the language was interpreted. Nowadays, except on “micro” platforms such as cell phones, the Java virtual machine uses a just-intime compiler. The “hot spots” of your code will run just as fast in Java as they would in C++, and in some cases even faster.

Java does have some additional overhead over C++. Virtual machine startup time is slow, and Java GUIs are slower than their native counterparts because they are painted in a platform-independent manner.

People have complained for years that Java applications are slow. However, today’s computers are much faster than they were when these complaints started. A slow Java program will still run quite a bit better today than those blazingly fast C++ programs did a few years ago. At this point, these complaints sound like sour grapes, and some detractors have instead started to complain that
Java user interfaces are ugly rather than slow.

## 5.1.4. Preventing Inheritance: Final Classes and Methods
[]
Fortunately, the just-in-time compiler in the virtual machine can do a better job than a traditional compiler. It knows exactly which classes extend a given class, and it can check whether any class actually overrides a given method. If a method is short, frequently called, and not actually overridden, the just-in-time compiler can inline the method. What happens if the virtual machine loads another subclass that overrides an inlined method? Then the optimizer must undo the inlining. That’s slow, but
it happens rarely.

## 11.6. Debugging Tips
-13. If you launch the Java virtual machine with the -Xprof flag, it runs a rudimentary profiler that keeps track of the methods in your code that were executed most often. The profiling information is sent to System.out. The output also tells you which methods were compiled by the just-in-time compiler.

> Caution  
The -X options of the compiler are not officially supported and may not be present in all versions of the JDK. Run java -X to get a listing of all nonstandard options.

## 13.5.5. Bit Sets
We have run this test for eight editions of Core Java, and in the last four editions. Java easily beat C++. In all fairness, if one cranks up the optimization level in the C++ compiler, it beats Java with a time of 20 milliseconds. Java could only match that if the program ran long enough to trigger the Hotspot just-in-time compiler.
