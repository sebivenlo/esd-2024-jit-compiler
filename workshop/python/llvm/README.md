
# LLVM and JIT Compilation Assignment

## Background

### What is LLVM?
LLVM (Low-Level Virtual Machine) is a powerful compiler infrastructure that provides a set of reusable tools for building compilers, interpreters, and Just-In-Time (JIT) compilation engines. Originally designed for static compilation, LLVM has evolved into a flexible framework for dynamic code generation and optimization. 

### What is IR (Intermediate Representation)?
IR stands for Intermediate Representation. It serves as a bridge between high-level programming languages and low-level machine code. LLVM's IR is:
- **Platform-independent**: It abstracts hardware-specific details, making it easy to target multiple architectures.
- **Optimization-friendly**: LLVM applies advanced optimizations on IR before converting it to machine code.
- **Readable and modular**: LLVM IR is human-readable, making it easier to debug and analyze.

### Where is LLVM Used Today?
LLVM powers a variety of applications in both industry and academia:
1. **Compilers**:
   - Clang, the C/C++/Objective-C compiler, is built on LLVM.
   - Swift, Rust, Julia, and other modern languages also leverage LLVM.
2. **JIT Compilation**:
   - Languages like Python (via PyPy), JavaScript (via WebAssembly engines), and Julia use LLVM for runtime code generation.
3. **Graphics and Game Development**:
   - LLVM is used in shading languages and real-time rendering pipelines.
4. **High-Performance Computing (HPC)**:
   - Scientific computing libraries and tools often use LLVM to generate highly optimized code.
5. **Machine Learning**:
   - Frameworks like TensorFlow XLA use LLVM for efficient kernel generation.

---

## Assignment

### Objective
This assignment is designed to help you:
1. Understand the basics of LLVM and its IR.
2. Learn about JIT compilation using LLVM.
3. Implement a hands-on task to experience LLVM's capabilities.

---
### Task 1: Build a Simple JIT Compiler with LLVM
Navigate to the correct folder

    cd workspaces/esd-2024-jit-compiler/workshop/python/llvm

Run

      python3 llvm.py

Analyse what happened, and how IR works.

### Task 2: Build a Simple JIT Compiler with LLVM

#### Steps:
1. **Parse an Arithmetic Expression**:
   - Create a parser for basic arithmetic expressions like `3 + 5 * 2`.
   - Convert the expression into an Abstract Syntax Tree (AST).

2. **Generate LLVM IR**:
   - Translate the AST into LLVM IR using the `llvmlite` Python library.
   - Example IR for `3 + 5`:
     ```llvm
     define i32 @main() {
     entry:
       %1 = add i32 3, 5
       ret i32 %1
     }
     ```

3. **Optimize the IR**:
   - Apply LLVM optimization passes to improve performance (e.g., constant folding).

4. **Execute with a JIT Engine**:
   - Compile and execute the LLVM IR at runtime using a JIT engine.

5. **Benchmark Performance**:
   - Compare the execution time of optimized vs. non-optimized IR.


### Resources
1. [LLVM Project Homepage](https://llvm.org)
2. [llvmlite Documentation](https://llvmlite.readthedocs.io/)
3. [LLVM IR Language Reference](https://llvm.org/docs/LangRef.html)
4. [JIT Compilation Overview](https://en.wikipedia.org/wiki/Just-in-time_compilation)

