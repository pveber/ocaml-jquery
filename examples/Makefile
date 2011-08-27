SRC=$(wildcard *.ml)
EXECS=$(SRC:.ml=.byte)
TARGETS=$(SRC:.ml=.js)
OQUERY=oquery.cma
LIB=-package js_of_ocaml $(OQUERY)
OCAMLFLAGS=-package js_of_ocaml.syntax -syntax camlp4o -I $(LIBDIR)
OCAMLLFLAGS=
LIBDIR=..
all: $(TARGETS)

%.byte: %.ml $(LIBDIR)/$(OQUERY)
	@echo "[CC]" $@
	ocamlfind ocamlc -linkpkg -o $@ $(OCAMLFLAGS) $(LIB) $<

%.js: %.byte
	js_of_ocaml $^ -pretty

ocamldep:
	ocamlfind ocamldep -I $(LIBDIR) $(OCAMLFLAGS) $(SRC) 

clean:
	@echo "[CLEAN]"
	-rm -f *.cmo *.cmi $(TARGETS) $(EXECS)

var: 
	@echo $(TARGETS)
	@echo $(EXECS)
