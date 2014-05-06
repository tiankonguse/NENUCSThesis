###############################################################################
#
# NOTES:
# 
# 	- just typing 'make' will run latex/dvips/ps2pdf to produce a PDF.
#
# 	- Sometimes, when cross-references change, you need to run 'latex' again.
# 	Typing 'make' again won't work because the pdf will be up to date.  To get
# 	around this problem, just type 'make again' and run latex again.  You'll
# 	need to type 'make' again to run dvips/ps2pdf..
#
###############################################################################

LATEX=xelatex
DVIPS=dvips
PS2PDF=ps2pdf
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode
DVIPS_OPTS=-q
PS2PDF_OPTS=-dSubsetFonts=true -dEmbedAllFonts=true
BIBTEX_OPTS=

.PHONY: all clean

all: tiankonguse.pdf

tiankonguse.pdf : tiankonguse.ps
	$(PS2PDF) $(PS2PDF_OPTS) $^

tiankonguse.ps: tiankonguse.dvi
	$(DVIPS) $(DVIPS_OPTS) $^

tiankonguse.dvi: tiankonguse.tex
	$(LATEX) $(LATEX_OPTS) $^ 
	
	@if(grep "There were undefined references" tiankonguse.log > /dev/null);\
	then \
		$(BIBTEX) tiankonguse; \
		$(LATEX) $(LATEX_OPTS) tiankonguse.tex; \
	fi
	
	@if(grep "Rerun" tiankonguse.log > /dev/null);\
	then \
		$(LATEX) $(LATEX_OPTS) tiankonguse.tex;\
	fi
	rm -f tiankonguse.log
	$(LATEX) $(LATEX_OPTS) $^ 

references.bbl: ./ref/refs.bib
	if [ -n tiankonguse.aux ]; \
	then \
		$(LATEX) $(LATEX_OPTS) tiankonguse.tex;\
	fi
	$(BIBTEX) tiankonguse

again:
	$(LATEX) $(LATEX_OPTS) tiankonguse.tex


clean:
	rm -rf tiankonguse.dvi
	rm -rf tiankonguse.ps
	rm -rf tiankonguse.log
	rm -rf tiankonguse.bbl
	rm -rf tiankonguse.blg
	rm -rf tiankonguse.toc
	rm -rf tiankonguse.out


