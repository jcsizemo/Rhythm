%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA LBRACKET RBRACKET 
%token COLON
%token PLUS MINUS LONGER SHORTER ASSIGN CONCAT REMOVE
%token EQ NEQ OCTDOWN OCTUP HALFUP HALFDOWN
%token ASSIGN_PLUS ASSIGN_MINUS ASSIGN_LONGER
%token ASSIGN_SHORTER ASSIGN_OCTUP ASSIGN_OCTDOWN
%token ASSIGN_CONCAT ASSIGN_REMOVE
%token RETURN IF ELSE WHILE LOOP
%token CLOSEFILE OPENFILE TRUE FALSE TEMPO
%token STARTTRACK STOPTRACK
%token <int> LITERAL
%token <string> ID
%token <string> NOTE
%token <string> CHORD
%token VAR
%token EOF
%token ARRAY_SEP

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left ARRAY_SEP
%left EQ NEQ
%left PLUS MINUS
%left TIMES DIVIDE

%start program
%type <Ast.program> program

%%
/* program: just a set of functions */
program:
   /* nothing */ { [], [] }
 | program fdecl { fst $1, ($2 :: snd $1) }

fdecl:
   ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
     { { fname = $1;
   formals = $3;
   locals = List.rev $6;
   body = List.rev $7 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    ID                   { [$1] }
  | formal_list COMMA ID { $3 :: $1 }

vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   VAR ID SEMI { $2 }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI { Expr($1) }
  | RETURN expr SEMI { Return($2) }
  | LBRACE stmt_list RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | WHILE LPAREN expr RPAREN stmt { While($3, $5) }
  | LOOP LPAREN expr COLON expr RPAREN stmt { Loop($3, $5, $7) }


expr:
    LITERAL          { Literal($1) }
  | ID               { Id($1) }
  | NOTE             { Note($1) }
  | expr PLUS   expr { Binop($1, Plus,   $3) }
  | expr MINUS  expr { Binop($1, Minus,   $3) }
  | expr LONGER  expr { Binop($1, Longer,  $3) }
  | expr SHORTER expr { Binop($1, Shorter,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | ID ASSIGN expr   { Assign($1, $3) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 }
  | LBRACKET expr RBRACKET { $2 }
  | expr ARRAY_SEP expr { Array($1, $3)}

/* passed in args to a function */
actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
