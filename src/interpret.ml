open Ast

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
	  | Array(n) -> Array(n), env
	  | Index(a,i) -> let v, (locals, globals) = eval env a in
	  		(match v with
	  		Array(x) -> List.nth x i, env
	  		| _ -> raise (Failure ("Attempting to index a variable that isn't an array")))
      | Binop(e1, op, e2) ->
	    let v1, (locals, globals) = eval env e1 in
          let v2, (locals, globals) = eval env e2 in
        let boolean i = if i then 1 else 0 in
        let locals, globals = env in
        (match op with
	    	Plus -> 
	    		(match (v1,v2) with
	    			(Id(n1),Id(n2)) -> Literal(0), env
	    			| (Literal(l1), Literal(l2)) -> Literal(l1+l2), env
	    			| _ -> raise (Failure ("Invalid Plus Operation")))
	    	|Minus -> 
	     		(match (v1,v2) with
	     			(Id(n1),Id(n2)) -> Literal(0), env
	     			| (Literal(l1), Literal(l2)) -> Literal(l1-l2), env
	     			| _ -> raise (Failure ("Invalid Minus Operation")))
	       	|Equal -> 
	     		(match (v1,v2) with
	     		    (Literal(l1), Literal(l2)) -> Literal(boolean (v1 = v2)), env
	     			| _ -> raise (Failure ("Invalid Equal Operation, only support arithmatic")))	
	     	|Neq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 != v2)), env
	     			| _ -> raise (Failure ("Invalid NotEqual Operation,  only support arithmatic")))	
	     	|Less -> 
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 < v2)), env
	     			| _ -> raise (Failure ("Invalid Equal Operation, only support arithmatic")))	
	     	|Leq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 <= v2)), env
	     			| _ -> raise (Failure ("Invalid NotEqual Operation,  only support arithmatic")))	
	     	|Greater -> 
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 > v2)), env
	     			| _ -> raise (Failure ("Invalid Equal Operation, only support arithmatic")))	
	     	|Geq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 >= v2)), env
	     			| _ -> raise (Failure ("Invalid NotEqual Operation,  only support arithmatic")))
	    | _ ->raise (Failure ("other binops")))



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
	  	| Index(e,i) -> let arrName, indices =
	  						let rec getRoot iList = function
	  							Id(name) -> name, iList
	  							| Index(e,i) -> getRoot (i :: iList) e
	  							| _ -> raise (Failure ("This object is not an array")) in
	  						getRoot [i] e in
	  					let rec swap exps = function
	  						hd :: [] -> let arr = (Array.of_list exps)
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
	  	| Id(i) -> let expr, vars = eval env (Id(i)) in print expr;
	  	| Array(a) -> "[" ^ build a ^ "]" and build = function
	  							hd :: [] -> (print hd)
	  							| hd :: tl -> ((print hd) ^ "," ^ (build tl))
	  	| _ ->  "Something else"
	in
		print_endline (print v);
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

