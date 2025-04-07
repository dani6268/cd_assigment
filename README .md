🧠 Sage Compiler

A simple compiler project that parses a custom language (with a .sage extension) and generates assembly code. The compiler translates basic arithmetic and I/O operations into NASM-compatible assembly. The generated assembly is then assembled using NASM and linked with GoLink to create a Windows executable.

-------------------------------------------------------------------------------------------------------------------------------------------

🚀 Project Overview

The Sage Compiler demonstrates how to:

🧩 Tokenize source code from a custom language.

🌲 Parse tokens into an Abstract Syntax Tree (AST).

🛠️ Generate assembly code from the AST.

🏗️ Build and link the assembly code into a runnable executable.

The project supports simple arithmetic expressions such as computing the expansion of  as well as basic input/output operations.

-------------------------------------------------------------------------------------------------------------------------------------------

📁 File Structure

asmgen.cpp / asmgen.h🛠️ - Responsible for generating NASM-compatible assembly code based on the AST structure.

ast.h🌿 - Contains the definition of various expression (Expr) and statement (Stmt) node types used in the AST.

build.bat⚙️ - Batch script to compile the C++ compiler components and then assemble/link the output using NASM and GoLink.

codegen.cpp / codegen.h✍️ - An alternative approach to generating assembly directly from expressions, used for testing or development.

example.sage🧪 - Sample Sage language source file demonstrating input, output, and arithmetic operations.

main.cpp🧵  - The main entry point. It reads .sage code, tokenizes, parses, and calls the assembly generator.

parser.cpp / parser.h🧱 - Stubs for converting tokens into an AST. Placeholder for future implementation.

program.asm🧾 - An example of a fully written assembly file produced by the compiler.

tokenizer.cpp / tokenizer.h🔍 - Code responsible for lexical analysis (turning raw source code into a stream of tokens).

golink.exe🧰 - GoLink executable used for linking the compiled assembly into a runnable .exe file on Windows.

marcos.inc🧩 - Contains NASM macros for operations like computing volume, cube expansions, etc.

program.exe / program.obj / sage.exe / sage_compiler.exe📦 - Generated binary files: object code, executable, and compiler builds.

-------------------------------------------------------------------------------------------------------------------------------------------

🛠️ Build Instructions

Compile the Compiler:

build.bat

Generate Assembly:

SageCompiler.exe

Assemble the Generated Code:

nasm -f win32 Program.asm -o Program.obj

Link the Object File:

GoLink /console Program.obj user32.dll kernel32.dll msvcrt.dll

🧪 Usage

Input File:Edit example.sage to modify the logic or output format.

Run Compiler:Execute SageCompiler.exe to produce Program.asm.

Run Final Program:After assembly and linking, run the executable to view results in the console and a MessageBox.

-------------------------------------------------------------------------------------------------------------------------------------------

📦 Dependencies

💻 C++ Compiler: g++

🧱 Assembler: NASM

🔗 Linker: GoLink

🪟 Windows Libraries: user32.dll, kernel32.dll, msvcrt.dll

-------------------------------------------------------------------------------------------------------------------------------------------

🔗 Repository

Explore the project and source code on GitHub:👉 https://github.com/dani6268/cd_assigment

