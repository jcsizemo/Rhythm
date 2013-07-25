%{ open Ast %}
%token EOF
%token <string> NOTE
%token <string> REST
%token <string> VARIABLE
%token CHORD ASSIGN
%token LP RP SC
%token FOR 


%start expr
%type <Ast.expr> expr
%%

expr:
NOTE { Note($1) } |
REST { Rest($1) } |
expr CHORD expr { Chord($1, $3) } |
VARIABLE { Variable($1) } |
VARIABLE ASSIGN expr { Assign($1, $3)}
