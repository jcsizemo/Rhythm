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
\007\000\007\000\007\000\007\000\007\000\008\000\008\000\009\000\
\009\000\000\000"

let yylen = "\002\000\
\000\000\002\000\007\000\000\000\001\000\001\000\003\000\000\000\
\002\000\002\000\003\000\003\000\005\000\007\000\005\000\007\000\
\001\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\004\000\003\000\003\000\000\000\001\000\001\000\
\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\002\000\000\000\006\000\000\000\
\000\000\000\000\000\000\008\000\007\000\000\000\000\000\008\000\
\003\000\000\000\000\000\000\000\000\000\017\000\000\000\019\000\
\009\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\010\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\028\000\012\000\011\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\027\000\000\000\
\000\000\015\000\000\000\000\000\000\000\000\000\014\000\016\000"

let yydgoto = "\002\000\
\003\000\005\000\008\000\014\000\009\000\025\000\026\000\050\000\
\051\000"

let yysindex = "\001\000\
\000\000\000\000\223\254\012\255\000\000\232\254\000\000\026\255\
\028\255\031\255\253\254\000\000\000\000\174\255\096\255\000\000\
\000\000\096\255\040\255\041\255\050\255\000\000\255\254\000\000\
\000\000\069\255\114\255\179\255\083\255\096\255\096\255\096\255\
\096\255\096\255\000\000\096\255\096\255\096\255\096\255\096\255\
\096\255\096\255\000\000\000\000\000\000\125\255\146\255\236\255\
\245\255\054\255\047\255\245\255\019\255\019\255\245\255\245\255\
\010\000\010\000\177\255\199\255\199\255\096\255\000\000\096\255\
\025\255\000\000\157\255\245\255\199\255\199\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\060\000\000\000\000\000\062\255\000\000\000\000\
\063\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\027\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\068\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\002\255\000\000\070\255\082\255\045\255\058\255\002\000\009\000\
\101\255\105\255\003\255\000\000\000\000\000\000\000\000\000\000\
\194\255\000\000\000\000\004\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\056\000\000\000\084\000\241\255\000\000\
\000\000"

let yytablesize = 292
let yytable = "\027\000\
\033\000\001\000\029\000\029\000\032\000\029\000\033\000\032\000\
\029\000\033\000\004\000\029\000\034\000\006\000\046\000\047\000\
\048\000\049\000\052\000\007\000\053\000\054\000\055\000\056\000\
\057\000\058\000\059\000\018\000\010\000\018\000\038\000\039\000\
\018\000\011\000\012\000\018\000\018\000\018\000\018\000\018\000\
\013\000\030\000\031\000\018\000\018\000\020\000\067\000\020\000\
\068\000\029\000\020\000\032\000\064\000\020\000\020\000\020\000\
\063\000\069\000\021\000\034\000\021\000\020\000\020\000\021\000\
\004\000\005\000\021\000\021\000\021\000\035\000\030\000\028\000\
\031\000\018\000\021\000\021\000\000\000\000\000\036\000\037\000\
\038\000\039\000\026\000\045\000\026\000\040\000\041\000\026\000\
\000\000\000\000\026\000\020\000\036\000\037\000\038\000\039\000\
\000\000\015\000\000\000\040\000\041\000\024\000\000\000\024\000\
\021\000\025\000\024\000\025\000\000\000\024\000\025\000\000\000\
\000\000\025\000\000\000\042\000\043\000\024\000\024\000\000\000\
\000\000\025\000\025\000\036\000\037\000\038\000\039\000\060\000\
\000\000\042\000\040\000\041\000\000\000\000\000\036\000\037\000\
\038\000\039\000\022\000\023\000\024\000\040\000\041\000\065\000\
\066\000\000\000\000\000\024\000\061\000\000\000\000\000\025\000\
\071\000\072\000\000\000\036\000\037\000\038\000\039\000\070\000\
\042\000\000\000\040\000\041\000\000\000\000\000\036\000\037\000\
\038\000\039\000\000\000\042\000\000\000\040\000\041\000\015\000\
\000\000\016\000\017\000\000\000\015\000\000\000\016\000\044\000\
\000\000\000\000\036\000\037\000\038\000\039\000\000\000\000\000\
\042\000\040\000\041\000\013\000\000\000\013\000\013\000\000\000\
\015\000\000\000\016\000\042\000\018\000\019\000\000\000\020\000\
\021\000\018\000\019\000\000\000\020\000\021\000\000\000\000\000\
\022\000\023\000\024\000\000\000\000\000\022\000\023\000\024\000\
\013\000\013\000\000\000\013\000\013\000\018\000\019\000\000\000\
\020\000\021\000\000\000\000\000\013\000\013\000\013\000\000\000\
\000\000\022\000\023\000\024\000\062\000\036\000\037\000\038\000\
\039\000\000\000\000\000\000\000\040\000\041\000\036\000\037\000\
\038\000\039\000\022\000\000\000\022\000\040\000\041\000\022\000\
\000\000\023\000\022\000\023\000\000\000\000\000\023\000\000\000\
\000\000\023\000\000\000\036\000\037\000\038\000\039\000\000\000\
\000\000\000\000\042\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\042\000"

