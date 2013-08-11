%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA LBRACKET RBRACKET 
%token COLON
%token PLUS MINUS ASSIGN CONCAT
%token EQ NEQ OCTDOWN OCTUP HALFUP HALFDOWN
%token LT LEQ GT GEQ

%token INCREASE_DURATION DECREASE_DURATION
%token ASSIGN_PLUS ASSIGN_MINUS ASSIGN_REMOVE
%token ASSIGN_OCTUP ASSIGN_OCTDOWN
%token ASSIGN_CONCAT
%token RETURN IF ELSE WHILE LOOP
%token CLOSEFILE OPENFILE TRUE FALSE TEMPO
%token STARTTRACK STOPTRACK
%token <int> LITERAL
%token <string> ID
%token <string> NOTE
%token <string> REST
%token EOF
%token  DEF

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_OCTUP ASSIGN_OCTDOWN ASSIGN_CONCAT
%left EQ NEQ
%left LT GT LEQ GEQ
%left CONCAT
%left PLUS MINUS

%start program
%type <Ast.program> program

%%
/* program: just a set of functions */
program:
   /* nothing */ { [], [] }
 | program vdecl { ($2 :: fst $1), snd $1 }
 | program fdecl { fst $1, ($2 :: snd $1) }

fdecl:
   ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
     { { fname = $1;
   formals = $3;
   locals = List.rev $6;
   body = List.rev $7 } }

/* declared function args */
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
   DEF ID SEMI { $2 } 

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
  | REST             { Rest($1) }
  | expr PLUS   expr { Binop($1, Plus,   $3) }
  | expr MINUS  expr { Binop($1, Minus,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | expr LT     expr { Binop($1, Less, $3) }
  | expr LEQ     expr { Binop($1, Leq, $3) }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ     expr { Binop($1, Geq, $3) }
  | expr CONCAT expr { Binop($1, Concat, $3) }
  | expr ASSIGN expr   { Assign($1, $3) }
  | expr INCREASE_DURATION expr { Binop($1, IncDuration, $3)}
  | expr DECREASE_DURATION expr { Binop($1, DecDuration, $3)}
  | expr ASSIGN_PLUS expr { Assign($1, Binop($1,Plus,$3) )}
  | expr ASSIGN_MINUS expr { Assign($1, Binop($1,Minus,$3) )}
  | expr ASSIGN_OCTUP expr { Assign($1, Binop($1,Octup,$3) )}
  | expr ASSIGN_OCTDOWN expr { Assign($1, Binop($1,Octdown,$3) )}
  | expr ASSIGN_CONCAT expr { Assign($1, Binop($1,Concat,$3) )}
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | LPAREN expr RPAREN { $2 }
  | LBRACKET actuals_opt RBRACKET { Array($2) }
  | ID index_opt { Index($1,$2) }

/* passed in args to a function */
actuals_opt:
    /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
    expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

index_opt:
  indices { List.rev $1 }

indices:
  LBRACKET LITERAL RBRACKET { [$2] }
  | indices LBRACKET LITERAL RBRACKET {$3 :: $1}
