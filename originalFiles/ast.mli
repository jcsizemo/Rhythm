type expr =
Note of string |
Rest of string |
Chord of expr * expr |
Variable of string |
Assign of string * expr
