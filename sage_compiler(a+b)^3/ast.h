#pragma once
#include <string>
#include <memory>
#include <vector>

struct Expr {
    virtual ~Expr() = default;
};

struct BinaryExpr : Expr {
    std::string op;
    std::shared_ptr<Expr> left, right;
};

struct LiteralExpr : Expr {
    int value;
};

struct VariableExpr : Expr {
    std::string name;
};

struct Stmt {
    virtual ~Stmt() = default;
};

struct InputStmt : Stmt {
    std::string var;
};

struct AssignStmt : Stmt {
    std::string var;
    std::shared_ptr<Expr> expr;
};

struct PrintStmt : Stmt {
    std::string var;
};

struct MessageBoxStmt : Stmt {
    std::string var;
};