let yycheck = "\015\000\
\002\001\001\000\018\000\001\001\003\001\003\001\003\001\006\001\
\006\001\006\001\044\001\009\001\014\001\002\001\030\000\031\000\
\032\000\033\000\034\000\044\001\036\000\037\000\038\000\039\000\
\040\000\041\000\042\000\001\001\003\001\003\001\012\001\013\001\
\006\001\006\001\004\001\009\001\010\001\011\001\012\001\013\001\
\044\001\002\001\002\001\017\001\018\001\001\001\062\000\003\001\
\064\000\047\001\006\001\002\001\006\001\009\001\010\001\011\001\
\003\001\033\001\001\001\000\000\003\001\017\001\018\001\006\001\
\003\001\003\001\009\001\010\001\011\001\001\001\003\001\016\000\
\003\001\047\001\017\001\018\001\255\255\255\255\010\001\011\001\
\012\001\013\001\001\001\001\001\003\001\017\001\018\001\006\001\
\255\255\255\255\009\001\047\001\010\001\011\001\012\001\013\001\
\255\255\002\001\255\255\017\001\018\001\001\001\255\255\003\001\
\047\001\001\001\006\001\003\001\255\255\009\001\006\001\255\255\
\255\255\009\001\255\255\047\001\003\001\017\001\018\001\255\255\
\255\255\017\001\018\001\010\001\011\001\012\001\013\001\003\001\
\255\255\047\001\017\001\018\001\255\255\255\255\010\001\011\001\
\012\001\013\001\043\001\044\001\045\001\017\001\018\001\060\000\
\061\000\255\255\255\255\047\001\003\001\255\255\255\255\047\001\
\069\000\070\000\255\255\010\001\011\001\012\001\013\001\003\001\
\047\001\255\255\017\001\018\001\255\255\255\255\010\001\011\001\
\012\001\013\001\255\255\047\001\255\255\017\001\018\001\002\001\
\255\255\004\001\005\001\255\255\002\001\255\255\004\001\005\001\
\255\255\255\255\010\001\011\001\012\001\013\001\255\255\255\255\
\047\001\017\001\018\001\002\001\255\255\004\001\005\001\255\255\
\002\001\255\255\004\001\047\001\031\001\032\001\255\255\034\001\
\035\001\031\001\032\001\255\255\034\001\035\001\255\255\255\255\
\043\001\044\001\045\001\255\255\255\255\043\001\044\001\045\001\
\031\001\032\001\255\255\034\001\035\001\031\001\032\001\255\255\
\034\001\035\001\255\255\255\255\043\001\044\001\045\001\255\255\
\255\255\043\001\044\001\045\001\009\001\010\001\011\001\012\001\
\013\001\255\255\255\255\255\255\017\001\018\001\010\001\011\001\
\012\001\013\001\001\001\255\255\003\001\017\001\018\001\006\001\
\255\255\001\001\009\001\003\001\255\255\255\255\006\001\255\255\
\255\255\009\001\255\255\010\001\011\001\012\001\013\001\255\255\
\255\255\255\255\047\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\047\001"

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
# 304 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 35 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 312 "parser.ml"
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
# 323 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parser.mly"
                  ( [] )
# 329 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 47 "parser.mly"
                  ( List.rev _1 )
# 336 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 50 "parser.mly"
                         ( [_1] )
# 343 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "parser.mly"
                         ( _3 :: _1 )
# 351 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                   ( [] )
# 357 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 55 "parser.mly"
                   ( _2 :: _1 )
# 365 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 58 "parser.mly"
              ( Expr(_1) )
# 372 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                     ( Return(_2) )
# 379 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 60 "parser.mly"
                            ( Block(List.rev _2) )
# 386 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 394 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                                            ( If(_3, _5, _7) )
# 403 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 63 "parser.mly"
                                  ( While(_3, _5) )
# 411 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "parser.mly"
                                            ( Loop(_3, _5, _7) )
# 420 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 68 "parser.mly"
                     ( Literal(_1) )
# 427 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
                     ( Id(_1) )
# 434 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 70 "parser.mly"
                     ( Note(_1) )
# 441 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                     ( Binop(_1, Plus,   _3) )
# 449 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                     ( Binop(_1, Minus,   _3) )
# 457 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                      ( Binop(_1, Longer,  _3) )
# 465 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                      ( Binop(_1, Shorter,   _3) )
# 473 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 481 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 489 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Assign(_1, _3) )
# 497 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 78 "parser.mly"
                                 ( Call(_1, _3) )
# 505 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                       ( _2 )
# 512 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                        ( Array(_1, _3))
# 520 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "parser.mly"
                  ( [] )
# 526 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 85 "parser.mly"
                  ( List.rev _1 )
# 533 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                            ( [_1] )
# 540 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                            ( _3 :: _1 )
# 548 "parser.ml"
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
