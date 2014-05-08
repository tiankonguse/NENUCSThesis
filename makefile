LATEX=xelatex
DVIPS=dvips
PS2PDF=ps2pdf
BIBTEX=bibtex

#LATEX_OPTS=-interaction=nonstopmode
LATEX_OPTS=
DVIPS_OPTS=-q
PS2PDF_OPTS=-dSubsetFonts=true -dEmbedAllFonts=true
BIBTEX_OPTS=

.PHONY: all clean

all: tiankonguse.pdf

# one
# The first compile finds all the cite commands and makes
# a list of them in the .aux file, and takes note of the 
# bibliography style.

# two
# Then bibtex processes the aux file and using the bibliography style, and 
# the list of citations creates a .bbl file which contains the bibliography.

# three
# The next latex compile doesn't resolve the references either, 
# but reads the .bbl file and keeps track of the citations.

# four
# Finally the last latex compile resolves all the references. 

tiankonguse.pdf : tiankonguse.tex
	$(LATEX) $(LATEX_OPTS) $^ 
	$(BIBTEX) tiankonguse
	$(BIBTEX) tiankonguse
	$(LATEX) $(LATEX_OPTS) $^ 
	$(LATEX) $(LATEX_OPTS) $^ 
	
again:tiankonguse.tex
	$(LATEX) $(LATEX_OPTS) $^ 

clean:
	rm -rf *.dvi *.ps *.log *.bbl *.blg *.toc *.out *.aux  *.lof *.lot
	rm -rf ./pages/*.bbl ./pages/*.blg ./pages/*.aux

