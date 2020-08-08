open Ast
open Stdlib
open Lexing
open Printf

module type Main_Sig = sig
  val interp : string -> string
  val run : unit -> unit
end

module Main = struct

  (** Exceptions for errors in parsing phrases input by the user *)
  exception SyntaxError of string
  exception UnexpectedError of string

  (** [parse_error lexbuf] is the error to raise when parser/lexeing raises
      a parsing or lexing error *)
  let parse_error lexbuf = raise (SyntaxError "Syntax error, please try again")

  (** [unexp_error lexbuf] is the error to raise when parser/lexeing fails *)
  let unexp_err lexbuf = raise
      (UnexpectedError "Unexepcted error, please try again")

  (** [parse parser_start s] parses [s] as a phrase using [parser_start] *)
  let parse parser_start s =
    let lexbuf = from_string s in
    try parser_start Lexer.read lexbuf with
    | Parser.Error | Lexer.Syntax_error -> parse_error lexbuf
    | Failure s -> unexp_err s

  (** [parse_phrase s] parses [s] as a phrase *)
  let parse_phrase = parse Parser.prog

  (** [string_of_value v] is the string representation of value [v] *)
  let string_of_value  = function
    |VInteger s -> string_of_int s

  (** [step expr] is the [value] where [expr] steps to [value] *)
  let rec step  expr =
    match expr with
    | Integer x -> VInteger (x)

  (** [eval_phrase exp] evaluates [exp] *)
  let rec eval_phrase exp =
    match exp with
    |Expr e -> step e


  (** [interp s] interprets [s] by parsing and evaluating it. *)
  let interp (s : string)  : string =
    try (
      let expr = s |> parse_phrase |> eval_phrase in
      let v' = expr in
      let str = string_of_value v' in
      str
    )
    with
    |SyntaxError s |Failure s -> s

  let rec main () =
    print_string ">";
    match String.trim (String.lowercase_ascii (read_line())) with
    |"quit" -> ()
    |"clear" -> let _ = Unix.system "clear" in main ()
    |"help" -> print_endline "Please try commands"; main ()
    |e ->
          match interp e with
          |exception Not_found -> 
            print_endline "Not a valid command please try again";
            main ()
          |s -> print_endline s;
            print_endline "";
            main () 

  let run = fun () ->
    print_string
      "Welcome to CAMLCALC...type \"help\" if you are unsure of where to begin\n";
    main ()
end