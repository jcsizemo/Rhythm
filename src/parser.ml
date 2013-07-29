type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | LBRACKET
  | RBRACKET
  | COLON
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
  | CHORD of (string)
  | EOF
  | ARRAY_SEP

open Parsing;;
# 1 "parser.mly"
 open Ast 
# 55 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* LBRACKET *);
  264 (* RBRACKET *);
  265 (* COLON *);
  266 (* PLUS *);
  267 (* MINUS *);
  268 (* LONGER *);
  269 (* SHORTER *);
  270 (* ASSIGN *);
  271 (* CONCAT *);
  272 (* REMOVE *);
  273 (* EQ *);
  274 (* NEQ *);
  275 (* OCTDOWN *);
  276 (* OCTUP *);
  277 (* HALFUP *);
  278 (* HALFDOWN *);
  279 (* ASSIGN_PLUS *);
  280 (* ASSIGN_MINUS *);
  281 (* ASSIGN_LONGER *);
  282 (* ASSIGN_SHORTER *);
  283 (* ASSIGN_OCTUP *);
  284 (* ASSIGN_OCTDOWN *);
  285 (* ASSIGN_CONCAT *);
  286 (* ASSIGN_REMOVE *);
  287 (* RETURN *);
  288 (* IF *);
  289 (* ELSE *);
  290 (* WHILE *);
  291 (* LOOP *);
  292 (* CLOSEFILE *);
  293 (* OPENFILE *);
  294 (* TRUE *);
  295 (* FALSE *);
  296 (* TEMPO *);
  297 (* STARTTRACK *);
  298 (* STOPTRACK *);
    0 (* EOF *);
  303 (* ARRAY_SEP *);
    0|]

