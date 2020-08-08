%{
open Ast
%}

%token <int> INT
%token EOF

%start <Ast.phrase> prog

%%

prog:
|e = expr EOF { Expr e }

expr:
|e = s_expr { e }

s_expr: 
| s = INT { Integer s }
