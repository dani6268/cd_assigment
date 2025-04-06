#pragma once
#include "ast.h"
#include <vector>
#include <ostream>

void generateAssembly(const std::vector<std::shared_ptr<Stmt>>& ast, std::ostream& out);