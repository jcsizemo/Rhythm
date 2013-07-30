#!/bin/sh

rm *.cmo *.cmi *.mli

ocamllex scanner.mll # create scanner.ml
ocamlyacc parser.mly # create parser.ml and parser.mli
ocamlc -c ast.ml # compile AST types
ocamlc -c parser.mli # compile parser types
ocamlc -c scanner.ml # compile the scanner
ocamlc -c parser.ml # compile the parser
ocamlc -c interpret.ml 
ocamlc -c rhythm_simple.ml 

ocamlc -o rhythm_simple  ast.cmo parser.cmo scanner.cmo interpret.cmo microc.cmo

#./microc -c <test-arith1.mc> test-arith1.i.out

							 

#Run "./microc" "-i" "<" "test-arith1.mc" ">" "yuankai-arith".i.out
