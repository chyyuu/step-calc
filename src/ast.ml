(** THE CAMLCALC ABSTRACT SYNTAX TREE TYPE*)

(** [value] is the type of CAMLCALC values *)
type value =
  |VInteger of int

(** [expr] is the type of the AST for expressions parsed by CAMLCALC *)
and expr =
  |Integer of int

(** [phrase] is the type of the AST for phrases parsed by CAMLCALC *)
and phrase = 
  | Expr of expr
