MAINFILE=main

all: $(MAINFILE).pdf

$(MAINFILE).pdf: *.tex $(MAINFILE).bib
	xelatex -sumctex=1 -interaction=nonstopmode $(MAINFILE).tex
	biber --bblencoding=utf8 -u -U --output_safechars $(MAINFILE)
	xelatex -sumctex=1 -interaction=nonstopmode $(MAINFILE).tex
	xelatex -sumctex=1 -interaction=nonstopmode $(MAINFILE).tex

clean:
	rm -f $(MAINFILE).aux $(MAINFILE).log $(MAINFILE).out $(MAINFILE).pdf $(MAINFILE).toc missfont.log $(MAINFILE).blg $(MAINFILE).bbl $(MAINFILE).synctex.gz
