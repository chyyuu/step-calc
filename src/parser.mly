%{
open Ast
%}

%token <int> INT
%token ADD
%token EOF
%left ADD

%start <Ast.phrase> prog

%%

prog:
|e = expr EOF { Expr e }

expr:
|e = s_expr { e }
|e1 = expr; ADD; e2 = expr { Binop (Func "+", e1, e2) }

s_expr: 
| s = INT { Integer s }
