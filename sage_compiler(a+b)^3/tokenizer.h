#pragma once
#include <string>
#include <vector>

enum class TokenType {
    Identifier, Number, Keyword, Symbol
};

struct Token {
    TokenType type;
    std::string value;
};

std::vector<Token> tokenize(const std::string& input);

