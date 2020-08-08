%{
open Ast
%}

%token <int> INT
%token ADD SUBT MULT DIV EQU
%token EOF
%left EQU
%left ADD SUBT
%left MULT DIV

%start <Ast.phrase> prog

%%

prog:
|e = expr EOF { Expr e }

expr:
|e = s_expr { e }
|e1 = expr; ADD; e2 = expr { Binop (Func "+", e1, e2) }
|e1 = expr; SUBT; e2 = expr { Binop (Func "-", e1, e2) }
|e1 = expr; MULT; e2 = expr { Binop (Func "*", e1, e2) }
|e1 = expr; DIV; e2 = expr { Binop (Func "/", e1, e2) }
|e1 = expr; EQU; e2 = expr { Binop (Func "==", e1, e2) }

s_expr: 
| s = INT { Integer s }
