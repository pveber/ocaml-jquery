JS_OF_OCAML?=$(shell ocamlfind query js_of_ocaml)
LIB=$(JS_OF_OCAML_PATH)/lib

OCAMLFLAGS=$(INCLUDES) -package js_of_ocaml.syntax -syntax camlp4o
OCAMLIFLAGS=$(INCLUDES) -package js_of_ocaml -pp "cpp -traditional-cpp"
OQUERY=oquery.cma
LIBRARY=oquery
MLS=$(shell find * -name "*.ml")
MLIS=$(shell find * -name "*.mli")
OCAMLFIND=ocamlfind
OCAMLDOC=ocamldoc
CMOS=tools.cmo effects.cmo jQuery.cmo
CMIS=tools.cmi effects.cmi jQuery.cmi

all: $(OQUERY)

examples: all
	@(${MAKE} -C examples);


-include .depend

$(OQUERY): $(CMOS)
	$(OCAMLFIND) ocamlc -a -o $@ $^

.SECONDEXPANSION:

%.cmo: %.ml
	@echo "[CC] $@"
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -c $<

%.cmi: %.mli
	$(OCAMLFIND) ocamlc $(OCAMLIFLAGS) -c $<

depend: ocamldep

ocamldep:
	($(OCAMLFIND) ocamldep $(OCAMLFLAGS) $(MLS); \
	$(OCAMLFIND) ocamldep $(OCAMLIFLAGS) $(MLIS)) > .depend

cleanall: clean
	-rm -f .depend

clean:
	@echo "[CLEAN]"
	-rm -f $(OQUERY)
	-find . -name "*.cm[oix]" -exec rm {} \;
	-find . -name "*.cm[t]" -exec rm {} \;
	-find . -name "*.cmt[i]" -exec rm {} \;
	${MAKE} -C examples clean

install:
	ocamlfind install jquery META oquery.cma $(CMIS) $(MLIS)

uninstall:
	ocamlfind remove jquery
