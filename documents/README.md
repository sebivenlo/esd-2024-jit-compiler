# Documentation
This document will contain all the documentation we made so far, it includes the proper chapters and references.


# Table of Contents

- [JIT Compiler Workshop](#jit-compiler-workshop)
  - [1. Introduction to JIT Compilation (5-10 mins)](#1-introduction-to-jit-compilation-5-10-mins)
    - [What is a JIT Compiler?](#what-is-a-jit-compiler)
    - [Difference between JIT and AOT Compilation](#difference-between-jit-and-aot-compilation)
    - [Overview of Key Concepts](#overview-of-key-concepts)
  - [2. How a JIT Compiler Works (10-15 mins)](#2-how-a-jit-compiler-works-10-15-mins)
    - [Phases of JIT Compilation](#phases-of-jit-compilation)
    - [Advantages of JIT](#advantages-of-jit)
    - [Steps of creation of own JIT compiler](#steps-of-creation-of-own-jit-compiler)
    - [Challenges](#challenges)
  - [3. JIT Compiler Optimization Techniques (10-15 mins)](#3-jit-compiler-optimization-techniques-10-15-mins)
    - [Hotspot Optimization](#hotspot-optimization)
    - [Inlining](#inlining)
    - [Dead Code Elimination](#dead-code-elimination)
    - [Register Allocation and Optimization](#register-allocation-and-optimization)
    - [Adaptive Optimization](#adaptive-optimization)
  - [4. Comparing JIT Implementations (10 mins)](#4-comparing-jit-implementations-10-mins)
    - [Java HotSpot JVM (Oracle)](#java-hotspot-jvm-oracle)
    - [.NET Core CLR (Microsoft)](#net-core-clr-microsoft)
    - [V8 Engine (Google Chrome)](#v8-engine-google-chrome)
    - [PyPy (Python)](#pypy-python)
  - [5. Advantages and Disadvantages of JIT Compilation (5-10 mins)](#5-advantages-and-disadvantages-of-jit-compilation-5-10-mins)
    - [Advantages](#advantages)
    - [Disadvantages](#disadvantages)
  - [6. Real-World Use Cases of JIT (5-10 mins)](#6-real-world-use-cases-of-jit-5-10-mins)
    - [JVM for Java Applications](#jvm-for-java-applications)
    - [Game Engines (Unity/C#)](#game-engines-unityc)
    - [Dynamic Languages (JavaScript, Python)](#dynamic-languages-javascript-python)
  - [7. Interactive Demos (15-20 mins)](#7-interactive-demos-15-20-mins)
    - [Live Coding](#live-coding)
    - [Hotspot Example](#hotspot-example)
    - [Performance Profiling](#performance-profiling)
    - [Comparing JIT vs AOT Performance](#comparing-jit-vs-aot-performance)
  - [8. Common Challenges in JIT Design (5-10 mins)](#8-common-challenges-in-jit-design-5-10-mins)
    - [Startup Time](#startup-time)
    - [Security Considerations](#security-considerations)
    - [Multithreading and Concurrency](#multithreading-and-concurrency)
  - [9. Future of JIT Compilation (5 mins)](#9-future-of-jit-compilation-5-mins)
    - [Advances in Hardware (e.g., AI, GPU Optimizations)](#advances-in-hardware-eg-ai-gpu-optimizations)
    - [WebAssembly (Wasm)](#webassembly-wasm)
    - [Machine Learning and JIT](#machine-learning-and-jit)
  - [10. Q&A and Discussion (10-15 mins)](#10-qa-and-discussion-10-15-mins)
  - [Resources and Tools for the Workshop](#resources-and-tools-for-the-workshop)
  - [Bonus: Hands-On Session or Code Challenges (optional)](#bonus-hands-on-session-or-code-challenges-optional)

[Go back to top](#table-of-contents)

---

### JIT Compiler Workshop

#### 1. Introduction to JIT Compilation (5-10 mins)

##### What is a JIT Compiler?

Just-in-time compilation is a method for improving the performance of interpreted programs. During execution the program may be compiled into native code to improve its performance. It is also known as dynamic compilation. The earliest published JIT compiler is generally attributed to work on LISP by John McCarthy in 1960.

Traditionally there are two methods for converting source code into a form that can be run on a platform. Static compilation converts the code into a language for a specific platform. An interpreter directly executes the source code. To get more into details about how JIT compiler works we have to know the two normal coverters of source code(compiler and interpreter)

![Alt text](/documents/images/compiler_vs_interpreter.webp)


Compiler: A compiler that supports the source programming language reads the files, analyzes the code, and translates it into a format suitable for the target platform. Compilers that translate source code to machine code target specific operating systems and computer architectures. For example in Java, the process of compilation will look like the image below.

![Alt text](/documents/images/java_compilation_process.png)

Interpreter: An interpreter is a computer program that is used to directly execute program instructions written using one of the many high-level programming languages.

The interpreter transforms the high-level program into an intermediate language that it then executes, or it could parse the high-level source code and then performs the commands directly, which is done line by line or statement by statement. There are 4 types of interpreters


Bytecode Interpreter: Bytecode interpreters can process up to 256 instructions, with each instruction starting with a byte. 

![Alt text](/documents/images/bytes.png)

![Alt text](/documents/images/bytecode_pointer_interpreters.png)

Threaded Code Interpreter: Unlike bytecode interpreters, threaded code interpreters use pointers instead of bytes. Each instruction is a word pointing to a function or an instruction sequence, possibly followed by a parameter. The number of different instructions is limited by the available memory and address space.

![Alt text](/documents/images/bytecode_pointer_interpreters.png)

Abstract Syntax Tree Interpreter: AST is an approach to transform the source code into an optimized abstract syntax tree, then execute the program following this tree structure, or use it to generate native code just-in-time.

![Alt text](/documents/images/three_interpreter.png)

Just-in-Time Compilation: The jit compiler can be interpreted as both, in the following chapter 2, you can find the rest of the information.

![Alt text](/documents/images/interpreter_process.png)

To summary the pros and const of both methods, we made a table. See below



| Aspect            | Compiler                                                   | Interpreter                                                  |
|-------------------|-------------------------------------------------------------|--------------------------------------------------------------|
| **Execution Speed**| Faster execution after compilation, as the entire code is translated into machine language before execution. | Slower, as the code is translated and executed line-by-line.  |
| **Error Detection**| Errors are detected only after the entire program is compiled, which can make debugging harder. | Errors are detected immediately during execution, making debugging easier. |
| **Translation**    | Translates the entire source code into machine code at once, generating a separate executable file. | Translates and executes code line-by-line without generating a separate file. |
| **Memory Usage**   | Requires more memory upfront for compilation and storage of the executable file. | Generally uses less memory since there’s no need for storing an entire executable. |
| **Development Cycle** | Slower development cycle as the entire program must be recompiled after each change. | Faster development cycle as changes can be tested immediately without recompilation. |
| **Portability**    | Executable files are platform-dependent and may not run on different systems without recompilation. | Source code is platform-independent, as long as the interpreter is available on the platform. |
| **Optimization**   | Allows for advanced optimizations during the compilation process, improving runtime performance. | Limited optimization as code is interpreted and executed immediately. |
| **Use Cases**      | Ideal for production environments where performance is critical (e.g., C, C++). | Ideal for scripting, development, or education where quick feedback is needed (e.g., Python, JavaScript). |
| **Initial Overhead**| High, due to the time required for full compilation before execution. | Low, as execution begins immediately after interpretation. |
| **Runtime Changes** | Not suitable for interactive or dynamic runtime changes since code needs to be recompiled. | Suitable for interactive and dynamic runtime changes (e.g., REPL environments). |

Now going back to what JIT compiler is. JIT compilation attempts to use the benefits of both. While the interpreted program is being run, the JIT compiler determines the most frequently used code and compiles it to machine code. Depending on the compiler, this can be done on a method or smaller section of code.

###### references

JIT compiler explanation: https://www.freecodecamp.org/news/just-in-time-compilation-explained/

JIT compiler founder: https://en.wikipedia.org/wiki/Just-in-time_compilation#:~:text=10%20External%20links-,History,by%20John%20McCarthy%20in%201960.

What is a compiler: https://www.techtarget.com/whatis/definition/compiler#:~:text=A%20compiler%20that%20supports%20the,operating%20systems%20and%20computer%20architectures.

What is an interpreter: https://www.techopedia.com/definition/7793/interpreter

types of interpreters: https://builtin.com/software-engineering-perspectives/compiler-vs-interpreter

##### Difference between JIT and AOT Compilation:

- **JIT**: Code is compiled at runtime (e.g., Java, .NET CLR).
- **AOT**: Code is compiled before execution (e.g., C, C++).

##### Overview of Key Concepts:

- Explain bytecode, machine code, and interpreters, showing how JIT fits in.

[Go back to top](#table-of-contents)

---

#### 2. How JIT compiler Works? (10-15 mins)

##### Phases of JIT Compilation:

- **Interpretation phase**: Code is initially run by an interpreter.
- **Profiling phase**: The JIT monitors the performance of the code during execution.
- **Hot code detection**: The most frequently executed parts (hotspots) are compiled to machine code.
- **Machine code generation**: Hot code is compiled and executed natively.

##### Advantages of JIT:

- **Optimization at runtime**: Adaptations to the hardware or input-specific optimizations.
- **Faster execution for hot code**: Native code is faster than interpreted bytecode.

##### Steps of creation of own JIT compiler:

- Interpreters
Before writing a JIT compiler, it’s helpful to write an interpreter. An interpreter executes code directly without compiling it, and it can serve as the foundation for a JIT compiler. You will need to understand how to evaluate programs at runtime.

- Intermediate Representation (IR)
JIT compilers often use an intermediate representation, which is a lower-level, hardware-agnostic representation of the program code. You need to design or adopt an IR that can be efficiently converted to machine code.

- Machine Code Generation
This is one of the most difficult parts. You will need to translate the IR to actual machine code specific to the target CPU architecture (e.g., x86, ARM). Familiarity with assembly languages is required.

- Runtime Optimization
A JIT compiler applies optimizations dynamically, based on the program's behavior at runtime. This is where it differs from static compilers (e.g., GCC or Clang). You might need to implement profiling, inlining, loop unrolling, or other optimizations.

- Memory Management
Allocating memory for machine code and managing it safely is tricky. You will also need to deal with garbage collection if your source language supports it.



##### Challenges:

- **Initial delay (warm-up time)** while the JIT compiles code.
Warm-up is the time taken for the Java application to reach the optimum compiled code performance. It is the task of the Just-in-Time (JIT) compiler to deliver optimal performance by producing optimized compiled code from application bytecode.

When people think of Java compilers, they usually think about javac, which turns your Java source code into Java bytecode. But equally important is JIT compilation, which turns your Java bytecode into optimized machine code for the specific hardware on which your Java program is running.

When you first start your Java program, the JVM takes the platform-independent bytecode and runs it in the interpreter, which takes more CPU resources and is slower to execute. After a certain number of invocations (default 1K), the method is promoted to a profiling tier, known as the Tier 1 compiler or C1. Here the JVM monitors the method to build a profile of how many times each method is called, with which code paths, and how they are executed in the profiled method. After the compile threshold is reached (default 10K), the JVM promotes the method to the Tier 2 compiler by putting it in the Tier 2 compile queue. The Tier 2 compiler uses the Tier 1 profile to compile methods into highly optimized machine code. See image below.

![Alt text](/documents/images/warming_up_jvm.png)



- **Memory overhead** due to storing both bytecode and machine code.

###### references

Good explanation: https://domiyanyue.medium.com/what-is-just-in-time-compilation-why-is-it-important-7d9df9ec25de

Another good explanation: https://medium.com/@sakshee_agrawal/understanding-just-in-time-jit-compilation-in-java-ae2a6b9fa931

article about single and multilevel jit: chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://dl.acm.org/doi/pdf/10.1145/2541228.2541229

warming up issue: https://docs.azul.com/prime/analyzing-tuning-warmup

Creating own JIT: https://github.com/spencertipping/jit-tutorial 

Creating own JIT: https://medium.com/@minhaz217/lets-understand-the-javascript-just-in-time-compiler-jit-and-how-the-v8-engine-works-ff6276d131a1 

[Go back to top](#table-of-contents)

---

#### 3. JIT Compiler Optimization Techniques (10-15 mins)
This part of the research will contain the phases that shows the optimization techinques the JIT compailer uses, there are some variations of JIT compilation depending on the programming languages. This will focus on the JAVA language:

##### Phase 1 - Inlining
Inlining is the process by which the trees of smaller methods are merged, or "inlined", into the trees of their callers. This speeds up frequently executed method calls. Two inlining algorithms with different levels of aggressiveness are used, depending on the current optimization level. Optimizations performed in this phase include:
- Trivial inlining
- Call graph inlining
- Tail recursion elimination
- Virtual call guard optimizations

##### Phase 2 - Local Optimizations
Local optimizations analyze and improve a small section of the code at a time. Many local optimizations implement tried and tested techniques used in classic static compilers. The optimizations include:
- Local data flow analyses and optimizations
- Register usage optimization
- Simplifications of Java idioms

These techniques are applied repeatedly, especially after global optimizations, which might have pointed out more opportunities for improvement.

##### Phase 3 - Control Flow Optimizations
Control flow optimizations analyze the flow of control inside a method (or specific sections of it) and rearrange code paths to improve their efficiency. The optimizations are:
- Code reordering, splitting, and removal
- Loop reduction and inversion
- Loop striding and loop-invariant code motion
- Loop unrolling and peeling
- Loop versioning and specialization
- Exception-directed optimization
- Switch analysis

##### Phase 4 - Global Optimizations
Global optimizations work on the entire method at once. They are more "expensive", requiring larger amounts of compilation time, but can provide a great increase in performance. The optimizations are:
- Global data flow analyses and optimizations
- Partial redundancy elimination
- Escape analysis
- GC and memory allocation optimizations
- Synchronization optimizations

##### Phase 5 - Native Code Generation
Native code generation processes vary, depending on the platform architecture. Generally, during this phase of the compilation, the trees of a method are translated into machine code instructions; some small optimizations are performed according to architecture characteristics. The compiled code is placed into a part of the JVM process space called the code cache; the location of the method in the code cache is recorded, so that future calls to it will call the compiled code. At any given time, the JVM process consists of the JVM executable files and a set of JIT-compiled code that is linked dynamically to the bytecode interpreter in the JVM.


##### references

jit optimization: https://www.ibm.com/docs/en/sdk-java-technology/8?topic=compiler-how-jit-optimizes-code 

[Go back to top](#table-of-contents)

---

#### 4. Comparing JIT Implementations (10 mins)

##### Java HotSpot JVM (Oracle):

- Hotspot compiler, tiered compilation, and garbage collection interaction.

##### .NET Core CLR (Microsoft):

- RyuJIT and how the .NET ecosystem utilizes JIT to improve managed code.

##### V8 Engine (Google Chrome):

- JIT in JavaScript engines, explaining how JIT allows dynamic languages like JavaScript to perform efficiently.

##### PyPy (Python):

- JIT in Python, and how it improves execution speed over the traditional CPython interpreter.

[Go back to top](#table-of-contents)

---

#### 5. Advantages and Disadvantages of JIT Compilation (5-10 mins)

##### Advantages:

- **Adaptive optimizations** based on actual usage.
- **Platform independence** (for languages like Java and C#).
- **Faster execution** after initial compilation.

##### Disadvantages:

- **Initial startup delay** due to JIT compilation.
- **Memory overhead** for both compiled and interpreted code.
- **Complexity** in development and debugging.`

##### JIT Compilation vs. AOT Compilation

JIT Compilation (Just-In-Time Compilation) and Ahead-of-Time (AOT) Compilation are two distinct approaches to compiling and executing code in software development. They each have their advantages and drawbacks. Let’s compare JIT Compilation and AOT Compilation in various aspects:

| **Aspect**                        | **JIT Compilation**                                                                 | **Ahead-of-Time (AOT) Compilation**                                                                 |
|-----------------------------------|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| **Compilation Timing**            | JIT Compilation occurs during runtime, just before code execution.                  | AOT Compilation happens before runtime, typically during the build process.                          |
| **Execution Speed**               | Initially slower due to compilation overhead. Improves as code is cached and optimized. | Generally faster at startup since code is already compiled.                                          |
| **Resource Usage**                | Requires memory and CPU resources during compilation.                               | Lower memory and CPU usage during execution, as no JIT compilation occurs.                           |
| **Portability**                   | Platform-independent bytecode is used, allowing for cross-platform compatibility.   | Platform-specific binaries are generated, which may limit portability.                               |
| **Start-Up Time**                 | Longer start-up times as compilation occurs at runtime.                             | Faster start-up times as code is precompiled.                                                        |
| **Adaptability to Runtime Changes**| Can adapt to runtime conditions by recompiling and optimizing code as needed.       | Requires recompilation and redeployment for code changes.                                            |
| **Development Workflow**          | Well-suited for development and debugging, as code changes are reflected immediately. | More suitable for deployment and distribution, as code is compiled and stable.                       |
| **Example Languages**             | Java, C#, JavaScript (in some cases)                                                | C, C++, Rust, Go, Swift, and many compiled languages.                                                |
| **Distribution**                  | Often used in interpreted or semi-compiled languages like Java and JavaScript.      | Commonly used in compiled languages for native or system-level applications.                         |


references: 

advantages and disadvantages: https://www.javacodegeeks.com/2023/09/just-in-time-jit-compilation-benefits-drawbacks-and-the-evolving-landscape.html 

[Go back to top](#table-of-contents)

---

#### 6. Real-World Use Cases of JIT (5-10 mins)

When thinking about what the use cases for the JIT compiler are, we have to understand the code of the software. JIT compilation is particularly beneficial in scenarios where code needs to be executed repeatedly or where runtime optimization is crucial. Some common use cases include

1. Virtual Machines: Many popular programming languages, such as Java, .NET, and Python, rely on JIT compilation to execute their programs efficiently. The JIT compiler in these virtual machines translates the bytecode into machine code, providing performance benefits without sacrificing portability.
2. Dynamic Languages: JIT compilation is especially advantageous for dynamic languages like JavaScript and Ruby. These languages often execute code that is generated or modified at runtime, and a JIT compiler can optimize this code based on the actual runtime behavior.
3. Gaming and Graphics: JIT compilation is widely used in gaming and graphics programming. It allows for real-time optimization of complex algorithms, such as rendering or physics simulations, to achieve smooth and responsive gameplay.

Web Browsers (JavaScript Engines)

Use Case: JavaScript engines (e.g., Google V8, Mozilla SpiderMonkey) in modern web browsers use JIT compilation to improve the execution speed of JavaScript code in web applications.
Benefit: It enhances performance by compiling frequently used functions to machine code during runtime, rather than interpreting JavaScript line-by-line.

2. Java Virtual Machine (JVM)
Use Case: The JVM uses JIT compilation for running Java applications. Initially, Java code is compiled to bytecode, which is platform-independent. At runtime, the JIT compiler translates bytecode to machine code for the host system.
Benefit: Improves performance by dynamically optimizing code execution based on runtime behavior, making Java programs run faster after the initial warm-up period.

As mentioned before, the JIT compiler compiles bytecode to machine code “just-in-time” for it to run. By default, the JIT compiler is enabled and is activated on the calling of a Java method. It can be disabled to check and diagnose Java compilation problems. For other reasons, it is not recommended as it may slow down your code by running it in interpreter-only mode. The JIT compiler helps optimise and maximise the performance of complex Java programs without consuming processor time and memory space. It also keeps track of operational data during runtime, which can be used to improve future recompilations.

3. .NET Framework (Common Language Runtime - CLR)
Use Case: The CLR for languages like C# and VB.NET uses JIT compilation to convert Microsoft Intermediate Language (MSIL) to native machine code during execution. To see the flow diagram below
Benefit: Ensures that the code is compiled for the specific hardware at runtime, allowing for better platform compatibility and optimization.

![Alt text](/documents/images/clr_runtime_flow.jpg)

4. Python (PyPy)
Use Case: PyPy, an alternative implementation of Python, uses a JIT compiler to accelerate the execution of Python programs by compiling frequently used sections of the code. See below an image of the differences between using dependecies with pypy and the cpython
Benefit: Enhances performance for Python, which is traditionally an interpreted language, making it suitable for computationally intensive tasks.

![Alt text](/documents/images/pypy_vs_cpython.png)


Few programming languages have been around for so long. Java started in 1995, and in 2023 it’s still among the top 3 languages. Research points to Java’s popularity as well: Stack Overflow, TIOBE index, and GitHub.

![Alt text](/documents/images/line_chart_most_popular_programming_languages.png)


In conclusion, a JIT compiler is a critical component of a programming language's runtime environment that dynamically translates and optimizes code just before execution. It offers performance improvements, adaptability, reduced memory footprint, and faster start-up times. JIT compilation finds extensive use in virtual machines, dynamic languages, and gaming and graphics programming.

##### Why Some Programs Don't Use JIT:
Simplicity: Interpreters are simpler to implement and can be easier to debug or deploy across platforms.
Performance Stability: AOT compilation can offer predictable performance without the warm-up time that JITs require to analyze and optimize the code.
Resource Constraints: In resource-constrained environments (e.g., embedded systems), JIT compilation can add overhead in terms of memory usage, startup time, and complexity.
Security Concerns: JIT compilation can introduce security vulnerabilities, especially in environments where memory execution is tightly controlled (e.g., iOS disallows JIT to improve security).

**C:** Programs written in C are typically compiled using a compiler like GCC or Clang into machine code for a specific platform. There’s no JIT compilation involved.
**C++:** Similar to C, C++ uses ahead-of-time compilation.
**Rust:** Rust uses an ahead-of-time compilation model (via LLVM) and does not use JIT compilation.
**Go:** Google's Go programming language uses a traditional AOT compilation model. Go programs are compiled directly to machine code.

##### what is next for JIT compiler?

Just-In-Time (JIT) Compilation is an evolving field in software development and runtime optimization. As technology advances and programming languages evolve, several future trends in JIT Compilation are emerging.

- Improved Code Performance: Future JIT compilers will continue to introduce advanced optimization techniques, resulting in even faster code execution. These optimizations may include enhanced loop unrolling, better inlining strategies, and smarter dead code elimination.

- Machine Learning-Driven Optimizations: Machine learning and artificial intelligence are increasingly being used to identify performance bottlenecks in code. JIT compilers may leverage these technologies to make data-driven decisions about code optimization.

###### references

use cases of jit compiler: https://startup-house.com/glossary/jit-compiler 

JVM using JIT compiler: https://www.naukri.com/code360/library/difference-between-jit-and-jvm

CLR: https://learn.microsoft.com/en-us/dotnet/standard/clr

pypy vs cpython: https://pypy.org/

future trends of jit: https://www.javacodegeeks.com/2023/09/just-in-time-jit-compilation-benefits-drawbacks-and-the-evolving-landscape.html 

Most popular languages: https://aristeksystems.com/blog/is-java-still-relevant/#:~:text=Java%20started%20in%201995%2C%20and,%2C%20TIOBE%20index%2C%20and%20GitHub.&text=Java%20is%20a%20cross%2Dplatform,that%20makes%20Java%20cross%2Dplatform.

[Go back to top](#table-of-contents)

---

#### 7. QUIZ (10 mins)

make quiz about the interpreter, compiler and jit compiler

also make compiler of some use cases we mentioned earler



#### 8. Interactive Demos (10-20 mins)

##### Live Coding:

- Show examples of running code with JIT optimizations in a language like Java or Python (PyPy).