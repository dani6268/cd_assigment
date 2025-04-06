# 🧠 Sage Compiler

A simple compiler project that parses a custom language (with a `.sage` extension) and generates assembly code. The compiler translates basic arithmetic and I/O operations into NASM-compatible assembly. The generated assembly is then assembled using NASM and linked with GoLink to create a Windows executable.

## 🚀 Project Overview

The Sage Compiler demonstrates how to:
- 🧩 Tokenize source code from a custom language.
- 🌲 Parse tokens into an Abstract Syntax Tree (AST).
- 🛠️ Generate assembly code from the AST.
- 🏗️ Build and link the assembly code into a runnable executable.

The project supports simple arithmetic expressions such as computing the expansion of \((a + b)^3 = a^3 + 3a^2b + 3ab^2 + b^3\) as well as basic input/output operations.

## 📁 File Structure

- **asmgen.cpp / asmgen.h**  
  🛠️ Assembly code generation from the AST.

- **ast.h**  
  🌿 Defines the structure of expressions and statements.

- **build.bat**  
  ⚙️ Script to build and link the compiler and generated assembly.

- **codegen.cpp / codegen.h**  
  ✍️ Alternate codegen interface for expression-to-assembly conversion.

- **example.sage**  
  🧪 Sample Sage source file for testing.

- **main.cpp**  
  🧵 Entry point tying together the compiler pipeline.

- **parser.cpp / parser.h**  
  🧱 Stub for parsing tokens into an AST.

- **program.asm**  
  🧾 Sample generated assembly output.

- **tokenizer.cpp / tokenizer.h**  
  🔍 Tokenizes the input `.sage` source.

## 🛠️ Build Instructions

1. **Compile the Compiler:**

   ```bat
   build.bat
   ```

2. **Generate Assembly:**

   ```bat
   SageCompiler.exe
   ```

3. **Assemble the Generated Code:**

   ```bat
   nasm -f win32 Program.asm -o Program.obj
   ```

4. **Link the Object File:**

   ```bat
   GoLink /console Program.obj user32.dll kernel32.dll msvcrt.dll
   ```

## 🧪 Usage

- **Input File:**  
  Edit `example.sage` to modify the logic or output format.

- **Run Compiler:**  
  Execute `SageCompiler.exe` to produce `Program.asm`.

- **Run Final Program:**  
  After assembly and linking, run the executable to view results in the console and a MessageBox.

## 📦 Dependencies

- 💻 **C++ Compiler:** g++
- 🧱 **Assembler:** NASM
- 🔗 **Linker:** GoLink
- 🪟 **Windows Libraries:** user32.dll, kernel32.dll, msvcrt.dll

## 🔗 Repository

Explore the project and source code on GitHub:  
👉 [https://github.com/dani6268/cd_assigment](https://github.com/dani6268/cd_assigment)
