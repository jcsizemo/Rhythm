open Ast
open Printf
open Datalib

module NameMap = Map.Make(struct
  type t = string
  let compare x y = Pervasives.compare x y
end)

exception ReturnException of expr * expr NameMap.t

(* Main entry point: run a program *)
let run (vars, funcs) =
  (* Put function declarations in a symbol table *)
  let func_decls = List.fold_left
      (fun funcs fdecl -> NameMap.add fdecl.fname fdecl funcs)
      NameMap.empty funcs
  in

  (* Invoke a function and return an updated global symbol table *)
  let rec call fdecl actuals globals =



	(* Evaluate an expression and return (value, updated environment) *)
    let rec eval env = function
	Literal(i) -> Literal(i), env
      (*| Noexpr -> 1, env (* must be non-zero for the for loop predicate *)*)
	  | Note(n) -> Note(n), env
	  | Rest(n) -> Rest(n), env
	  | Array(n) -> Array(n), env
	  | Noexpr -> raise (Failure ("Illegal expression"))
	  | Index(a,i) -> let v, (locals, globals) = eval env (Id(a)) in
	  	let rec lookup arr indices = 
	  		let arr = match arr with
	  			Array(x) -> x
	  			| _ -> raise (Failure ("Attempting to index a variable that isn't an array"))
	  		in
	  		match indices with
	  		[] -> raise (Failure ("Cannot index empty list"))
	  		| hd :: [] -> List.nth arr hd, env
	  		| hd :: tl -> lookup (List.nth arr hd) tl
	  	in
	  	lookup v i
      | Binop(e1, op, e2) ->
	    let v1, (locals, globals) = eval env e1 in
          let v2, (locals, globals) = eval env e2 in
        let boolean i = if i then 1 else 0 in
        (*let locals, globals = env in*)
	    	let rec goThroughArray op e l =
	    		(match op with
	    			Plus -> (match e with
	    				Note(n) -> (match l with
	    								[] -> raise (Failure ("Cannot perform operation on an empty array"))
	    								| hd :: [] -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Note(n)) a2))]
	    									| Note(n2) -> [Array([Note(n2);Note(n)])]
	    									| Rest(r) -> raise (Failure ("Cannot make chords with rests"))
	    									| _ -> raise (Failure ("Illegal array value")))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Note(n)) a2))] @ (goThroughArray op (Note(n)) tl)
	    									| Note(n2) -> [Array([Note(n2);Note(n)])] @ (goThroughArray op (Note(n)) tl)
	    									| Rest(r) -> raise (Failure ("Cannot make chords with rests"))
	    									| _ -> raise (Failure ("Illegal array value"))))
	    				| Literal(lit) -> (match l with 
	    								[] -> raise (Failure ("Cannot perform operation on an empty array"))
	    								| hd :: [] -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))]
	    									| Rest(r) -> raise (Failure ("Cannot change the pitch of a rest"))
	    									| Note(n2) -> 	let dur = noteToDuration n2 in
	    													let oldNote = extractNoteWithoutDuration n2 in
	    													[Note((setNoteDuration (intToNote ((noteToInt oldNote) + lit))) dur)]
	    									| _ -> raise (Failure ("Illegal array value")))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))] @ (goThroughArray op (Literal(lit)) tl)
	    									| Rest(r) -> raise (Failure ("Cannot change the pitch of a rest"))
	    									| Note(n2) -> 	let dur = noteToDuration n2 in
	    													let oldNote = extractNoteWithoutDuration n2 in
	    													[Note((setNoteDuration (intToNote ((noteToInt oldNote) + lit))) dur)] 
	    														@ (goThroughArray op (Literal(lit)) tl)
	    									| _ -> raise (Failure ("Illegal array value"))))
	    				| _ -> raise (Failure ("Unuseable value")))
	    			| Minus -> (match e with
	    				Literal(lit) -> (match l with
	    								[] -> raise (Failure ("Cannot perform operation on an empty array")) 
	    								| hd :: [] -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))]
	    									| Rest(r) -> raise (Failure ("Cannot change the pitch of a rest"))
	    									| Note(n2) -> 	let dur = noteToDuration n2 in
	    													let oldNote = extractNoteWithoutDuration n2 in
	    													[Note((setNoteDuration (intToNote ((noteToInt oldNote) - lit))) dur)]
	    									| _ -> raise (Failure ("Illegal array value")))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))] @ (goThroughArray op (Literal(lit)) tl)
	    									| Rest(r) -> raise (Failure ("Cannot change the pitch of a rest"))
	    									| Note(n2) -> 	let dur = noteToDuration n2 in
	    													let oldNote = extractNoteWithoutDuration n2 in
	    													[Note((setNoteDuration (intToNote ((noteToInt oldNote) - lit))) dur)] 
	    														@ (goThroughArray op (Literal(lit)) tl)
	    									| _ -> raise (Failure ("Illegal array value"))))
	    				| _ -> raise (Failure ("Unuseable value")))
	    			| IncDuration -> (match e with
	    				Literal(lit) -> (match l with 
	    								[] -> raise (Failure ("Cannot perform operation on an empty array"))
	    								| hd :: [] -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))]
	    									| Note(n2) -> let newDuration = (noteToDuration n2) * lit in 
	    													let newNote = setNoteDuration n2 newDuration in
	    													[Note(newNote)]
	    									| Rest(r) -> let newDuration = (noteToDuration r) * lit in 
	    													let newRest = setNoteDuration r newDuration in
	    													[Rest(newRest)]
	    									| _ -> raise (Failure ("Illegal array value")))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))] @ (goThroughArray op (Literal(lit)) tl)
	    									| Note(n2) -> let newDuration = (noteToDuration n2) * lit in 
	    													let newNote = setNoteDuration n2 newDuration in
	    													[Note(newNote)] @ (goThroughArray op (Literal(lit)) tl)
	    									| Rest(r) -> let newDuration = (noteToDuration r) * lit in 
	    													let newRest = setNoteDuration r newDuration in
	    													[Rest(newRest)] @ (goThroughArray op (Literal(lit)) tl)
	    									| _ -> raise (Failure ("Illegal array value"))))
	    				| _ -> raise (Failure ("Unuseable value")))
	    			| DecDuration -> (match e with
	    				Literal(lit) -> (match l with 
	    								[] -> raise (Failure ("Cannot perform operation on an empty array"))
	    								| hd :: [] -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))]
	    									| Note(n2) -> let newDuration = (noteToDuration n2) / lit in 
	    													let newNote = setNoteDuration n2 newDuration in
	    													[Note(newNote)]
	    									| Rest(r) -> let newDuration = (noteToDuration r) / lit in 
	    													let newRest = setNoteDuration r newDuration in
	    													[Rest(newRest)]
	    									| _ -> raise (Failure ("Illegal array value")))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))] @ (goThroughArray op (Literal(lit)) tl)
	    									| Note(n2) -> let newDuration = (noteToDuration n2) / lit in 
	    													let newNote = setNoteDuration n2 newDuration in
	    													[Note(newNote)] @ (goThroughArray op (Literal(lit)) tl)
	    									| Rest(r) -> let newDuration = (noteToDuration r) / lit in 
	    													let newRest = setNoteDuration r newDuration in
	    													[Rest(newRest)] @ (goThroughArray op (Literal(lit)) tl)
	    									| _ -> raise (Failure ("Illegal array value"))))
	    				| _ -> raise (Failure ("Unuseable value")))
	    			| _ -> raise (Failure ("Illegal operation")))
	    		in
        (match op with
	    	Plus -> (match (v1,v2) with
	    			(Note(n1),Note(n2)) -> Array([Note(n1);Note(n2)]), env
	    			| (Literal(l1), Literal(l2)) -> Literal(l1+l2), env
	    			| (Note(n1),Literal(l2)) -> let dur = noteToDuration n1 in
	    										let oldNote = extractNoteWithoutDuration n1 in
	    										Note((setNoteDuration (intToNote ((noteToInt oldNote) + l2))) dur), env
	    			| (Literal(l1),Note(n2)) -> let dur = noteToDuration n2 in
	    										let oldNote = extractNoteWithoutDuration n2 in
	    										Note((setNoteDuration (intToNote ((noteToInt oldNote) + l1))) dur), env
	    			| (Array(a),Note(n)) -> Array(goThroughArray Plus (Note(n)) a), env
	    			| (Note(n),Array(a)) -> Array(goThroughArray Plus (Note(n)) a), env
	    			| (Array(a),Literal(l)) -> Array(goThroughArray Plus (Literal(l)) a), env
	    			| (Literal(l),Array(a)) -> Array(goThroughArray Plus (Literal(l)) a), env
	    			| (Rest(r),Literal(l)) -> raise (Failure ("Cannot change the pitch of a rest"))
	    			| (Literal(l),Rest(r)) -> raise (Failure ("Cannot change the pitch of a rest"))
	    			| (Array(a1),Array(a2)) ->  let split big small =
	    											let arrBig = Array.of_list big
	    										in
	    											let working, leftovers =
	    											Array.to_list (Array.sub arrBig 0 (List.length small)),
	    											Array.to_list (Array.sub arrBig (List.length small) ((List.length big) - (List.length small)))
	    										in
	    											Array((List.map (fun (x,y) -> Array([x;y])) (List.combine working small)) @ leftovers)
	    										in
	    										if List.length a1 > List.length a2 then
	    											(split a1 a2), env
	    										else if List.length a2 > List.length a1 then
	    											(split a2 a1), env
	    										else
	    											Array(List.map (fun (x,y) -> Array([x;y])) (List.combine a1 a2)),env
	    			| _ -> raise (Failure ("Invalid Plus Operation")))
	    	|Minus -> 
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(l1-l2), env
	     			| (Note(n1),Literal(l2)) -> let dur = noteToDuration n1 in
	    										let oldNote = extractNoteWithoutDuration n1 in
	    										Note((setNoteDuration (intToNote ((noteToInt oldNote) - l2))) dur), env
	    			| (Literal(l1),Note(n2)) -> let dur = noteToDuration n2 in
	    										let oldNote = extractNoteWithoutDuration n2 in
	    										Note((setNoteDuration (intToNote ((noteToInt oldNote) - l1))) dur), env
	    			| (Array(a),Literal(l)) -> Array(goThroughArray Minus (Literal(l)) a), env
	    			| (Literal(l),Array(a)) -> Array(goThroughArray Minus (Literal(l)) a), env
	    			| (Rest(r),Literal(l)) -> raise (Failure ("Cannot change the pitch of a rest"))
	    			| (Literal(l),Rest(r)) -> raise (Failure ("Cannot change the pitch of a rest"))
	     			| _ -> raise (Failure ("Invalid Minus Operation")))
	       	|Equal -> 
	     		(match (v1,v2) with
	     		    (Literal(l1), Literal(l2)) -> Literal(boolean (v1 = v2)), env
	     		    | (Note(n1), Note(n2)) -> Literal(boolean (n1 = n2)), env
	     		    | (Rest(r1), Note(r2)) -> Literal(boolean (r1 = r2)), env
	     			| _ -> raise (Failure ("Invalid IsEqual Operation")))	
	     	|Neq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 != v2)), env
	     			| (Note(n1), Note(n2)) -> Literal(boolean (n1 != n2)), env
	     			| (Rest(r1), Note(r2)) -> Literal(boolean (r1 != r2)), env
	     			| _ -> raise (Failure ("Invalid NotEqual Operation")))	
	     	|Less -> 
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 < v2)), env
	     			| (Note(n1), Note(n2)) -> Literal(boolean ((noteToInt n1) < (noteToInt n2))), env
	     			| _ -> raise (Failure ("Invalid Less Than Operation")))	
	     	|Leq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 <= v2)), env
	     			| (Note(n1), Note(n2)) -> Literal(boolean ((noteToInt n1) <= (noteToInt n2))), env
	     			| _ -> raise (Failure ("Invalid Less Than Or Equal Operation")))	
	     	|Greater -> 
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 > v2)), env
	     			| (Note(n1), Note(n2)) -> Literal(boolean ((noteToInt n1) > (noteToInt n2))), env
	     			| _ -> raise (Failure ("Invalid Greater Than Operation")))	
	     	|Geq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 >= v2)), env
	     			| (Note(n1), Note(n2)) -> Literal(boolean ((noteToInt n1) >= (noteToInt n2))), env
	     			| _ -> raise (Failure ("Invalid Greater Than Or Equal Operation")))
	     	|Concat->
	    		(match (v1,v2) with
	    			(Array(a1),Array(a2)) ->  Array(a1 @ a2), env
	    			| (Array(a1), Note(n1)) -> Array(a1 @ [Note(n1)]), env
	    			| (Array(a1), Rest(r1)) -> Array(a1 @ [Rest(r1)]), env
	    			| (Rest(r1), Array(a1)) -> Array([Rest(r1)] @ a1), env
	    			| (Note(n1), Array(a1)) -> Array([Note(n1)] @ a1), env
	    			| (Note(n1),Note(n2)) -> Array([Note(n1);Note(n2)]), env
	    			| (Rest(r1),Rest(r2)) -> Array([Rest(r1);Rest(r2)]), env	    			
	    			| _ -> raise (Failure ("Invalid Concatenation Operation")))
	    	|Octup ->
	    		(match v2 with
	    			Literal(l) -> eval env (Binop(v1, Plus, Literal(12*l)))
	    			| _ -> raise (Failure ("LHS of octave shift must be a note or array, RHS must be an integer")))
	    	|Octdown ->
	    		(match v2 with
	    			Literal(l) -> eval env (Binop(v1, Minus, Literal(12*l)))
	    			| _ -> raise (Failure ("LHS of octave shift must be a note or array, RHS must be an integer")))
	    	|IncDuration ->
	    		(match (v1,v2) with
	    			(Note(n1), Literal(l2)) -> let newDuration = (noteToDuration n1) * l2 in 
	    			let newNote = setNoteDuration n1 newDuration in
	    			Note(newNote), env
	    			| (Literal(l1), Note(n2)) -> let newDuration = (noteToDuration n2) * l1 in 
	    			let newNote = setNoteDuration n2 newDuration in
	    			Note(newNote), env
	    			| (Rest(r1), Literal(l2)) -> let newDuration = (noteToDuration r1) * l2 in 
	    			let newRest = setNoteDuration r1 newDuration in
	    			Note(newRest), env
	    			| (Literal(l1), Rest(r2)) -> let newDuration = (noteToDuration r2) * l1 in 
	    			let newRest = setNoteDuration r2 newDuration in
	    			Note(newRest), env
	    			| (Array(a),Literal(l)) -> Array(goThroughArray IncDuration (Literal(l)) a), env
	    			| (Literal(l),Array(a)) -> Array(goThroughArray IncDuration (Literal(l)) a), env
	    			| _ -> raise (Failure ("Invalid Increase Duration Operation")))
	    	|DecDuration -> 
	    		(match (v1,v2) with
	    			(Note(n1), Literal(l2)) -> let newDuration = (noteToDuration n1) / l2 in 
	    			let newNote = setNoteDuration n1 newDuration in
	    			Note(newNote), env
	    			| (Literal(l1), Note(n2)) -> let newDuration = (noteToDuration n2) / l1 in 
	    			let newNote = setNoteDuration n2 newDuration in
	    			Note(newNote), env
	    			| (Rest(r1), Literal(l2)) -> let newDuration = (noteToDuration r1) / l2 in 
	    			let newRest = setNoteDuration r1 newDuration in
	    			Note(newRest), env
	    			| (Literal(l1), Rest(r2)) -> let newDuration = (noteToDuration r2) / l1 in 
	    			let newRest = setNoteDuration r2 newDuration in
	    			Note(newRest), env
	    			| (Array(a),Literal(l)) -> Array(goThroughArray DecDuration (Literal(l)) a), env
	    			| (Literal(l),Array(a)) -> Array(goThroughArray DecDuration (Literal(l)) a), env
	    			| _ -> raise (Failure ("Invalid Decrease Duration Operation")))
	    | _ ->raise (Failure ("Invalid operation")))

      | Id(var) ->
	  let locals, globals = env in
	  if NameMap.mem var locals then
	    (NameMap.find var locals), env
	  else if NameMap.mem var globals then
	    (NameMap.find var globals), env
	  else raise (Failure ("undeclared identifier " ^ var))
      | Assign(var, e) ->
	  let v, (locals, globals) = eval env e in
	  (match var with
	  	Id(name) ->
	  	if NameMap.mem name locals then
	    	v, (NameMap.add name v locals, globals)
	  	else if NameMap.mem name globals then
	    	v, (locals, NameMap.add name v globals)
	  	else
	  		v, (NameMap.add name v locals, globals)
	  	| Index(arrName,indices) -> 
	  					let rec swap exps = function
	  						[] -> raise (Failure ("Cannot perform operation on an empty array"))
	  						| hd :: [] -> let arr = (Array.of_list exps)
	  							in
	  							arr.(hd) <- v; Array.to_list arr
	  						| hd :: tl -> 	let arr = (Array.of_list exps)
	  							in
	  							let piece = match arr.(hd) with
	  									Array(x) -> x
	  									| _ -> raise (Failure ("Bad index")) 
	  							in
	  							arr.(hd) <- Array(swap piece tl); Array.to_list arr
	  						in
	  					if (NameMap.mem arrName locals) then
	  						let eList = (match (NameMap.find arrName locals) with
	  							Array(a) -> a
	  							| _ -> raise (Failure ("Variable in memory not an array"))) in
	  						let newArray = Array(swap eList indices) in
	  						v, (NameMap.add arrName newArray locals, globals)
	  					else if (NameMap.mem arrName globals) then
	  						let eList = (match (NameMap.find arrName globals) with
	  							Array(a) -> a
	  							| _ -> raise (Failure ("Variable in memory not an array"))) in
	  						let newArray = Array(swap eList indices) in
	  						v, (locals, NameMap.add arrName newArray globals)
	  					else
	  						raise (Failure ("Array variable not found in memory"))
	  	| _ -> raise (Failure ("Can only assign variables or array segments")))

      | Call("print", [e]) ->
	  let v, env = eval env e in
	  let rec print = function
	  	Literal(i) -> string_of_int i
	  	| Note(n) -> n
	  	| Rest(r) -> r
	  	| Id(i) -> let expr, vars = eval env (Id(i)) in print expr
	  	| Index(i,a) -> "INDEX"
	  	| Binop(x,y,z) -> "BINOP"
	  	| Call(x,y) -> "CALL"
	  	| Noexpr -> "NOEXPR"
	  	| Assign(x,y) -> "ASSIGN"
	  	| Array(a) -> "[" ^ build a ^ "]" and build = function
	  							hd :: [] -> (print hd)
	  							| hd :: tl ->  ((print hd) ^ "," ^ (build tl))
	  	| _ -> raise (Failure ("Unprintable item"))
	in
		print_endline (print v);
	  Literal(0), env


	| Call("openFile", [e]) -> Literal(0), env
	| Call("selectTrack", [e]) -> Literal(0), env
	| Call("writeToFile", [e]) -> let oc = 	open_out_gen [Open_creat; Open_append; Open_text] 0o666 "output.txt" in
	let v, env = eval env e in
	let rec print = function
	  	Literal(i) -> string_of_int i
	  	| Note(n) -> string_of_int (noteToInt n) ^ " " ^ string_of_int(noteToDuration n)
		| _ ->  "Something else"
	in
	fprintf oc "%s\n" (print v);
	close_out oc;
	Literal(0), env

    | Call(f, actuals) ->
	  let fdecl =
	    try NameMap.find f func_decls
	    with Not_found -> raise (Failure ("undefined function " ^ f))
	  in
	  let actuals, env = List.fold_left
	      (fun (actuals, env) actual ->
		let v, env = eval env actual in v :: actuals, env)
   	      ([], env) (List.rev actuals)
	  in 
	  let (locals, globals) = env in
	  try
	    let globals = call fdecl actuals globals
	    in Literal(0), (locals, globals)
	  with ReturnException(v, globals) -> v, (locals, globals)
    in

    (* Execute a statement and return an updated environment *)
    let rec exec env = function
	Block(stmts) -> List.fold_left exec env stmts
      | Expr(e) -> let _, env = eval env e in env
      | If(e, s1, s2) ->
	  let v, env = eval env e in
	  (match v with
	  		Literal(l) ->  exec env (if l != 0 then s1 else s2)
	  		| _ -> raise (Failure ("Error: If only support arithmatic")))
      | While(e, s) ->
	  let rec loop env =
	    let v, env = eval env e in
	    (match v with
	    	Literal(l) -> if (l != 0) then loop (exec env s) else env
	    	| _ -> raise (Failure ("Error: While only support arithmatic")))
	  in loop env 
	  | Loop(e1, e2, s) ->
	    let _, env = eval env e1 in
            let rec loop env =
	    let v, env = eval env e2 in
	    (match v with
	    	Literal(l) -> if (l != 0) then loop (exec env s) else env
	     	| _ -> raise (Failure ("Error: Loop only support arithmatic")))
	    
	  in loop env	  
	  | Return(e) ->
	  let v, (locals, globals) = eval env e in
	  raise (ReturnException(v, globals)) 
    in

    (* Enter the function: bind actual values to formal arguments *)
    let locals =
      try List.fold_left2
	  (fun locals formal actual -> NameMap.add formal actual locals)
	  NameMap.empty fdecl.formals actuals
      with Invalid_argument(_) ->
	raise (Failure ("wrong number of arguments passed to " ^ fdecl.fname))
    in
    (* Initialize local variables to 0 *)
    let locals = List.fold_left
	(fun locals local -> NameMap.add local (Literal(0)) locals) locals fdecl.locals
    in
    (* Execute each statement in sequence, return updated global symbol table *)
    snd (List.fold_left exec (locals, globals) fdecl.body)

  (* Run a program: initialize global variables to 0, find and run "main" *)
  in let globals = List.fold_left
      (fun globals vdecl -> NameMap.add vdecl (Literal(0)) globals) NameMap.empty vars
  in try
    call (NameMap.find "main" func_decls) [] globals
  with Not_found -> raise (Failure ("did not find the main() function"))

