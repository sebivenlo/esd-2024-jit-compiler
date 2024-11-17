
# LLVM and JIT Compilation Assignment

## Background

### What is LLVM?
LLVM is a powerful compiler infrastructure that provides a set of reusable tools for building compilers, interpreters, and Just-In-Time (JIT) compilation engines. Originally designed for static compilation, LLVM has evolved into a flexible framework for dynamic code generation and optimization. 

[![](https://mermaid.ink/img/pako:eNqNkd1rgzAQwP-VEF82qgzqKlsGg9EyGOiLhT0MX64m0bBoJB-olP7vS2s_EDbYPR13v1_uyO1xqSjDBHOp-rIGbVGaFy3yUUowZsM4ktBWDiqGuJCSBPyZh8Zq9c1IEMfxOY96QW1NHrvhZdKNHSVDgi7P2m5303iSzLVlN4SlkkqT4N3HpUnB-JU0jASt0Gp6d9sLbgkh162iKHo9zrlL088MRegjv5_I9cN6sZiTv4O5M_Y_3Lx2woan5M_eW57hEDdMNyCo_-L9kSywrVnDCkx8ShkHJ22Bi_bgUXBWbce2xMRqx0LsOgqWbQRUGhpMOEjjq4wKq3Q2ne10vRBr5ar6SnTQfil1MQ4_xyiWeg?type=png)](https://mermaid.live/edit#pako:eNqNkd1rgzAQwP-VEF82qgzqKlsGg9EyGOiLhT0MX64m0bBoJB-olP7vS2s_EDbYPR13v1_uyO1xqSjDBHOp-rIGbVGaFy3yUUowZsM4ktBWDiqGuJCSBPyZh8Zq9c1IEMfxOY96QW1NHrvhZdKNHSVDgi7P2m5303iSzLVlN4SlkkqT4N3HpUnB-JU0jASt0Gp6d9sLbgkh162iKHo9zrlL088MRegjv5_I9cN6sZiTv4O5M_Y_3Lx2woan5M_eW57hEDdMNyCo_-L9kSywrVnDCkx8ShkHJ22Bi_bgUXBWbce2xMRqx0LsOgqWbQRUGhpMOEjjq4wKq3Q2ne10vRBr5ar6SnTQfil1MQ4_xyiWeg)


### What is IR (Intermediate Representation)?
IR stands for Intermediate Representation. It serves as a bridge between high-level programming languages and low-level machine code. LLVM's IR is:
- **Platform-independent**: It abstracts hardware-specific details, making it easy to target multiple architectures.
- **Optimization-friendly**: LLVM applies advanced optimizations on IR before converting it to machine code.

### Where is LLVM Used Today?
1. **Compilers**:
   - Clang, the C/C++/Objective-C compiler, is built on LLVM.
   - Swift, Rust, Julia, and other modern languages also leverage LLVM.
2. **JIT Compilation**:
   - Languages like Python (via PyPy), JavaScript (via WebAssembly engines), and Julia use LLVM for runtime code generation.

---

## Assignment: Build a Simple JIT Compiler with LLVM
Navigate to the correct folder

    cd /workspaces/esd-2024-jit-compiler/workshop/python/llvm

Run

      python3 llvm.py

Analyse what happened, and how IR (Intermediate Representation) works.


### Resources
1. [LLVM Project Homepage](https://llvm.org)
2. [llvmlite Documentation](https://llvmlite.readthedocs.io/)

Back to [challenges overview](/README.md)