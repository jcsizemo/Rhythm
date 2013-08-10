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
  | ASSIGN
  | CONCAT
  | EQ
  | NEQ
  | OCTDOWN
  | OCTUP
  | HALFUP
  | HALFDOWN
  | LT
  | LEQ
  | GT
  | GEQ
  | INCREASE_DURATION
  | DECREASE_DURATION
  | ASSIGN_PLUS
  | ASSIGN_MINUS
  | ASSIGN_REMOVE
  | ASSIGN_OCTUP
  | ASSIGN_OCTDOWN
  | ASSIGN_CONCAT
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
  | DEF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
