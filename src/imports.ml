open Arithmetic
open Ast

module type Imports_Sig = sig
  val find_function : string -> (value list -> value)
end

module Imports = struct
  (** [arith] is the [operation_list] from the [Arithmetic] module *)
  let arith = Arithmetic_CFU.operation_list

  (** [cfu_list] is the list of all the operation lists defined above *)
  let cfu_list = [arith]

  (** [operation_list] contains all the functions from the operation lists from
      all the modules used *)
  let operation_list = List.append cfu_list [] |> List.flatten

  (** [functions_map] is the environment created containing all external 
      functions of CAMLCALC *)

  let find_function (identifier : string) =
    match List.assoc_opt identifier operation_list with
    |Some f -> f
    |None -> failwith (identifier^" is not a valid imported function")
end