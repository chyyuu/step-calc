open OUnit2
open Ast
open Main

(** [make_i n i s] makes an OUnit2 test named [n] that expects
    [s] to evalute to [Integer i]. *)
let make_i n i s =
  n >:: (fun _ -> 
      assert_equal i (Main.interp s)
        ~printer:(fun x-> x))

let tests = [
  make_i "integer" "22" "22";
  make_i "integer" "-22" "-22";
]

let suite = "calc test suite" >::: tests

let _ = run_test_tt_main suite