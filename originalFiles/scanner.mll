{ open Parser }
rule token =
parse [' ' '\t' '\r' '\n'] { token lexbuf }
| (['A'-'G']['#' 'b']?['0'-'9']) as note { NOTE(note) }
| ('R'['1'-'9']['0'-'9']*) as rest { REST(rest) }
| '$'['A'-'Z' 'a'-'z' '_']+ as var { VARIABLE(var) }
| '|' { CHORD }
| '=' { ASSIGN } 
| ';' { SC }
| "RP" { RP }
| "LP" { LP }
| eof { EOF }