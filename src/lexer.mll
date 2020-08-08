{
  open Parser
  open Lexing

  exception Syntax_error

}

let white   = [' ' '\t']+
let digit   = ['0'-'9']
let integer = '-'? digit+
let letter  = ['a'-'z' 'A'-'Z' '_' ]

rule read =
parse
|white { read lexbuf }
|integer { INT (int_of_string (Lexing.lexeme lexbuf)) }
|eof { EOF }
|_ { raise (Syntax_error ) }