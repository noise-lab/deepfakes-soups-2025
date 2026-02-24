PAPER = main
LATEX = pdflatex
BIBTEX = bibtex

all: $(PAPER).pdf

$(PAPER).pdf: $(PAPER).tex $(wildcard Sections/*.tex) ref.bib
	$(LATEX) $(PAPER)
	$(BIBTEX) $(PAPER) || true
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
	rm -f Sections/*.aux

distclean: clean
	rm -f $(PAPER).pdf

view: $(PAPER).pdf
	open $(PAPER).pdf

.PHONY: all clean distclean view
