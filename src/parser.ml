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
  | CHORD of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 54 "parser.ml"
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
  301 (* CHORD *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\003\000\005\000\005\000\004\000\
\004\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\008\000\008\000\009\000\009\000\000\000"

let yylen = "\002\000\
\000\000\002\000\007\000\000\000\001\000\001\000\003\000\000\000\
\002\000\002\000\003\000\003\000\005\000\007\000\005\000\006\000\
\001\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\004\000\003\000\
\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\002\000\000\000\006\000\000\000\
\000\000\000\000\000\000\008\000\007\000\000\000\000\000\008\000\
\003\000\000\000\000\000\000\000\000\000\017\000\000\000\019\000\
\009\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\010\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\032\000\012\000\011\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\022\000\
\023\000\000\000\000\000\000\000\031\000\000\000\000\000\015\000\
\000\000\000\000\000\000\016\000\014\000"

let yydgoto = "\002\000\
\003\000\005\000\008\000\014\000\009\000\025\000\026\000\053\000\
\054\000"

let yysindex = "\004\000\
\000\000\000\000\223\254\012\255\000\000\233\254\000\000\028\255\
\027\255\034\255\248\254\000\000\000\000\115\000\116\255\000\000\
\000\000\116\255\037\255\054\255\057\255\000\000\000\255\000\000\
\000\000\041\255\198\255\120\000\051\255\116\255\116\255\116\255\
\116\255\116\255\000\000\116\255\116\255\116\255\116\255\116\255\
\116\255\116\255\116\255\116\255\116\255\000\000\000\000\000\000\
\248\255\001\000\095\255\054\000\040\255\058\255\054\000\212\254\
\212\254\045\000\045\000\002\255\002\255\002\255\002\255\000\000\
\000\000\003\000\003\000\010\000\000\000\116\255\033\255\000\000\
\003\000\054\000\003\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\070\000\000\000\000\000\063\255\000\000\000\000\
\069\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\031\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\073\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\254\254\000\000\074\255\043\255\107\255\
\119\255\066\000\072\000\169\255\178\255\187\255\237\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\135\000\000\000\
\000\000\003\255\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\068\000\000\000\252\255\241\255\000\000\
\000\000"

let yytablesize = 435
let yytable = "\027\000\
\035\000\033\000\029\000\035\000\001\000\036\000\044\000\045\000\
\036\000\004\000\036\000\037\000\034\000\006\000\049\000\050\000\
\051\000\052\000\055\000\007\000\056\000\057\000\058\000\059\000\
\060\000\061\000\062\000\063\000\064\000\065\000\010\000\018\000\
\011\000\018\000\013\000\068\000\018\000\012\000\030\000\018\000\
\018\000\035\000\069\000\030\000\030\000\030\000\018\000\018\000\
\030\000\036\000\037\000\048\000\044\000\045\000\074\000\031\000\
\038\000\039\000\032\000\036\000\037\000\071\000\072\000\070\000\
\075\000\004\000\038\000\039\000\076\000\037\000\077\000\005\000\
\018\000\018\000\018\000\033\000\034\000\018\000\018\000\018\000\
\018\000\018\000\018\000\028\000\030\000\030\000\030\000\040\000\
\041\000\042\000\043\000\044\000\045\000\000\000\000\000\000\000\
\015\000\040\000\041\000\042\000\043\000\044\000\045\000\036\000\
\037\000\000\000\000\000\020\000\020\000\020\000\038\000\039\000\
\020\000\000\000\000\000\020\000\020\000\015\000\000\000\021\000\
\021\000\021\000\020\000\020\000\021\000\000\000\000\000\021\000\
\021\000\000\000\000\000\000\000\000\000\000\000\021\000\021\000\
\022\000\023\000\024\000\000\000\000\000\040\000\041\000\042\000\
\043\000\044\000\045\000\000\000\020\000\020\000\020\000\000\000\
\000\000\020\000\020\000\020\000\020\000\022\000\023\000\024\000\
\021\000\021\000\021\000\000\000\000\000\021\000\021\000\021\000\
\021\000\026\000\026\000\026\000\000\000\000\000\026\000\000\000\
\000\000\000\000\028\000\028\000\028\000\000\000\000\000\028\000\
\026\000\026\000\000\000\027\000\027\000\027\000\000\000\000\000\
\027\000\028\000\028\000\000\000\000\000\000\000\000\000\000\000\
\046\000\000\000\027\000\027\000\000\000\000\000\036\000\037\000\
\000\000\000\000\026\000\026\000\026\000\038\000\039\000\026\000\
\026\000\026\000\026\000\028\000\028\000\028\000\000\000\000\000\
\028\000\028\000\028\000\028\000\027\000\027\000\027\000\000\000\
\000\000\027\000\027\000\027\000\027\000\029\000\029\000\029\000\
\000\000\000\000\029\000\000\000\040\000\041\000\042\000\043\000\
\044\000\045\000\066\000\000\000\029\000\029\000\000\000\000\000\
\036\000\037\000\000\000\067\000\015\000\000\000\016\000\038\000\
\039\000\036\000\037\000\000\000\073\000\000\000\000\000\000\000\
\038\000\039\000\036\000\037\000\000\000\000\000\029\000\029\000\
\029\000\038\000\039\000\029\000\029\000\029\000\029\000\000\000\
\018\000\019\000\000\000\020\000\021\000\000\000\040\000\041\000\
\042\000\043\000\044\000\045\000\022\000\023\000\024\000\040\000\
\041\000\042\000\043\000\044\000\045\000\036\000\037\000\000\000\
\040\000\041\000\042\000\043\000\044\000\045\000\036\000\037\000\
\000\000\000\000\024\000\024\000\024\000\038\000\039\000\024\000\
\025\000\025\000\025\000\000\000\000\000\025\000\000\000\000\000\
\000\000\024\000\024\000\000\000\000\000\000\000\000\000\025\000\
\025\000\000\000\000\000\040\000\041\000\042\000\043\000\044\000\
\045\000\000\000\000\000\000\000\040\000\041\000\042\000\043\000\
\044\000\045\000\000\000\024\000\024\000\024\000\000\000\000\000\
\000\000\025\000\025\000\025\000\015\000\000\000\016\000\017\000\
\000\000\015\000\000\000\016\000\047\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\013\000\000\000\013\000\013\000\000\000\000\000\000\000\000\000\
\018\000\019\000\000\000\020\000\021\000\018\000\019\000\000\000\
\020\000\021\000\000\000\000\000\022\000\023\000\024\000\000\000\
\000\000\022\000\023\000\024\000\013\000\013\000\000\000\013\000\
\013\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\013\000\013\000\013\000"

let yycheck = "\015\000\
\003\001\002\001\018\000\006\001\001\000\003\001\051\001\052\001\
\006\001\043\001\009\001\010\001\013\001\002\001\030\000\031\000\
\032\000\033\000\034\000\043\001\036\000\037\000\038\000\039\000\
\040\000\041\000\042\000\043\000\044\000\045\000\003\001\001\001\
\006\001\003\001\043\001\051\000\006\001\004\001\002\001\009\001\
\010\001\001\001\003\001\001\001\002\001\003\001\016\001\017\001\
\006\001\009\001\010\001\001\001\051\001\052\001\070\000\002\001\
\016\001\017\001\002\001\009\001\010\001\066\000\067\000\006\001\
\032\001\003\001\016\001\017\001\073\000\000\000\075\000\003\001\
\042\001\043\001\044\001\003\001\003\001\047\001\048\001\049\001\
\050\001\051\001\052\001\016\000\042\001\043\001\044\001\047\001\
\048\001\049\001\050\001\051\001\052\001\255\255\255\255\255\255\
\002\001\047\001\048\001\049\001\050\001\051\001\052\001\009\001\
\010\001\255\255\255\255\001\001\002\001\003\001\016\001\017\001\
\006\001\255\255\255\255\009\001\010\001\002\001\255\255\001\001\
\002\001\003\001\016\001\017\001\006\001\255\255\255\255\009\001\
\010\001\255\255\255\255\255\255\255\255\255\255\016\001\017\001\
\042\001\043\001\044\001\255\255\255\255\047\001\048\001\049\001\
\050\001\051\001\052\001\255\255\042\001\043\001\044\001\255\255\
\255\255\047\001\048\001\049\001\050\001\042\001\043\001\044\001\
\042\001\043\001\044\001\255\255\255\255\047\001\048\001\049\001\
\050\001\001\001\002\001\003\001\255\255\255\255\006\001\255\255\
\255\255\255\255\001\001\002\001\003\001\255\255\255\255\006\001\
\016\001\017\001\255\255\001\001\002\001\003\001\255\255\255\255\
\006\001\016\001\017\001\255\255\255\255\255\255\255\255\255\255\
\003\001\255\255\016\001\017\001\255\255\255\255\009\001\010\001\
\255\255\255\255\042\001\043\001\044\001\016\001\017\001\047\001\
\048\001\049\001\050\001\042\001\043\001\044\001\255\255\255\255\
\047\001\048\001\049\001\050\001\042\001\043\001\044\001\255\255\
\255\255\047\001\048\001\049\001\050\001\001\001\002\001\003\001\
\255\255\255\255\006\001\255\255\047\001\048\001\049\001\050\001\
\051\001\052\001\003\001\255\255\016\001\017\001\255\255\255\255\
\009\001\010\001\255\255\003\001\002\001\255\255\004\001\016\001\
\017\001\009\001\010\001\255\255\003\001\255\255\255\255\255\255\
\016\001\017\001\009\001\010\001\255\255\255\255\042\001\043\001\
\044\001\016\001\017\001\047\001\048\001\049\001\050\001\255\255\
\030\001\031\001\255\255\033\001\034\001\255\255\047\001\048\001\
\049\001\050\001\051\001\052\001\042\001\043\001\044\001\047\001\
\048\001\049\001\050\001\051\001\052\001\009\001\010\001\255\255\
\047\001\048\001\049\001\050\001\051\001\052\001\009\001\010\001\
\255\255\255\255\001\001\002\001\003\001\016\001\017\001\006\001\
\001\001\002\001\003\001\255\255\255\255\006\001\255\255\255\255\
\255\255\016\001\017\001\255\255\255\255\255\255\255\255\016\001\
\017\001\255\255\255\255\047\001\048\001\049\001\050\001\051\001\
\052\001\255\255\255\255\255\255\047\001\048\001\049\001\050\001\
\051\001\052\001\255\255\042\001\043\001\044\001\255\255\255\255\
\255\255\042\001\043\001\044\001\002\001\255\255\004\001\005\001\
\255\255\002\001\255\255\004\001\005\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\002\001\255\255\004\001\005\001\255\255\255\255\255\255\255\255\
\030\001\031\001\255\255\033\001\034\001\030\001\031\001\255\255\
\033\001\034\001\255\255\255\255\042\001\043\001\044\001\255\255\
\255\255\042\001\043\001\044\001\030\001\031\001\255\255\033\001\
\034\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\042\001\043\001\044\001"

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
  CHORD\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 32 "parser.mly"
                 ( [], [] )
# 338 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 33 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 346 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 37 "parser.mly"
     ( { fname = _1;
	 formals = _3;
	 body = List.rev _6 } )
# 357 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "parser.mly"
                  ( [] )
# 363 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 43 "parser.mly"
                  ( List.rev _1 )
# 370 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "parser.mly"
                         ( [_1] )
# 377 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 47 "parser.mly"
                         ( _3 :: _1 )
# 385 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                   ( [] )
# 391 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 51 "parser.mly"
                   ( _2 :: _1 )
# 399 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
              ( Expr(_1) )
# 406 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 55 "parser.mly"
                     ( Return(_2) )
# 413 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 56 "parser.mly"
                            ( Block(List.rev _2) )
# 420 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 57 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 428 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 58 "parser.mly"
                                            ( If(_3, _5, _7) )
# 437 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 59 "parser.mly"
                                  ( While(_3, _5) )
# 445 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 60 "parser.mly"
                                      ( Loop(_3, _4, _6) )
# 454 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 64 "parser.mly"
                     ( Literal(_1) )
# 461 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 65 "parser.mly"
                     ( Id(_1) )
# 468 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
                     ( Note(_1) )
# 475 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 67 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 483 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 68 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 491 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 69 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 499 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 507 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 515 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 523 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 531 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 539 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 547 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 555 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Assign(_1, _3) )
# 563 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 78 "parser.mly"
                                 ( Call(_1, _3) )
# 571 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                       ( _2 )
# 578 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
                  ( [] )
# 584 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 83 "parser.mly"
                  ( List.rev _1 )
# 591 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                            ( [_1] )
# 598 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                            ( _3 :: _1 )
# 606 "parser.ml"
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
