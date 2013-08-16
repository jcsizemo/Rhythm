open Ast
open Printf
open Datalib

module NameMap = Map.Make(struct
  type t = string
  let compare x y = Pervasives.compare x y
end)

exception ReturnException of expr * expr NameMap.t


let trackCounters = ref NameMap.empty
let currentTrack = ref ""

let selectTrack v = let oc = 	open_out_gen [Open_creat; Open_append; Open_text] 0o666 "output.rym" in
								fprintf oc "\nTrack: %s\n" v;
								close_out oc;
								currentTrack := v;	
								;Literal(0), (NameMap.empty, NameMap.empty)

let writeToFile v = let oc = open_out_gen [Open_creat; Open_append; Open_text] 0o666 "output.rym" in
		let startingTrackCount = if NameMap.mem !currentTrack !trackCounters then NameMap.find !currentTrack !trackCounters else 0 in

		let printPrim startTick = function
			Note(n) -> let rec write start stop =
						if (start < stop) then 
								(fprintf oc "%s %s\n" (string_of_int (startingTrackCount + start)) (string_of_int (noteToInt (extractNoteWithoutDuration n)));
								write (start + 1) stop)
						else stop
						in
						write startTick (startTick + (16 / (noteToDuration n)))
			| Rest(r) -> (startTick + (16 / (noteToDuration r)))
			| _ -> raise (Failure ("Illegal array value"))
		in

		let rec printChord largest startTick = function
				[] -> raise (Failure ("Cannot print empty array"))
	  			| hd :: [] -> let length = (match hd with
	  							Array(a) -> printChord largest startTick a
	  							| Rest(r) -> printPrim startTick (Rest(r))
	  							| Note(n) -> printPrim startTick (Note(n))
	  							| _ -> raise (Failure ("Illegal array value"))) in if largest >= length then largest else length
	  			| hd :: tl -> let length = (match hd with
	  							Array(a) -> printChord largest startTick a
	  							| Rest(r) -> printPrim startTick (Rest(r))
	  							| Note(n) -> printPrim startTick (Note(n))
	  							| _ -> raise (Failure ("Illegal array value"))) in if largest >= length then printChord largest startTick tl 
	  																				else printChord length startTick tl
	  	in

		let rec printTrack startTick = function
				[] -> raise (Failure ("Cannot print empty array"))
	  			| hd :: [] -> (match hd with
	  							Array(a) -> printChord 0 startTick a
	  							| Rest(r) -> printPrim startTick (Rest(r))
	  							| Note(n) -> printPrim startTick (Note(n))
	  							| _ -> raise (Failure ("Illegal array value")))
	  			| hd :: tl -> let newStartTick =
	  							(match hd with
	  							Array(a) -> printChord 0 startTick a
	  							| Rest(r) -> printPrim startTick (Rest(r))
	  							| Note(n) -> printPrim startTick (Note(n))
	  							| _ -> raise (Failure ("Illegal array value")))
	  							in printTrack newStartTick tl
	  	in
		let parse = function
			Note(n) -> let numTicks = printPrim 0 (Note(n)) in trackCounters := NameMap.add !currentTrack (startingTrackCount + numTicks) !trackCounters
			| Rest(r) -> let numTicks = printPrim 0 (Rest(r)) in trackCounters := NameMap.add !currentTrack (startingTrackCount + numTicks) !trackCounters
			| Array(a) -> let numTicks = printTrack 0 a in trackCounters := NameMap.add !currentTrack (startingTrackCount + numTicks) !trackCounters
			| _ -> raise (Failure ("Cannot print anything except arrays, notes, or rests"))
		in
		parse v;
		print_endline "RYM file created successfully";
		close_out oc;
		Literal(0), (NameMap.empty, NameMap.empty)





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
	    									| Binop(e1, o, e2) -> let v, vars = eval env (Binop(e1, o, e2)) in goThroughArray op (Note(n)) [v]
	    									| Index(a,i) -> let v, vars = eval env (Index(a,i)) in goThroughArray op (Note(n)) [v]
	    									| Note(n2) -> [Array([Note(n2);Note(n)])]
	    									| Rest(r) -> raise (Failure ("Cannot make chords with rests"))
	    									| _  as extra -> raise (Failure ("Illegal array value: " ^ (string_of_expr extra))))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Note(n)) a2))] @ (goThroughArray op (Note(n)) tl)
	    									| Binop(e1, o, e2) -> let v, vars = eval env (Binop(e1, o, e2)) in goThroughArray op (Note(n)) [v] @ (goThroughArray op (Note(n)) tl)
	    									| Index(a,i) -> let v, vars = eval env (Index(a,i)) in (goThroughArray op (Note(n)) [v]) @ (goThroughArray op (Note(n)) tl)
	    									| Note(n2) -> [Array([Note(n2);Note(n)])] @ (goThroughArray op (Note(n)) tl)
	    									| Rest(r) -> raise (Failure ("Cannot make chords with rests"))
	    									| _  as extra -> raise (Failure ("Illegal array value: " ^ (string_of_expr extra)))))
	    				| Literal(lit) -> (match l with 
	    								[] -> raise (Failure ("Cannot perform operation on an empty array"))
	    								| hd :: [] -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))]
	    									| Binop(e1, o, e2) -> let v, vars = eval env (Binop(e1, o, e2)) in goThroughArray op (Literal(lit)) [v]
	    									| Index(a,i) -> let v, vars = eval env (Index(a,i)) in goThroughArray op (Literal(lit)) [v]
	    									| Rest(r) -> raise (Failure ("Cannot change the pitch of a rest"))
	    									| Note(n2) -> 	let dur = noteToDuration n2 in
	    													let oldNote = extractNoteWithoutDuration n2 in
	    													[Note((setNoteDuration (intToNote ((noteToInt oldNote) + lit))) dur)]
	    									| _  as extra -> raise (Failure ("Illegal array value: " ^ (string_of_expr extra))))
	    								| hd :: tl -> (match hd with
	    									Array(a2) -> [Array((goThroughArray op (Literal(lit)) a2))] @ (goThroughArray op (Literal(lit)) tl)
	    									| Binop(e1, o, e2) -> let v, vars = eval env (Binop(e1, o, e2)) in goThroughArray op (Literal(lit)) [v] @ (goThroughArray op (Literal(lit)) tl)
	    									| Index(a,i) -> let v, vars = eval env (Index(a,i)) in (goThroughArray op (Literal(lit)) [v]) @ (goThroughArray op (Literal(lit)) tl)
	    									| Rest(r) -> raise (Failure ("Cannot change the pitch of a rest"))
	    									| Note(n2) -> 	let dur = noteToDuration n2 in
	    													let oldNote = extractNoteWithoutDuration n2 in
	    													[Note((setNoteDuration (intToNote ((noteToInt oldNote) + lit))) dur)] 
	    														@ (goThroughArray op (Literal(lit)) tl)
	    									| _  as extra -> raise (Failure ("Illegal array value: " ^ (string_of_expr extra)))))
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
	    			| (Rest(r),Literal(l)) -> Rest(r), env
	    			| (Literal(l),Rest(r)) -> Rest(r), env
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
	     		    | (Array(a1), Array(a2)) -> Literal(boolean (a1 = a2)), env
	     			| _ -> raise (Failure ("Invalid IsEqual Operation")))	
	     	|Neq ->
	     		(match (v1,v2) with
	     			(Literal(l1), Literal(l2)) -> Literal(boolean (v1 <> v2)), env
	     			| (Note(n1), Note(n2)) -> Literal(boolean (n1 <> n2)), env
	     			| (Rest(r1), Note(r2)) -> Literal(boolean (r1 <> r2)), env
	     			| (Array(a1), Array(a2)) -> Literal(boolean (a1 <> a2)), env
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
	    	|DecDuration ->
	    		(match (v1,v2) with
	    			(Note(n1), Literal(l2)) -> let dur = (noteToDuration n1) in
	    			if dur = 16 then raise (Failure ("Sixteenth notes cannot be shortened"))
	    			else let newDuration = dur * l2 in 
	    			let newNote = setNoteDuration n1 newDuration in
	    			Note(newNote), env
	    			| (Literal(l1), Note(n2)) -> let dur = (noteToDuration n2) in
	    			if dur = 16 then raise (Failure ("Sixteenth notes cannot be shortened"))
	    			else let newDuration = dur * l1 in 
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
	    	|IncDuration -> 
	    		(match (v1,v2) with
	    			(Note(n1), Literal(l2)) -> let dur = (noteToDuration n1) in
	    			if dur = 1 then raise (Failure ("Whole notes cannot be lengthened"))
	    			else let newDuration = dur / l2 in 
	    			let newNote = setNoteDuration n1 newDuration in
	    			Note(newNote), env
	    			| (Literal(l1), Note(n2)) -> let dur = (noteToDuration n2) in
	    			if dur = 1 then raise (Failure ("Whole notes cannot be lengthened"))
	    			else let newDuration = dur / l1 in 
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
	    	|Stretch ->
	    		(match (v1,v2) with
	    			(Array(arr),Literal(l)) -> let rec stretch l a =
	    								if (l > 0) then stretch (l-1) (arr @ a) else a in
	    								Array(stretch l []), env
	    			| (_,Literal(l)) -> let rec stretch l a =
	    								if (l > 0) then stretch (l-1) (v1 :: a) else a in
	    								Array(stretch l []), env
	    			| _ -> raise (Failure ("RHS of stretch statement must be an integer")))
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
	  	| Index(i,a) -> let expr, vars = eval env (Index(i,a)) in print expr
	  	| Binop(x,y,z) -> let expr, vars = eval env (Binop(x,y,z)) in print expr
	  	| Call(x,y) -> let expr, vars = eval env (Call(x,y)) in print expr
	  	| Assign(x,y) -> let expr, vars = eval env (Assign(x,y)) in print expr
	  	| Array(a) -> "[" ^ build a ^ "]" and build = function
	  							hd :: [] -> (print hd)
	  							| hd :: tl ->  ((print hd) ^ "," ^ (build tl))
	  	| _ -> raise (Failure ("Unprintable item"))
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
	  		| _ -> raise (Failure ("Error: If only support arithmetic")))
      | While(e, s) ->
	  let rec loop env =
	    let v, env = eval env e in
	    (match v with
	    	Literal(l) -> if (l != 0) then loop (exec env s) else env
	    	| _ -> raise (Failure ("Error: While only support arithmetic")))
	  in loop env 
	  | Loop(e1, e2, s) ->
	    let v1, env = eval env e1 in
	    let v2, env = eval env e2 in
	    (match (v1,v2) with
			(Literal(l1),Literal(l2)) -> 
				let rec loop l1 l2 env = 
					if (l1 < l2) then loop (l1+1) l2 (exec env s)
					else env
				in
				loop l1 l2 env
	    	| _ -> raise (Failure ("Both loop parameters must be integers")))
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
  in 
  	let globals = if (NameMap.mem "init" func_decls) then call (NameMap.find "init" func_decls) [] globals 
  					else List.fold_left (fun globals vdecl -> NameMap.add vdecl (Literal(0)) globals) NameMap.empty vars
		in NameMap.iter (fun k v ->  
								let sub = try 
								  (String.sub k 0 6) 
								with Invalid_argument x -> "notatrack" (* Ignoring *)
								in 
								if (String.compare sub "track_") == 0 then
								  let trackLabel = (String.sub k 6 ((String.length k) - 6)) in 
								  try
    								ignore (call (NameMap.find k func_decls) [] globals);
	  								raise (Failure ("return call not made in track file (required)"))	
  								  with ReturnException(v, globals) -> ignore (selectTrack(trackLabel)); ignore (writeToFile(v)); ()
  								else () ) func_decls