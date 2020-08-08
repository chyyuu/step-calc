open Ast

(** An abstract module type that is meant to structure the CFU modules 
    A module that matches [CFU_sig] is suitable for use in the [Imports] 
    module. *)
module type CFU_sig = sig

  (** An [operation_list] is an association list that maps operation 
      symbols to functions *)
  val operation_list : (string * ( value  list -> value )) list

end

(** A module that implements the functions needed for the arithmetic cfu. 
    A module that matches [Arithmetic_Funcs] is suitable for use in
     [Arithmetic_CFU]. *)
module type Arithmetic_Funcs = sig

  (** [add s] is the result of adding the first element of [s] to the
      second element of [s]. *)
  val add : value list -> value

  (** [subtract s] is the result of subtracting the first element of [s]
      from the second element of [s]. *)
  val subtract : value list -> value
end

(** A module that implements all the function values defined in module type 
    [Arithmetic_Funcs]. This module contains all the arithmetic operations of 
    the calculator *)
module Arithmetic_Functions : Arithmetic_Funcs

(** A module that is of type [CFU_sig] that contains an [operation_list] that 
    maps operation symbols to functions *)
module Arithmetic_CFU : CFU_sig
