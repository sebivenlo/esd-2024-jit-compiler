# Java bytecode

Navigate to the correct folder

    cd workspaces/esd-2024-jit-compiler/workshop/java/

### Compile to Bytecode
Run the command

    javac SimpleCalculator.java

This will create a new file called SimpleCalculator.class

### Analyse Bytecode
For this we use javap - "The Java Class File Disassembler" (p stands for print)

    javap -c SimpleCalculator > output_java.txt

See how the bytecode works!

Questions:
* Is the Java bytecode already optimised by JIT?
* Is the bytecode statically or dynamically typed?
