SRC=utils.ml snake.ml
EXECS=snake.byte
TARGETS=snake.js
OQUERY=oquery.cma
LIB=utils.cmo -package js_of_ocaml $(OQUERY)
OCAMLFLAGS=-package js_of_ocaml.syntax -syntax camlp4o -I $(LIBDIR)
OCAMLLFLAGS=
OCAMLFIND=ocamlfind
OCAMLC=ocamlc
LIBDIR=../..

all: utils.cmi utils.cmo $(TARGETS)

%.cmo: %.ml 
	$(OCAMLFIND) $(OCAMLC) $(OCAMLFLAGS) -c $<

%.cmi: %.mli
	$(OCAMLFIND) $(OCAMLC) $(OCAMLFLAGS) -c $<

%.byte: %.ml $(LIBDIR)/$(OQUERY)
	@echo "[CC]" $@
	ocamlfind ocamlc -linkpkg -o $@ $(OCAMLFLAGS) $(LIB) $<

%.js: %.byte
	js_of_ocaml $^ -pretty

depend:
	ocamlfind ocamldep -I $(LIBDIR) $(OCAMLFLAGS) $(SRC) > .depend

clean:
	@echo "[CLEAN]"
	-rm -f *.cmo *.cmi *.cmt* $(TARGETS) $(EXECS)

var: 
	@echo $(TARGETS)
	@echo $(EXECS)
