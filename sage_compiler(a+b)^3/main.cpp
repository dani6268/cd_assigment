#include "tokenizer.h"
#include "parser.h"
#include "asmgen.h"
#include <fstream>
#include <iostream>

int main() {
    std::ifstream input("example.sage");
    std::string code((std::istreambuf_iterator<char>(input)), std::istreambuf_iterator<char>());

    auto tokens = tokenize(code);
    auto ast = parse(tokens);
    std::ofstream out("Program.asm");
    generateAssembly(ast, out);
    std::cout << "Compilation finished.\n";
    return 0;
}