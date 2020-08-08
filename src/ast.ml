(** THE CAMLCALC ABSTRACT SYNTAX TREE TYPE*)

(** [value] is the type of CAMLCALC values *)
type value =
  |VInteger of int
  |VBinop of string

(** The types [bop], [unop] are used by the parser to recognize
    binary operations and unary operations *)

and
  bop =
  |Func of string

and 
  unop = 
  |Func_u of string

(** [expr] is the type of the AST for expressions parsed by CAMLCALC *)
and expr =
  |Integer of int
  |Binop of bop * expr * expr
  |Unop of unop * expr

(** [phrase] is the type of the AST for phrases parsed by CAMLCALC *)
and phrase = 
  | Expr of expr
