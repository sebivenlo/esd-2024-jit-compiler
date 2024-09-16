
- [back](#/)

# Project Management

This part will containt all the work informations such as methodologies, delivares, deadlines, etc.

## Agile methodology

For this course we are going to use a variation of Agile which only covers the springs and the small tasks

## Project board

We are going to use a project board which consists on 3 blocks(Backlog, In progress and Done) to keep in track all our process and to see on which tasks we are currently working on.

## Planning for the workshop and research

### JIT Compiler Workshop

#### 1. Introduction to JIT Compilation (5-10 mins)

### What is a JIT compiler?
- Explain that JIT compilers are part of runtime environments that compile code on-the-fly during execution, instead of ahead-of-time (AOT).

#### Difference between JIT and AOT compilation:
- **JIT**: Code is compiled at runtime (e.g., Java, .NET CLR).
- **AOT**: Code is compiled before execution (e.g., C, C++).

#### Overview of key concepts:
- Explain bytecode, machine code, and interpreters, showing how JIT fits in.

---

### 2. How a JIT Compiler Works (10-15 mins)

#### Phases of JIT Compilation:
- **Interpretation phase**: Code is initially run by an interpreter.
- **Profiling phase**: The JIT monitors the performance of the code during execution.
- **Hot code detection**: The most frequently executed parts (hotspots) are compiled to machine code.
- **Machine code generation**: Hot code is compiled and executed natively.

#### Advantages of JIT:
- **Optimization at runtime**: Adaptations to the hardware or input-specific optimizations.
- **Faster execution for hot code**: Native code is faster than interpreted bytecode.

#### Challenges:
- **Initial delay (warm-up time)** while the JIT compiles code.
- **Memory overhead** due to storing both bytecode and machine code.

---

### 3. JIT Compiler Optimization Techniques (10-15 mins)

#### Hotspot Optimization:
- Detecting frequently executed code segments (methods or loops).

#### Inlining:
- Avoiding function calls by replacing them with the function body.

#### Dead code elimination:
- Removing code that never gets executed.

#### Register allocation and optimization:
- Efficiently using CPU registers to avoid memory access.

#### Adaptive optimization:
- The JIT can recompile code multiple times to improve performance based on runtime data.

---

### 4. Comparing JIT Implementations (10 mins)

#### Java HotSpot JVM (Oracle):
- Hotspot compiler, tiered compilation, and garbage collection interaction.

#### .NET Core CLR (Microsoft):
- RyuJIT and how the .NET ecosystem utilizes JIT to improve managed code.

#### V8 Engine (Google Chrome):
- JIT in JavaScript engines, explaining how JIT allows dynamic languages like JavaScript to perform efficiently.

#### PyPy (Python):
- JIT in Python, and how it improves execution speed over the traditional CPython interpreter.

---

### 5. Advantages and Disadvantages of JIT Compilation (5-10 mins)

#### Advantages:
- **Adaptive optimizations** based on actual usage.
- **Platform independence** (for languages like Java and C#).
- **Faster execution** after initial compilation.

#### Disadvantages:
- **Initial startup delay** due to JIT compilation.
- **Memory overhead** for both compiled and interpreted code.
- **Complexity** in development and debugging.

---

### 6. Real-World Use Cases of JIT (5-10 mins)

#### JVM for Java applications:
- Explain how JIT helps Java run efficiently across different platforms.

#### Game Engines (Unity/C#):
- Real-time rendering and execution often benefit from JIT optimizations.

#### Dynamic Languages (JavaScript, Python):
- JIT allows dynamic languages to compete with statically-typed languages in terms of performance.

---

### 7. Interactive Demos (15-20 mins)

#### Live Coding:
- Show examples of running code with JIT optimizations in a language like Java or Python (PyPy).

#### Hotspot Example:
- Write a small function, show how the interpreter handles it initially, and then how JIT optimizes it as the function is called repeatedly.

#### Performance Profiling:
- Use a profiling tool (like VisualVM for Java) to show how hotspots are identified and optimized.

#### Comparing JIT vs AOT Performance:
- Provide a small benchmark (like a loop or recursive function) and compare how long it takes to run in a JIT-compiled language versus a natively compiled language.

---

### 8. Common Challenges in JIT Design (5-10 mins)

#### Startup Time:
- Addressing the warm-up issue where JIT compilers initially run slower than AOT.

#### Security Considerations:
- Dynamic code generation poses additional security risks, like the introduction of vulnerabilities.

#### Multithreading and Concurrency:
- Ensuring JIT optimizations work efficiently in multi-threaded environments.

---

### 9. Future of JIT Compilation (5 mins)

#### Advances in hardware (e.g., AI, GPU optimizations):
- Discuss how future architectures could further enhance JIT compilation.

#### WebAssembly (Wasm):
- How JIT compilation is being applied to WebAssembly, enabling near-native speed for web applications.

#### Machine Learning and JIT:
- The use of machine learning to predict code paths and further optimize JIT compilation.

---

### 10. Q&A and Discussion (10-15 mins)
- Open the floor for questions, clarifications, or a deep dive into a specific aspect of JIT that the audience is curious about.

---

### Resources and Tools for the Workshop:

- **Languages**: Examples from Java (JVM), Python (PyPy), JavaScript (V8 engine), or C# (.NET Core).
- **Profiling Tools**: VisualVM for Java, BenchmarkDotNet for C#, Chrome Developer Tools for JavaScript.
- **Visual Aids**: Use diagrams to explain the compilation process, code lifecycle (bytecode -> machine code), and optimization techniques.

---

### Bonus: Hands-On Session or Code Challenges (optional):

- Set up a small programming challenge where participants can explore how JIT improves the performance of their code over repeated execution.
