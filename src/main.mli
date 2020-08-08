open Ast

(** [Main_Sig] is an abstract module type for running, interpreting, evaluating 
    and relaying the result of the phrase inputted by the client on the command
    line *)
module type Main_Sig = sig

  (**  [interp s] interprets [s]. The CAMLCALC uses this to
       interpret input from the user. *)
  val interp : string -> string

  (** [run () ] begins the execution of CAMLCALC *)
  val run : unit -> unit
end

(** [Main] is a module that implelments the function values defined in 
    [Main_Sig] *)
module Main : Main_Sig