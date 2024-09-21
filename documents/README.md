# Documentation
This document will contain all the documentation we made so far, it includes the proper chapters and references.


# Table of Contents

- [Project Management](#project-management)
  - [Module Description](#module-description)
  - [Agile Methodology](#agile-methodology)
  - [Project Board](#project-board)
  - [Assessment Scheduler](#assesment-scheduler)
  - [Planning for the Workshop and Research](#planning-for-the-workshop-and-research)
    - [JIT Compiler Workshop](#jit-compiler-workshop)
      - [1. Introduction to JIT Compilation (5-10 mins)](#1-introduction-to-jit-compilation-5-10-mins)
        - [What is a JIT Compiler?](#what-is-a-jit-compiler)
        - [Difference between JIT and AOT Compilation](#difference-between-jit-and-aot-compilation)
        - [Overview of Key Concepts](#overview-of-key-concepts)
      - [2. How a JIT Compiler Works (10-15 mins)](#2-how-a-jit-compiler-works-10-15-mins)
        - [Phases of JIT Compilation](#phases-of-jit-compilation)
        - [Advantages of JIT](#advantages-of-jit)
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

# Project Management

This part will containt all the work informations such as methodologies, delivares, deadlines, etc.

## Module Description

The module description can be found in this link: [module description](./images/md_esd.pdf). The module description contains all needed information of this module.

[Go back to top](#table-of-contents)

## Agile Methodology

For this course we are going to use a variation of Agile which only covers the springs and the small tasks.

[Go back to top](#table-of-contents)

## Project Board

We are going to use a project board which consists on 3 blocks(Backlog, In progress and Done) to keep in track all our process and to see on which tasks we are currently working on. See image below to see the project board structure

![Alt text](/documents/images/project_board.png)


[Go back to top](#table-of-contents)

## Assesment Scheduler

This is the schedule of all students workshop, the duration is of 90 minutes where the students should present their research work and give the audience a few code examples where they also can test the work of the students. see Image below.

![Alt text](/project_management/images/workshop_presentation_schedule.png)

[Go back to top](#table-of-contents)

## Planning for the Workshop and Research

### JIT Compiler Workshop

#### 1. Introduction to JIT Compilation (5-10 mins)

##### What is a JIT Compiler?

Just-in-time compilation is a method for improving the performance of interpreted programs. During execution the program may be compiled into native code to improve its performance. It is also known as dynamic compilation.

Traditionally there are two methods for converting source code into a form that can be run on a platform. Static compilation converts the code into a language for a specific platform. An interpreter directly executes the source code. To get more into details about how JIT compiler works we have to know the two normal coverters of source code(compiler and interpreter)

![Alt text](/documents/images/compiler_vs_interpreter.webp)


Compiler: A compiler that supports the source programming language reads the files, analyzes the code, and translates it into a format suitable for the target platform. Compilers that translate source code to machine code target specific operating systems and computer architectures. For example in Java, the process of compilation will look like the image below.

![Alt text](/documents/images/java_compilation_process.png)

Interpreter: An interpreter is a computer program that is used to directly execute program instructions written using one of the many high-level programming languages.

The interpreter transforms the high-level program into an intermediate language that it then executes, or it could parse the high-level source code and then performs the commands directly, which is done line by line or statement by statement.

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

What is a compiler: https://www.techtarget.com/whatis/definition/compiler#:~:text=A%20compiler%20that%20supports%20the,operating%20systems%20and%20computer%20architectures.

What is an interpreter: https://www.techopedia.com/definition/7793/interpreter

##### Difference between JIT and AOT Compilation:

- **JIT**: Code is compiled at runtime (e.g., Java, .NET CLR).
- **AOT**: Code is compiled before execution (e.g., C, C++).

##### Overview of Key Concepts:

- Explain bytecode, machine code, and interpreters, showing how JIT fits in.

[Go back to top](#table-of-contents)

---

#### 2. what is JIT compiler and How a it Works (10-15 mins)

##### Phases of JIT Compilation:

- **Interpretation phase**: Code is initially run by an interpreter.
- **Profiling phase**: The JIT monitors the performance of the code during execution.
- **Hot code detection**: The most frequently executed parts (hotspots) are compiled to machine code.
- **Machine code generation**: Hot code is compiled and executed natively.

##### Advantages of JIT:

- **Optimization at runtime**: Adaptations to the hardware or input-specific optimizations.
- **Faster execution for hot code**: Native code is faster than interpreted bytecode.

##### Challenges:

- **Initial delay (warm-up time)** while the JIT compiles code.
- **Memory overhead** due to storing both bytecode and machine code.

[Go back to top](#table-of-contents)

---

#### 3. JIT Compiler Optimization Techniques (10-15 mins)

##### Hotspot Optimization:

- Detecting frequently executed code segments (methods or loops).

##### Inlining:

- Avoiding function calls by replacing them with the function body.

##### Dead Code Elimination:

- Removing code that never gets executed.

##### Register Allocation and Optimization:

- Efficiently using CPU registers to avoid memory access.

##### Adaptive Optimization:

- The JIT can recompile code multiple times to improve performance based on runtime data.

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
- **Complexity** in development and debugging.

[Go back to top](#table-of-contents)

---

#### 6. Real-World Use Cases of JIT (5-10 mins)

##### JVM for Java Applications:

- Explain how JIT helps Java run efficiently across different platforms.

##### Game Engines (Unity/C#):

- Real-time rendering and execution often benefit from JIT optimizations.

##### Dynamic Languages (JavaScript, Python):

- JIT allows dynamic languages to compete with statically-typed languages in terms of performance.

[Go back to top](#table-of-contents)

---

#### 7. Interactive Demos (15-20 mins)

##### Live Coding:

- Show examples of running code with JIT optimizations in a language like Java or Python (PyPy).

##### Hotspot Example:

- Write a small
