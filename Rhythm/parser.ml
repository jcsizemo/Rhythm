type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | LBRACKET
  | RBRACKET
  | PLUS
  | MINUS
  | LONGER
  | SHORTER
  | ASSIGN
  | CONCAT
  | REMOVE
  | EQ
  | NEQ
  | OCTDOWN
  | OCTUP
  | HALFUP
  | HALFDOWN
  | ASSIGN_PLUS
  | ASSIGN_MINUS
  | ASSIGN_LONGER
  | ASSIGN_SHORTER
  | ASSIGN_OCTUP
  | ASSIGN_OCTDOWN
  | ASSIGN_CONCAT
  | ASSIGN_REMOVE
  | RETURN
  | IF
  | ELSE
  | WHILE
  | LOOP
  | CLOSEFILE
  | OPENFILE
  | TRUE
  | FALSE
  | TEMPO
  | STARTTRACK
  | STOPTRACK
  | LITERAL of (int)
  | ID of (string)
  | NOTE of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 53 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* LBRACKET *);
  264 (* RBRACKET *);
  265 (* PLUS *);
  266 (* MINUS *);
  267 (* LONGER *);
  268 (* SHORTER *);
  269 (* ASSIGN *);
  270 (* CONCAT *);
  271 (* REMOVE *);
  272 (* EQ *);
  273 (* NEQ *);
  274 (* OCTDOWN *);
  275 (* OCTUP *);
  276 (* HALFUP *);
  277 (* HALFDOWN *);
  278 (* ASSIGN_PLUS *);
  279 (* ASSIGN_MINUS *);
  280 (* ASSIGN_LONGER *);
  281 (* ASSIGN_SHORTER *);
  282 (* ASSIGN_OCTUP *);
  283 (* ASSIGN_OCTDOWN *);
  284 (* ASSIGN_CONCAT *);
  285 (* ASSIGN_REMOVE *);
  286 (* RETURN *);
  287 (* IF *);
  288 (* ELSE *);
  289 (* WHILE *);
  290 (* LOOP *);
  291 (* CLOSEFILE *);
  292 (* OPENFILE *);
  293 (* TRUE *);
  294 (* FALSE *);
  295 (* TEMPO *);
  296 (* STARTTRACK *);
  297 (* STOPTRACK *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  298 (* LITERAL *);
  299 (* ID *);
  300 (* NOTE *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\003\000\005\000\005\000\004\000\
\004\000\006\000\006\000\006\000\006\000\006\000\006\000\008\000\
\008\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\009\000\009\000\010\000\010\000\000\000"

let yylen = "\002\000\
\000\000\002\000\007\000\000\000\001\000\001\000\003\000\000\000\
\002\000\002\000\003\000\003\000\005\000\007\000\005\000\000\000\
\001\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\004\000\003\000\
\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\002\000\000\000\006\000\000\000\
\000\000\000\000\000\000\008\000\007\000\000\000\000\000\008\000\
\003\000\000\000\000\000\000\000\018\000\000\000\009\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\032\000\012\000\011\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\022\000\023\000\000\000\000\000\031\000\
\000\000\000\000\015\000\000\000\000\000\014\000"

let yydgoto = "\002\000\
\003\000\005\000\008\000\014\000\009\000\023\000\024\000\000\000\
\049\000\050\000"

let yysindex = "\001\000\
\000\000\000\000\220\254\015\255\000\000\244\254\000\000\036\255\
\039\255\045\255\012\255\000\000\000\000\018\000\058\255\000\000\
\000\000\058\255\059\255\060\255\000\000\255\254\000\000\037\255\
\096\255\022\000\047\255\058\255\058\255\058\255\058\255\000\000\
\058\255\058\255\058\255\058\255\058\255\058\255\058\255\058\255\
\058\255\058\255\000\000\000\000\000\000\105\255\114\255\242\255\
\062\255\061\255\242\255\008\255\008\255\251\255\251\255\001\255\
\001\255\001\255\001\255\000\000\000\000\038\255\038\255\000\000\
\058\255\034\255\000\000\242\255\038\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\072\000\000\000\000\000\067\255\000\000\000\000\
\076\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\027\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\079\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\255\
\000\000\086\255\003\255\165\255\177\255\132\255\070\000\189\255\
\201\255\226\255\238\255\000\000\000\000\000\000\000\000\000\000\
\000\000\052\000\000\000\026\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\074\000\000\000\228\255\241\255\000\000\
\000\000\000\000"

let yytablesize = 351
let yytable = "\025\000\
\030\000\001\000\027\000\030\000\035\000\030\000\004\000\035\000\
\030\000\033\000\034\000\031\000\046\000\047\000\048\000\051\000\
\006\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\059\000\060\000\061\000\019\000\036\000\019\000\007\000\036\000\
\019\000\066\000\067\000\019\000\019\000\032\000\010\000\015\000\
\070\000\016\000\019\000\019\000\011\000\033\000\034\000\045\000\
\012\000\068\000\041\000\042\000\035\000\036\000\013\000\033\000\
\034\000\041\000\042\000\015\000\028\000\029\000\035\000\036\000\
\064\000\069\000\065\000\018\000\019\000\004\000\020\000\037\000\
\019\000\019\000\019\000\019\000\019\000\019\000\005\000\021\000\
\022\000\033\000\037\000\038\000\039\000\040\000\041\000\042\000\
\034\000\026\000\000\000\000\000\037\000\038\000\039\000\040\000\
\041\000\042\000\043\000\021\000\022\000\000\000\000\000\000\000\
\033\000\034\000\000\000\062\000\000\000\000\000\000\000\035\000\
\036\000\033\000\034\000\000\000\063\000\000\000\000\000\000\000\
\035\000\036\000\033\000\034\000\000\000\000\000\000\000\000\000\
\000\000\035\000\036\000\000\000\024\000\000\000\024\000\000\000\
\000\000\024\000\000\000\000\000\000\000\037\000\038\000\039\000\
\040\000\041\000\042\000\024\000\024\000\000\000\037\000\038\000\
\039\000\040\000\041\000\042\000\000\000\000\000\000\000\037\000\
\038\000\039\000\040\000\041\000\042\000\020\000\000\000\020\000\
\000\000\000\000\020\000\000\000\000\000\020\000\020\000\000\000\
\000\000\021\000\000\000\021\000\020\000\020\000\021\000\000\000\
\000\000\021\000\021\000\000\000\000\000\026\000\000\000\026\000\
\021\000\021\000\026\000\000\000\000\000\000\000\000\000\000\000\
\000\000\028\000\000\000\028\000\026\000\026\000\028\000\000\000\
\000\000\000\000\020\000\020\000\020\000\020\000\000\000\000\000\
\028\000\028\000\000\000\000\000\000\000\000\000\021\000\021\000\
\021\000\021\000\027\000\000\000\027\000\000\000\000\000\027\000\
\000\000\000\000\026\000\026\000\026\000\026\000\029\000\000\000\
\029\000\027\000\027\000\029\000\000\000\000\000\028\000\028\000\
\028\000\028\000\033\000\034\000\000\000\029\000\029\000\000\000\
\000\000\035\000\036\000\033\000\034\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\027\000\
\027\000\027\000\027\000\015\000\000\000\016\000\017\000\015\000\
\000\000\016\000\044\000\029\000\029\000\029\000\029\000\037\000\
\038\000\039\000\040\000\041\000\042\000\000\000\000\000\000\000\
\037\000\038\000\039\000\040\000\041\000\042\000\000\000\018\000\
\019\000\000\000\020\000\018\000\019\000\013\000\020\000\013\000\
\013\000\000\000\000\000\021\000\022\000\000\000\000\000\021\000\
\022\000\000\000\000\000\000\000\000\000\000\000\025\000\000\000\
\025\000\000\000\000\000\025\000\000\000\000\000\000\000\000\000\
\000\000\013\000\013\000\000\000\013\000\025\000\025\000\000\000\
\000\000\000\000\000\000\000\000\000\000\013\000\013\000"

let yycheck = "\015\000\
\002\001\001\000\018\000\001\001\003\001\003\001\043\001\006\001\
\006\001\009\001\010\001\013\001\028\000\029\000\030\000\031\000\
\002\001\033\000\034\000\035\000\036\000\037\000\038\000\039\000\
\040\000\041\000\042\000\001\001\003\001\003\001\043\001\006\001\
\006\001\062\000\063\000\009\001\010\001\001\001\003\001\002\001\
\069\000\004\001\016\001\017\001\006\001\009\001\010\001\001\001\
\004\001\065\000\050\001\051\001\016\001\017\001\043\001\009\001\
\010\001\050\001\051\001\002\001\002\001\002\001\016\001\017\001\
\003\001\032\001\006\001\030\001\031\001\003\001\033\001\000\000\
\046\001\047\001\048\001\049\001\050\001\051\001\003\001\042\001\
\043\001\003\001\046\001\047\001\048\001\049\001\050\001\051\001\
\003\001\016\000\255\255\255\255\046\001\047\001\048\001\049\001\
\050\001\051\001\003\001\042\001\043\001\255\255\255\255\255\255\
\009\001\010\001\255\255\003\001\255\255\255\255\255\255\016\001\
\017\001\009\001\010\001\255\255\003\001\255\255\255\255\255\255\
\016\001\017\001\009\001\010\001\255\255\255\255\255\255\255\255\
\255\255\016\001\017\001\255\255\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\255\255\046\001\047\001\048\001\
\049\001\050\001\051\001\016\001\017\001\255\255\046\001\047\001\
\048\001\049\001\050\001\051\001\255\255\255\255\255\255\046\001\
\047\001\048\001\049\001\050\001\051\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\009\001\010\001\255\255\
\255\255\001\001\255\255\003\001\016\001\017\001\006\001\255\255\
\255\255\009\001\010\001\255\255\255\255\001\001\255\255\003\001\
\016\001\017\001\006\001\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\255\255\003\001\016\001\017\001\006\001\255\255\
\255\255\255\255\046\001\047\001\048\001\049\001\255\255\255\255\
\016\001\017\001\255\255\255\255\255\255\255\255\046\001\047\001\
\048\001\049\001\001\001\255\255\003\001\255\255\255\255\006\001\
\255\255\255\255\046\001\047\001\048\001\049\001\001\001\255\255\
\003\001\016\001\017\001\006\001\255\255\255\255\046\001\047\001\
\048\001\049\001\009\001\010\001\255\255\016\001\017\001\255\255\
\255\255\016\001\017\001\009\001\010\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\046\001\
\047\001\048\001\049\001\002\001\255\255\004\001\005\001\002\001\
\255\255\004\001\005\001\046\001\047\001\048\001\049\001\046\001\
\047\001\048\001\049\001\050\001\051\001\255\255\255\255\255\255\
\046\001\047\001\048\001\049\001\050\001\051\001\255\255\030\001\
\031\001\255\255\033\001\030\001\031\001\002\001\033\001\004\001\
\005\001\255\255\255\255\042\001\043\001\255\255\255\255\042\001\
\043\001\255\255\255\255\255\255\255\255\255\255\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\255\255\255\255\
\255\255\030\001\031\001\255\255\033\001\016\001\017\001\255\255\
\255\255\255\255\255\255\255\255\255\255\042\001\043\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  LBRACKET\000\
  RBRACKET\000\
  PLUS\000\
  MINUS\000\
  LONGER\000\
  SHORTER\000\
  ASSIGN\000\
  CONCAT\000\
  REMOVE\000\
  EQ\000\
  NEQ\000\
  OCTDOWN\000\
  OCTUP\000\
  HALFUP\000\
  HALFDOWN\000\
  ASSIGN_PLUS\000\
  ASSIGN_MINUS\000\
  ASSIGN_LONGER\000\
  ASSIGN_SHORTER\000\
  ASSIGN_OCTUP\000\
  ASSIGN_OCTDOWN\000\
  ASSIGN_CONCAT\000\
  ASSIGN_REMOVE\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  LOOP\000\
  CLOSEFILE\000\
  OPENFILE\000\
  TRUE\000\
  FALSE\000\
  TEMPO\000\
  STARTTRACK\000\
  STOPTRACK\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  ID\000\
  NOTE\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 31 "parser.mly"
                 ( [], [] )
# 310 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 32 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 318 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 36 "parser.mly"
     ( { fname = _1;
	 formals = _3;
	 body = List.rev _6 } )
# 329 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "parser.mly"
                  ( [] )
# 335 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 42 "parser.mly"
                  ( List.rev _1 )
# 342 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "parser.mly"
                         ( [_1] )
# 349 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "parser.mly"
                         ( _3 :: _1 )
# 357 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
                   ( [] )
# 363 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 50 "parser.mly"
                   ( _2 :: _1 )
# 371 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 53 "parser.mly"
              ( Expr(_1) )
# 378 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
                     ( Return(_2) )
# 385 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 55 "parser.mly"
                            ( Block(List.rev _2) )
# 392 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 56 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 400 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 57 "parser.mly"
                                            ( If(_3, _5, _7) )
# 409 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 58 "parser.mly"
                                  ( While(_3, _5) )
# 417 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
                  ( Noexpr )
# 423 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 62 "parser.mly"
                  ( _1 )
# 430 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 65 "parser.mly"
                     ( Literal(_1) )
# 437 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
                     ( Id(_1) )
# 444 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 67 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 452 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 68 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 460 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 69 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 468 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 476 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 484 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 492 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 500 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 508 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 516 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 524 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Assign(_1, _3) )
# 532 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 78 "parser.mly"
                                 ( Call(_1, _3) )
# 540 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                       ( _2 )
# 547 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
                  ( [] )
# 553 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 83 "parser.mly"
                  ( List.rev _1 )
# 560 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                            ( [_1] )
# 567 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                            ( _3 :: _1 )
# 575 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
