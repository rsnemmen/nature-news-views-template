# Makefile for building main.tex with LuaLaTeX (emoji-ready)
# macOS: 'open' is used to open the PDF.
# If latexmk is installed, it will be used automatically.
# Change MAIN if your top-level file has a different name.

SHELL := /bin/sh

MAIN ?= main
ENGINE ?= lualatex
ENGINE_OPTS ?= -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error

# Add other .tex files you \input or \include here, or let latexmk discover them.
DEPS := $(wildcard *.tex) $(wildcard *.bib)

HAVE_LATEXMK := $(shell command -v latexmk >/dev/null 2>&1 && echo yes || echo no)

.DEFAULT_GOAL := pdf

.PHONY: all pdf docx watch open clean distclean help

all: pdf

pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(DEPS)
ifeq ($(HAVE_LATEXMK),yes)
	latexmk -lualatex -use-make $(MAIN).tex
else
	$(ENGINE) $(ENGINE_OPTS) $(MAIN).tex
	$(ENGINE) $(ENGINE_OPTS) $(MAIN).tex
endif

# Build Word document via pandoc, ensuring the PDF build has succeeded
docx: $(MAIN).pdf
	pandoc $(MAIN).tex -s --from=latex --to=docx --resource-path=. --citeproc --bibliography=refs.bib -o $(MAIN).docx

open: $(MAIN).pdf
	@open "$(MAIN).pdf"

watch:
ifeq ($(HAVE_LATEXMK),yes)
	latexmk -lualatex -pvc -view=none $(MAIN).tex
else
	@echo "watch requires latexmk. Install it with: tlmgr install latexmk"
	@exit 1
endif

clean:
ifeq ($(HAVE_LATEXMK),yes)
	latexmk -c
endif
	@rm -f \
		"$(MAIN).aux" "$(MAIN).log" "$(MAIN).out" "$(MAIN).toc" "$(MAIN).synctex.gz" \
		"$(MAIN).bbl" "$(MAIN).blg" "$(MAIN).bcf" "$(MAIN).run.xml" "$(MAIN).fdb_latexmk" "$(MAIN).fls" \
		"$(MAIN).nav" "$(MAIN).snm" "$(MAIN).vrb" "$(MAIN).lol" "$(MAIN).lof" "$(MAIN).lot" "$(MAIN).loc" \
		"$(MAIN).tdo" "*.auxlock"

distclean: clean
	@rm -f "$(MAIN).pdf" "$(MAIN).docx"

help:
	@printf "%s\n" \
	"make            -> build $(MAIN).pdf (uses latexmk if available)" \
	"make watch      -> continuous recompilation (requires latexmk)" \
	"make open       -> open the PDF (macOS 'open')" \
	"make docx       -> build $(MAIN).docx via pandoc (after building PDF)" \
	"make clean      -> remove auxiliary files" \
	"make distclean  -> remove auxiliary files, the PDF, and the DOCX"
