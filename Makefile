test: client.js
	firefox index.html 

client.byte: client.ml
	ocamlfind ocamlc -package js_of_ocaml -syntax camlp4o -linkpkg -o $@ $<

client.js: client.byte
	js_of_ocaml -o $@ $<