let yytransl_block = [|
  299 (* LITERAL *);
  300 (* ID *);
  301 (* NOTE *);
  302 (* CHORD *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\003\000\005\000\005\000\004\000\
\004\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\008\000\008\000\
\009\000\009\000\000\000"

let yylen = "\002\000\
\000\000\002\000\007\000\000\000\001\000\001\000\003\000\000\000\
\002\000\002\000\003\000\003\000\005\000\007\000\005\000\007\000\
\001\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\004\000\003\000\003\000\003\000\000\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\002\000\000\000\006\000\000\000\
\000\000\000\000\000\000\008\000\007\000\000\000\000\000\008\000\
\003\000\000\000\000\000\000\000\000\000\000\000\017\000\000\000\
\019\000\009\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\010\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\028\000\012\000\029\000\011\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\027\000\000\000\000\000\015\000\000\000\000\000\000\000\
\000\000\014\000\016\000"

let yydgoto = "\002\000\
\003\000\005\000\008\000\014\000\009\000\026\000\027\000\053\000\
\054\000"

let yysindex = "\001\000\
\000\000\000\000\218\254\014\255\000\000\234\254\000\000\030\255\
\037\255\032\255\000\255\000\000\000\000\177\255\099\255\000\000\
\000\000\099\255\099\255\043\255\046\255\053\255\000\000\255\254\
\000\000\000\000\072\255\117\255\183\255\236\255\086\255\099\255\
\099\255\099\255\099\255\099\255\000\000\099\255\099\255\099\255\
\099\255\099\255\099\255\099\255\000\000\000\000\000\000\000\000\
\128\255\149\255\005\000\018\000\057\255\055\255\018\000\254\254\
\254\254\018\000\018\000\032\000\032\000\181\255\232\255\232\255\
\099\255\000\000\099\255\035\255\000\000\160\255\018\000\232\255\
\232\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\063\000\000\000\000\000\071\255\000\000\000\000\
\074\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\029\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\077\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\002\255\000\000\078\255\085\255\048\255\
\061\255\249\255\031\000\104\255\108\255\006\255\000\000\000\000\
\000\000\000\000\000\000\198\255\000\000\000\000\028\255\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\059\000\000\000\084\000\241\255\000\000\
\000\000"

let yytablesize = 321
let yytable = "\028\000\
\035\000\001\000\030\000\031\000\033\000\004\000\030\000\033\000\
\030\000\040\000\041\000\030\000\036\000\030\000\030\000\006\000\
\049\000\050\000\051\000\052\000\055\000\007\000\056\000\057\000\
\058\000\059\000\060\000\061\000\062\000\018\000\034\000\018\000\
\010\000\034\000\018\000\012\000\018\000\018\000\018\000\018\000\
\018\000\018\000\011\000\013\000\032\000\018\000\018\000\033\000\
\020\000\070\000\020\000\071\000\030\000\020\000\034\000\020\000\
\020\000\020\000\020\000\066\000\067\000\021\000\035\000\021\000\
\020\000\020\000\021\000\072\000\021\000\021\000\021\000\021\000\
\037\000\004\000\029\000\018\000\005\000\021\000\021\000\031\000\
\032\000\038\000\039\000\040\000\041\000\026\000\048\000\026\000\
\042\000\043\000\026\000\000\000\026\000\026\000\020\000\038\000\
\039\000\040\000\041\000\000\000\015\000\000\000\042\000\043\000\
\024\000\018\000\024\000\021\000\025\000\024\000\025\000\024\000\
\024\000\025\000\000\000\025\000\025\000\000\000\044\000\045\000\
\024\000\024\000\000\000\000\000\025\000\025\000\038\000\039\000\
\040\000\041\000\063\000\000\000\044\000\042\000\043\000\000\000\
\000\000\038\000\039\000\040\000\041\000\023\000\024\000\025\000\
\042\000\043\000\068\000\069\000\000\000\000\000\024\000\064\000\
\000\000\000\000\025\000\074\000\075\000\000\000\038\000\039\000\
\040\000\041\000\073\000\044\000\000\000\042\000\043\000\000\000\
\000\000\038\000\039\000\040\000\041\000\000\000\044\000\000\000\
\042\000\043\000\015\000\000\000\016\000\017\000\000\000\018\000\
\015\000\000\000\016\000\046\000\000\000\018\000\038\000\039\000\
\040\000\041\000\000\000\044\000\000\000\042\000\043\000\013\000\
\000\000\013\000\013\000\000\000\013\000\000\000\044\000\019\000\
\020\000\000\000\021\000\022\000\000\000\019\000\020\000\000\000\
\021\000\022\000\000\000\023\000\024\000\025\000\000\000\000\000\
\000\000\023\000\024\000\025\000\013\000\013\000\000\000\013\000\
\013\000\015\000\000\000\016\000\000\000\000\000\018\000\000\000\
\013\000\013\000\013\000\047\000\000\000\038\000\039\000\040\000\
\041\000\022\000\000\000\022\000\042\000\043\000\022\000\000\000\
\022\000\022\000\000\000\000\000\000\000\000\000\019\000\020\000\
\000\000\021\000\022\000\000\000\000\000\065\000\038\000\039\000\
\040\000\041\000\023\000\024\000\025\000\042\000\043\000\000\000\
\000\000\000\000\044\000\038\000\039\000\040\000\041\000\023\000\
\000\000\023\000\042\000\043\000\023\000\000\000\023\000\023\000\
\000\000\038\000\039\000\040\000\041\000\000\000\000\000\000\000\
\000\000\000\000\000\000\044\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\044\000"

let yycheck = "\015\000\
\002\001\001\000\018\000\019\000\003\001\044\001\001\001\006\001\
\003\001\012\001\013\001\006\001\014\001\008\001\009\001\002\001\
\032\000\033\000\034\000\035\000\036\000\044\001\038\000\039\000\
\040\000\041\000\042\000\043\000\044\000\001\001\003\001\003\001\
\003\001\006\001\006\001\004\001\008\001\009\001\010\001\011\001\
\012\001\013\001\006\001\044\001\002\001\017\001\018\001\002\001\
\001\001\065\000\003\001\067\000\047\001\006\001\002\001\008\001\
\009\001\010\001\011\001\003\001\006\001\001\001\000\000\003\001\
\017\001\018\001\006\001\033\001\008\001\009\001\010\001\011\001\
\001\001\003\001\016\000\047\001\003\001\017\001\018\001\003\001\
\003\001\010\001\011\001\012\001\013\001\001\001\001\001\003\001\
\017\001\018\001\006\001\255\255\008\001\009\001\047\001\010\001\
\011\001\012\001\013\001\255\255\002\001\255\255\017\001\018\001\
\001\001\007\001\003\001\047\001\001\001\006\001\003\001\008\001\
\009\001\006\001\255\255\008\001\009\001\255\255\047\001\003\001\
\017\001\018\001\255\255\255\255\017\001\018\001\010\001\011\001\
\012\001\013\001\003\001\255\255\047\001\017\001\018\001\255\255\
\255\255\010\001\011\001\012\001\013\001\043\001\044\001\045\001\
\017\001\018\001\063\000\064\000\255\255\255\255\047\001\003\001\
\255\255\255\255\047\001\072\000\073\000\255\255\010\001\011\001\
\012\001\013\001\003\001\047\001\255\255\017\001\018\001\255\255\
\255\255\010\001\011\001\012\001\013\001\255\255\047\001\255\255\
\017\001\018\001\002\001\255\255\004\001\005\001\255\255\007\001\
\002\001\255\255\004\001\005\001\255\255\007\001\010\001\011\001\
\012\001\013\001\255\255\047\001\255\255\017\001\018\001\002\001\
\255\255\004\001\005\001\255\255\007\001\255\255\047\001\031\001\
\032\001\255\255\034\001\035\001\255\255\031\001\032\001\255\255\
\034\001\035\001\255\255\043\001\044\001\045\001\255\255\255\255\
\255\255\043\001\044\001\045\001\031\001\032\001\255\255\034\001\
\035\001\002\001\255\255\004\001\255\255\255\255\007\001\255\255\
\043\001\044\001\045\001\008\001\255\255\010\001\011\001\012\001\
\013\001\001\001\255\255\003\001\017\001\018\001\006\001\255\255\
\008\001\009\001\255\255\255\255\255\255\255\255\031\001\032\001\
\255\255\034\001\035\001\255\255\255\255\009\001\010\001\011\001\
\012\001\013\001\043\001\044\001\045\001\017\001\018\001\255\255\
\255\255\255\255\047\001\010\001\011\001\012\001\013\001\001\001\
\255\255\003\001\017\001\018\001\006\001\255\255\008\001\009\001\
\255\255\010\001\011\001\012\001\013\001\255\255\255\255\255\255\
\255\255\255\255\255\255\047\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\047\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  LBRACKET\000\
  RBRACKET\000\
  COLON\000\
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
  ARRAY_SEP\000\
  "

let yynames_block = "\
  LITERAL\000\
  ID\000\
  NOTE\000\
  CHORD\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "parser.mly"
                 ( [], [] )
# 315 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 35 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 323 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 40 "parser.mly"
     ( { fname = _1;
	 formals = _3;
	 body = List.rev _6 } )
# 334 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parser.mly"
                  ( [] )
# 340 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 47 "parser.mly"
                  ( List.rev _1 )
# 347 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 50 "parser.mly"
                         ( [_1] )
# 354 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "parser.mly"
                         ( _3 :: _1 )
# 362 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                   ( [] )
# 368 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 55 "parser.mly"
                   ( _2 :: _1 )
# 376 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 58 "parser.mly"
              ( Expr(_1) )
# 383 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                     ( Return(_2) )
# 390 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 60 "parser.mly"
                            ( Block(List.rev _2) )
# 397 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 405 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                                            ( If(_3, _5, _7) )
# 414 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 63 "parser.mly"
                                  ( While(_3, _5) )
# 422 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "parser.mly"
                                            ( Loop(_3, _5, _7) )
# 431 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 68 "parser.mly"
                     ( Literal(_1) )
# 438 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
                     ( Id(_1) )
# 445 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 70 "parser.mly"
                     ( Note(_1) )
# 452 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                     ( Binop(_1, Plus,   _3) )
# 460 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                     ( Binop(_1, Minus,   _3) )
# 468 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                      ( Binop(_1, Longer,  _3) )
# 476 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                      ( Binop(_1, Shorter,   _3) )
# 484 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 492 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 500 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Assign(_1, _3) )
# 508 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 78 "parser.mly"
                                 ( Call(_1, _3) )
# 516 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                       ( _2 )
# 523 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                           ( _2 )
# 530 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                        ( Array(_1, _3))
# 538 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "parser.mly"
                  ( [] )
# 544 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 86 "parser.mly"
                  ( List.rev _1 )
# 551 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                            ( [_1] )
# 558 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                            ( _3 :: _1 )
# 566 "parser.ml"
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
