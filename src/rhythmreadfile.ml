(*edited from TaML language*)

open Parser
open Scanner

type action =  Scanner | Ast | Sast | Compile

let _ =
  (* Read argument and assign to "action" *)
  let action = Scanner in                             
	
  match action with
    Scanner -> let lexbuf = Lexing.from_channel stdin in
               let rec loop token  =
                  (match token with
                     | EOF -> []
                     | _ as t -> t::loop (Scanner.token lexbuf)) in
               let tokens = loop (Scanner.token lexbuf) in
               let output = Scanner_utils.string_of_tokens tokens in
               print_string output
