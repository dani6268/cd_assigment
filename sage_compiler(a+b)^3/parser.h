#pragma once
#include "tokenizer.h"
#include <memory>
#include <vector>

struct Expr;
struct Stmt;
using StmtPtr = std::shared_ptr<Stmt>;
using ExprPtr = std::shared_ptr<Expr>;

std::vector<StmtPtr> parse(const std::vector<Token>& tokens);