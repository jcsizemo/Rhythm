type op = Plus | Minus | Longer | Shorter | Equal | Neq | Concat | Octup | Less | Leq | Greater | Geq | Octdown | Halfup | Halfdown

type expr =
    Literal of int
  | Note of string
  | Id of string
  | Array of expr list
  | Binop of expr * op * expr
  | Assign of expr * expr
  | Call of string * expr list
  | Index of string * int list
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | While of expr * stmt
  | Loop of expr * expr * stmt

type func_decl = {
    fname : string;
    formals : string list;
    locals : string list;
    body : stmt list;
  }

type program = string list * func_decl list

(*list to string*)
let string_of_list list_t = 
let string_temp = String.concat ", " list_t in
"[" ^ string_temp ^ "]";;


let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | Id(i) -> i
  | Note(n) -> n
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      (match o with
  Plus -> "+" | Minus -> "-" | Longer -> "*" | Shorter -> "/"
      | Equal -> "==" | Neq -> "!="
      | Less -> "<" | Leq -> "<=" | Greater -> ">" | Geq -> ">=") ^ " " ^
      string_of_expr e2
  | Assign(v, e) -> string_of_expr v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""
  | Array(a) -> "[" ^ build a ^ "]" and build = function
                  hd :: [] -> (string_of_expr hd)
                  | hd :: tl -> ((string_of_expr hd) ^ "," ^ (build tl))
                  | _ -> "some thing wrong"

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s
  | Loop(e1, e2, s) -> "loop (" ^ string_of_expr e1 ^ ":" ^  string_of_expr e2 ^ ")\n" ^ string_of_stmt s

let string_of_vdecl id = "int " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  fdecl.fname ^ "(" ^ String.concat ", " fdecl.formals ^ ")\n{\n" ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)

