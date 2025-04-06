#include "tokenizer.h"
#include <cctype>

std::vector<Token> tokenize(const std::string& input) {
    std::vector<Token> tokens;
    size_t i = 0;
    while (i < input.size()) {
        if (isspace(input[i])) { ++i; continue; }
        if (isalpha(input[i])) {
            std::string id;
            while (isalnum(input[i])) id += input[i++];
            tokens.push_back({id == "input" || id == "let" || id == "print" || id == "messagebox" ? TokenType::Keyword : TokenType::Identifier, id});
        } else if (isdigit(input[i])) {
            std::string num;
            while (isdigit(input[i])) num += input[i++];
            tokens.push_back({TokenType::Number, num});
        } else {
            tokens.push_back({TokenType::Symbol, std::string(1, input[i++])});
        }
    }
    return tokens;
}