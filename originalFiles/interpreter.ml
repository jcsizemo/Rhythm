open Ast

module StringMap = Map.Make (String)
let context = StringMap.empty;;

let rec eval = function
Note(x) -> x |
Rest(x) -> x |
Variable(x) -> StringMap.find x context |
Chord(v1, v2) -> eval v2 |
Assign(v1, v2) -> ignore (StringMap.add v1 (eval v2) context); v1 

let _ =
let lexbuf = Lexing.from_channel stdin in
let expr = Parser.expr Scanner.token lexbuf in
let result = eval expr in
print_endline (result)