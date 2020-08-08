open Ast

module type Arithmetic_Funcs = sig
  val add : value list -> value
  val subtract : value list -> value
end

module type CFU_sig = sig
  val operation_list : (string * ( value list -> value )) list
end

module Arithmetic_Functions : Arithmetic_Funcs = struct

  (** [unwrap v] is the integer extracted from value [v] 
      requires: [v] has type VInteger *)
  let unwrap v =
    match v with
    | VInteger x -> x
    | _ -> failwith "This cannot occur - arithmetic.ml"

  let add (s : value list) =
    match s with
    | hd1::hd2::tl -> 
      let (hd1', hd2') = (unwrap hd1, unwrap hd2) in
      VInteger (Int.add hd1' hd2')
    | _ -> failwith "InvalidInput"

  let subtract (s : value list) =
    match s with
    | hd1::hd2::tl -> 
      let (hd1', hd2') = (unwrap hd1, unwrap hd2) in
      VInteger (Int.sub hd1' hd2')
    | _ -> failwith "InvalidInput"
end

module Arithmetic_CFU : CFU_sig = struct

  let operation_list = [
    ("+", Arithmetic_Functions.add);
    ("-", Arithmetic_Functions.subtract);
  ]

end
