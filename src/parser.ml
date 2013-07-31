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
  | VAR
  | EOF
  | ARRAY_SEP

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 57 "parser.ml"
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
  303 (* VAR *);
    0 (* EOF *);
  304 (* ARRAY_SEP *);
    0|]

let yytransl_block = [|
  299 (* LITERAL *);
  300 (* ID *);
  301 (* NOTE *);
  302 (* CHORD *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\003\000\006\000\006\000\004\000\
\004\000\007\000\005\000\005\000\008\000\008\000\008\000\008\000\
\008\000\008\000\008\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\010\000\010\000\011\000\011\000\000\000"

let yylen = "\002\000\
\000\000\002\000\008\000\000\000\001\000\001\000\003\000\000\000\
\002\000\003\000\000\000\002\000\002\000\003\000\003\000\005\000\
\007\000\005\000\007\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\004\000\003\000\003\000\
\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\002\000\000\000\006\000\000\000\
\000\000\000\000\000\000\008\000\007\000\000\000\000\000\000\000\
\009\000\000\000\000\000\011\000\003\000\000\000\000\000\000\000\
\000\000\000\000\020\000\000\000\022\000\012\000\000\000\010\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\013\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\031\000\015\000\032\000\014\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\030\000\000\000\
\000\000\018\000\000\000\000\000\000\000\000\000\017\000\019\000"

let yydgoto = "\002\000\
\003\000\005\000\008\000\014\000\016\000\009\000\017\000\030\000\
\031\000\058\000\059\000"

let yysindex = "\001\000\
\000\000\000\000\218\254\014\255\000\000\229\254\000\000\020\255\
\028\255\033\255\000\255\000\000\000\000\009\255\001\255\179\255\
\000\000\045\255\086\255\000\000\000\000\086\255\086\255\047\255\
\059\255\060\255\000\000\255\254\000\000\000\000\073\255\000\000\
\122\255\185\255\022\000\088\255\086\255\086\255\086\255\086\255\
\086\255\000\000\086\255\086\255\086\255\086\255\086\255\086\255\
\086\255\000\000\000\000\000\000\000\000\134\255\150\255\032\000\
\041\000\061\255\063\255\041\000\254\254\254\254\041\000\041\000\
\247\255\247\255\183\255\249\255\249\255\086\255\000\000\086\255\
\042\255\000\000\161\255\041\000\249\255\249\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\076\000\000\000\000\000\074\255\000\000\000\000\
\078\255\000\000\000\000\000\000\000\000\200\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\030\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\079\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\002\255\000\000\084\255\246\255\049\255\062\255\054\000\063\000\
\106\255\110\255\006\255\000\000\000\000\000\000\000\000\000\000\
\234\255\000\000\000\000\029\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\072\000\000\000\000\000\026\000\
\237\255\000\000\000\000"

let yytablesize = 345
let yytable = "\033\000\
\040\000\001\000\035\000\036\000\036\000\004\000\033\000\036\000\
\033\000\045\000\046\000\033\000\041\000\033\000\033\000\006\000\
\007\000\054\000\055\000\056\000\057\000\060\000\010\000\061\000\
\062\000\063\000\064\000\065\000\066\000\067\000\021\000\037\000\
\021\000\011\000\037\000\021\000\012\000\021\000\021\000\021\000\
\021\000\021\000\021\000\013\000\018\000\032\000\021\000\021\000\
\037\000\023\000\075\000\023\000\076\000\033\000\023\000\015\000\
\023\000\023\000\023\000\023\000\038\000\039\000\024\000\071\000\
\024\000\023\000\023\000\024\000\072\000\024\000\024\000\024\000\
\024\000\042\000\077\000\038\000\004\000\021\000\024\000\024\000\
\005\000\034\000\043\000\044\000\045\000\046\000\035\000\019\000\
\053\000\047\000\048\000\034\000\022\000\073\000\074\000\000\000\
\023\000\043\000\044\000\045\000\046\000\000\000\079\000\080\000\
\047\000\048\000\027\000\000\000\027\000\024\000\028\000\027\000\
\028\000\027\000\027\000\028\000\000\000\028\000\028\000\000\000\
\049\000\000\000\027\000\027\000\050\000\000\000\028\000\028\000\
\027\000\028\000\029\000\043\000\044\000\045\000\046\000\049\000\
\068\000\000\000\047\000\048\000\000\000\000\000\000\000\043\000\
\044\000\045\000\046\000\000\000\000\000\000\000\047\000\048\000\
\069\000\027\000\000\000\000\000\000\000\028\000\000\000\043\000\
\044\000\045\000\046\000\078\000\000\000\000\000\047\000\048\000\
\000\000\049\000\043\000\044\000\045\000\046\000\000\000\000\000\
\000\000\047\000\048\000\000\000\019\000\049\000\020\000\021\000\
\000\000\022\000\019\000\000\000\020\000\051\000\000\000\022\000\
\043\000\044\000\045\000\046\000\000\000\049\000\000\000\047\000\
\048\000\011\000\000\000\011\000\011\000\000\000\011\000\000\000\
\049\000\023\000\024\000\000\000\025\000\026\000\000\000\023\000\
\024\000\000\000\025\000\026\000\000\000\027\000\028\000\029\000\
\000\000\000\000\000\000\027\000\028\000\029\000\011\000\011\000\
\000\000\011\000\011\000\016\000\000\000\016\000\016\000\000\000\
\016\000\000\000\011\000\011\000\011\000\000\000\029\000\000\000\
\029\000\000\000\019\000\029\000\020\000\029\000\029\000\022\000\
\043\000\044\000\045\000\046\000\000\000\000\000\000\000\000\000\
\016\000\016\000\000\000\016\000\016\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\016\000\016\000\016\000\023\000\
\024\000\000\000\025\000\026\000\000\000\052\000\000\000\043\000\
\044\000\045\000\046\000\027\000\028\000\029\000\047\000\048\000\
\070\000\043\000\044\000\045\000\046\000\000\000\000\000\000\000\
\047\000\048\000\043\000\044\000\045\000\046\000\025\000\000\000\
\025\000\047\000\048\000\025\000\000\000\025\000\025\000\026\000\
\000\000\026\000\000\000\000\000\026\000\049\000\026\000\026\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\049\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\049\000"

let yycheck = "\019\000\
\002\001\001\000\022\000\023\000\003\001\044\001\001\001\006\001\
\003\001\012\001\013\001\006\001\014\001\008\001\009\001\002\001\
\044\001\037\000\038\000\039\000\040\000\041\000\003\001\043\000\
\044\000\045\000\046\000\047\000\048\000\049\000\001\001\003\001\
\003\001\006\001\006\001\006\001\004\001\008\001\009\001\010\001\
\011\001\012\001\013\001\044\001\044\001\001\001\017\001\018\001\
\002\001\001\001\070\000\003\001\072\000\048\001\006\001\047\001\
\008\001\009\001\010\001\011\001\002\001\002\001\001\001\003\001\
\003\001\017\001\018\001\006\001\006\001\008\001\009\001\010\001\
\011\001\001\001\033\001\000\000\003\001\048\001\017\001\018\001\
\003\001\003\001\010\001\011\001\012\001\013\001\003\001\002\001\
\001\001\017\001\018\001\020\000\007\001\068\000\069\000\255\255\
\048\001\010\001\011\001\012\001\013\001\255\255\077\000\078\000\
\017\001\018\001\001\001\255\255\003\001\048\001\001\001\006\001\
\003\001\008\001\009\001\006\001\255\255\008\001\009\001\255\255\
\048\001\255\255\017\001\018\001\003\001\255\255\017\001\018\001\
\043\001\044\001\045\001\010\001\011\001\012\001\013\001\048\001\
\003\001\255\255\017\001\018\001\255\255\255\255\255\255\010\001\
\011\001\012\001\013\001\255\255\255\255\255\255\017\001\018\001\
\003\001\048\001\255\255\255\255\255\255\048\001\255\255\010\001\
\011\001\012\001\013\001\003\001\255\255\255\255\017\001\018\001\
\255\255\048\001\010\001\011\001\012\001\013\001\255\255\255\255\
\255\255\017\001\018\001\255\255\002\001\048\001\004\001\005\001\
\255\255\007\001\002\001\255\255\004\001\005\001\255\255\007\001\
\010\001\011\001\012\001\013\001\255\255\048\001\255\255\017\001\
\018\001\002\001\255\255\004\001\005\001\255\255\007\001\255\255\
\048\001\031\001\032\001\255\255\034\001\035\001\255\255\031\001\
\032\001\255\255\034\001\035\001\255\255\043\001\044\001\045\001\
\255\255\255\255\255\255\043\001\044\001\045\001\031\001\032\001\
\255\255\034\001\035\001\002\001\255\255\004\001\005\001\255\255\
\007\001\255\255\043\001\044\001\045\001\255\255\001\001\255\255\
\003\001\255\255\002\001\006\001\004\001\008\001\009\001\007\001\
\010\001\011\001\012\001\013\001\255\255\255\255\255\255\255\255\
\031\001\032\001\255\255\034\001\035\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\043\001\044\001\045\001\031\001\
\032\001\255\255\034\001\035\001\255\255\008\001\255\255\010\001\
\011\001\012\001\013\001\043\001\044\001\045\001\017\001\018\001\
\009\001\010\001\011\001\012\001\013\001\255\255\255\255\255\255\
\017\001\018\001\010\001\011\001\012\001\013\001\001\001\255\255\
\003\001\017\001\018\001\006\001\255\255\008\001\009\001\001\001\
\255\255\003\001\255\255\255\255\006\001\048\001\008\001\009\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\048\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\048\001"

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
  VAR\000\
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
# 35 "parser.mly"
                 ( [], [] )
# 325 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 36 "parser.mly"
                 ( fst _1, (_2 :: snd _1) )
# 333 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 40 "parser.mly"
     ( { fname = _1;
   formals = _3;
   locals = List.rev _6;
   body = List.rev _7 } )
# 346 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parser.mly"
                  ( [] )
# 352 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 47 "parser.mly"
                  ( List.rev _1 )
# 359 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 50 "parser.mly"
                         ( [_1] )
# 366 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "parser.mly"
                         ( _3 :: _1 )
# 374 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                     ( [] )
# 380 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 55 "parser.mly"
                     ( _2 :: _1 )
# 388 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 58 "parser.mly"
               ( _2 )
# 395 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
                   ( [] )
# 401 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                   ( _2 :: _1 )
# 409 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
              ( Expr(_1) )
# 416 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 66 "parser.mly"
                     ( Return(_2) )
# 423 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 67 "parser.mly"
                            ( Block(List.rev _2) )
# 430 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 68 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 438 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 69 "parser.mly"
                                            ( If(_3, _5, _7) )
# 447 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 70 "parser.mly"
                                  ( While(_3, _5) )
# 455 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                                            ( Loop(_3, _5, _7) )
# 464 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 75 "parser.mly"
                     ( Literal(_1) )
# 471 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 76 "parser.mly"
                     ( Id(_1) )
# 478 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 77 "parser.mly"
                     ( Note(_1) )
# 485 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                     ( Binop(_1, Plus,   _3) )
# 493 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                     ( Binop(_1, Minus,   _3) )
# 501 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                      ( Binop(_1, Longer,  _3) )
# 509 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                      ( Binop(_1, Shorter,   _3) )
# 517 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 525 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 533 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Assign(_1, _3) )
# 541 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 85 "parser.mly"
                                 ( Call(_1, _3) )
# 549 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                       ( _2 )
# 556 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                           ( _2 )
# 563 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                        ( Array(_1, _3))
# 571 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser.mly"
                  ( [] )
# 577 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 93 "parser.mly"
                  ( List.rev _1 )
# 584 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                            ( [_1] )
# 591 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                            ( _3 :: _1 )
# 599 "parser.ml"
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
