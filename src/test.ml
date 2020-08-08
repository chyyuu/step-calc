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
  make_i "add" "22" "11+11";
  make_i "add" "10" "11+-1";
  make_i "add" "33" "11+11+11";
  make_i "add" "9" "11+-1+-1";
  make_i "add" "-3" "-4+1";
  make_i "add" "-3" "-2+-1";
  make_i "sub" "0" "1 - 1";
  make_i "sub" "-3" "1 - 1 - 3";
  make_i "sub" "3" "1 - 1 - -3";
  make_i "mul" "3" "1*3";
  make_i "mul" "-6" "2*-3";
  make_i "div" "4" "6/3*2";
  make_i "equ" "1" "2==2";
  make_i "equ" "0" "1==2";
]

let suite = "calc test suite" >::: tests

let _ = run_test_tt_main suite