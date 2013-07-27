{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '['	   { LBRACKET }
| ']'	   { RBRACKET }
| '{'      { LBRACE }
| '}'      { RBRACE }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { LONGER }
| '/'      { SHORTER }
| '='      { ASSIGN }
| "::"	   { CONCAT }
| "!:"	   { REMOVE }
| "=="     		{ EQ }
| "!="     		{ NEQ }
| "<<"      	{ OCTDOWN }
| ">>"     		{ OCTUP }
| "++"			{ HALFUP }
| "--"			{ HALFDOWN }
| "+="			{ ASSIGN_PLUS }
| "-="			{ ASSIGN_MINUS }
| "*="			{ ASSIGN_LONGER }
| "/="			{ ASSIGN_SHORTER }
| ">>="			{ ASSIGN_OCTUP }
| "<<="			{ ASSIGN_OCTDOWN }
| "::="			{ ASSIGN_CONCAT }
| "!:="			{ ASSIGN_REMOVE }
| "if"     		{ IF }
| "else"   		{ ELSE }
| "while"  		{ WHILE }
| "return" 		{ RETURN }
| "loop"   		{ LOOP }
| "openFile" 	{ OPENFILE }
| "closeFile" 	{ CLOSEFILE }
| "true"   		{ TRUE }
| "false"		{ FALSE }
| "tempo"		{ TEMPO }
| "startTrack"	{ STARTTRACK }
| "stopTrack"	{ STOPTRACK }
| ['-']?['0'-'9']+ as lxm { LITERAL(int_of_string lxm) }
| ['A' - 'G']['b' '#']?['0'-'9'] as lxm { NOTE(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }
