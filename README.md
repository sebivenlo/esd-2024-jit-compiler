<!-- # JIT Compiler

In computing, just-in-time (JIT) compilation (also dynamic translation or run-time compilations) is compilation (of computer code) during execution of a program (at run time) rather than before execution.

## Contents
Please make sure all artifacts are in this GitHub repository.  
That includes:

- Code
- Workshop materials
- Presentation (if applicable)
- References.
- Docker (compose) file (if applicable)


References:
-  Just In Time (JIT) Compilers - Computerphile  https://www.youtube.com/watch?v=d7KHAVaX_Rs
- Brandt Bucher – A JIT Compiler for CPython https://www.youtube.com/watch?v=HxSHIpEQRjs&t=1504s
- Interpreter/Compiler: https://ruslanspivak.com/lsbasi-part1/

Questions:
- What is a compiler and how is it different from an interpreter?
- Which type of languages can have JIT Compiler?
- Which languages do have JIT Compiler?
 - Answer: JAVA and C#
- What is the advantage of JIT Compiler?
- What is the disadvantage of JIT Compiler?
- Visualise Languages: Rust, Typescript, Javascript, Python, C, Java (Venn Diagram)

Todo:
- Reproduce the tutorial from Computerphile
- Inclusive creating an Docker image for this.
- PHP Version 8.0 compare with lower version (without JIT) -->

# Project Workshop ESD 

This repository is part of the ESD (Enterprise Software Development) module, where students investigate various architectural aspects, technologies, frameworks, or business technologies with architectural implications. The aim is to analyze and present these topics—highlighting both their strengths and weaknesses—in a workshop setting attended by the rest of the class.

> In this module the students investigate [...] an [topic] with architectural implications, for good or bad, and present their findings and learnings in a workshop [...].
> - LG 1 - investigate aspects of [topic].
> - LG 2 - prepare and execute a workshop to introduce the technology to peers (flip the classroom with preparation of exercises).
> - LG 3 - [...]
>
> The grading will be done based on the Presentation/Workshop, research, and material the students provide to the other students and lecturers.

Source: Module Description


## Table of Contents

- [documents](./documents)
- [implementation](./implementation)
- [project_management](./roject_management)

### Team members 

- Jorge Arauz 
- Thijs Hofmans

### Project/workshop Description

This project focuses on exploring the Just-In-Time (JIT) Compiler, a powerful optimization technique used in modern programming languages to achieve a balance between interpretation and compilation. Unlike traditional compilers, which translate source code into machine code before execution, JIT compilers work dynamically, compiling code during runtime. This means JIT combines the advantages of interpretation (immediate execution) with those of compilation (performance optimization).

#### Why We Chose the JIT Compiler
We chose to focus on the JIT compiler because of its fascinating ability to compile and interpret code simultaneously. This hybrid approach allows for more flexible, adaptive execution, which results in significant performance improvements for many types of applications.

JIT compilers are particularly interesting due to:

Dynamic Optimization: JIT compilers can analyze the code while it runs, optimizing frequently executed paths for better performance.
Balance of Flexibility and Speed: While interpreted code is easy to work with, compiled code is faster. JIT blends the two, making it a compelling solution for performance-sensitive applications.
Real-world Usage: Technologies like the Java Virtual Machine (JVM), JavaScript engines (like V8), and .NET's Common Language Runtime (CLR) all utilize JIT compilation, making it a crucial component of modern software systems.
By diving into the inner workings of JIT compilers, we aim to gain a deeper understanding of how runtime compilation works and explore its applications in various programming languages and frameworks.

## Audience

Our audience are 4th year Informatics students. They learned Java in PRC1/PRC2/ALDA. Learned C programming in OSCO. And in projects learned about Javascript/TypeScript. In Data Science, and maybe internship/minor learned about Python. In PRC1 or PRC2, they learned about the Java Architecture, like the JVM.

## Workshop
Training workshops are designed to teach new skills or knowledge to attendees. The goal of a training workshop is to provide attendees with the knowledge and skills they need to perform a specific task or function. Activities in a training workshop might include lectures, demonstrations, hands-on practice, and group discussions. Source: https://makeiterate.com/how-to-plan-a-workshop-a-quick-and-easy-guide/
