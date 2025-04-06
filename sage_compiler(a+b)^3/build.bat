g++ main.cpp tokenizer.cpp parser.cpp ast.cpp asmgen.cpp -o SageCompiler.exe
SageCompiler.exe
nasm -f win32 Program.asm -o Program.obj
GoLink /console Program.obj user32.dll kernel32.dll msvcrt.dll