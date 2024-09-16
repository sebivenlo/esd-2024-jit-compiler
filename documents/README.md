
Go back - [root](#)

# Frequently Asked Questions (FAQ)

## 1. What is a compiler and how is it different from an interpreter?

A **compiler** is a program that translates source code written in a high-level programming language into machine code or an intermediate code that can be executed by a computer's processor. The key point is that the entire code is translated before execution starts.

An **interpreter**, on the other hand, translates and executes code line by line. It reads each instruction, interprets it, and immediately executes it without converting the entire program into machine code beforehand.

### Differences between Compiler and Interpreter:

| Feature                 | Compiler                           | Interpreter                         |
|-------------------------|------------------------------------|-------------------------------------|
| Translation Process      | Translates entire program at once  | Translates code line by line        |
| Execution                | Executes the compiled code         | Executes each line immediately      |
| Speed                    | Faster execution after compilation | Slower due to line-by-line execution|
| Error Detection          | Detects errors after full compilation | Stops and reports errors immediately |
| Output                   | Produces a standalone executable   | No standalone executable produced   |

---

## 2. Which type of languages can have a JIT Compiler?

Languages that are executed by a **virtual machine** or are dynamically interpreted often have a JIT (Just-In-Time) compiler. JIT compilers typically sit between pure interpreted and fully compiled languages, compiling code during runtime for better performance. 

These languages tend to be **bytecode-based**, where code is first compiled into an intermediate bytecode (by a traditional compiler) and then executed by a virtual machine (which uses the JIT compiler to optimize the bytecode at runtime).

---

## 3. Which languages do have a JIT Compiler?

Several modern programming languages use JIT compilers to optimize performance. Some examples include:

- **Java** (via the JVM - Java Virtual Machine)
- **C#** (via .NET's CLR - Common Language Runtime)
- **JavaScript** (in engines like Google's V8, Mozilla's SpiderMonkey)
- **Python** (via PyPy, an alternative Python interpreter)
- **Ruby** (via JRuby or YARV)
- **Kotlin** (on JVM)

---

## 4. What is the advantage of a JIT Compiler?

The primary advantage of a **JIT Compiler** is **runtime performance optimization**. By compiling code during execution, the JIT compiler can:

- **Optimize hot paths**: Frequently executed parts of the code are identified and optimized.
- **Adaptive optimization**: The compiler can adapt to real-time data and execution environments, improving efficiency based on actual usage.
- **Faster execution than interpretation**: JIT-compiled code often runs faster than purely interpreted code since the compilation happens during runtime.

---

## 5. What is the disadvantage of a JIT Compiler?

While JIT compilers provide performance benefits, they also come with some disadvantages:

- **Higher memory consumption**: The need to store both bytecode and generated machine code can increase memory usage.
- **Slower startup time**: Since the code is compiled during runtime, the initial execution of the program might be slower compared to fully compiled languages.
- **Complexity**: Implementing and maintaining a JIT compiler adds complexity to the virtual machine or runtime environment.

---

## 6. Visualisation of Languages (Venn Diagram)

Below is a conceptual visualisation of where different languages (Rust, TypeScript, JavaScript, Python, C, Java) fit in terms of whether they are compiled, interpreted, or use JIT compilation:

```plaintext
                +----------------------+
                |    Compiled           |
                |                      |
        +-------+-------+    +----------+-------+
        | Rust  | C     |    | Java             |
        |       |       |    | (JIT)            |
        +-------+-------+    +----------+-------+
                |                          |
                |     JIT Compiled         |
                |                          |
+---------------+--------------+ +---------+-------------+
|               | JavaScript    | | Python                |
| TypeScript    | (JIT)         | | (PyPy JIT)            |
| (JIT)         |               | |                       |
+---------------+---------------+ +-----------------------+
                |   Interpreted               |
                +-----------------------------+
