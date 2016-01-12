KIERUNKOWE_DIR := Kierunkowe
KIERUNKOWE := $(wildcard $(KIERUNKOWE_DIR)/*.tex)

SPECJALIZACJE = INT INS
SPECJALNOSCIOWE_DIR := Specjalnosciowe
SPECJALNOSCIOWE := $(wildcard $(SPECJALNOSCIOWE_DIR)/*.tex)

.PHONY: all
all: kierunkowe.tex specjalnosciowe.tex F

kierunkowe.tex: $(KIERUNKOWE)
	ls $(KIERUNKOWE_DIR)/*.tex | awk '{printf "\\input{%s}\n", $$1}' > kierunkowe.tex

specjalnosciowe.tex: $(SPECJALNOSCIOWE)
	truncate -s0 specjalnosciowe.tex
	for specjalnosc in $(SPECJALIZACJE); do \
		ls $(SPECJALNOSCIOWE_DIR)/$$specjalnosc/*.tex | awk '{printf "\\input{%s}\n", $$1}' > $$specjalnosc.tex ; \
		printf "\\input{%s}\n" $$specjalnosc | tee -a specjalnosciowe.tex ; \
	done

F:

