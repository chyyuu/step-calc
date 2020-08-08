%{
open Ast
%}

%token <int> INT
%token ADD SUBT
%token EOF
%left ADD SUBT

%start <Ast.phrase> prog

%%

prog:
|e = expr EOF { Expr e }

expr:
|e = s_expr { e }
|e1 = expr; ADD; e2 = expr { Binop (Func "+", e1, e2) }
|e1 = expr; SUBT; e2 = expr { Binop (Func "-", e1, e2) }

s_expr: 
| s = INT { Integer s }
