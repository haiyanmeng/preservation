NAME = paper
FIGURES =
IMAGES = 
GRAPHS =
BIBLIOGRAPHIES = cclpapers.bib this.bib sigproc.bib

all: $(NAME).pdf

$(NAME).pdf: $(NAME).ps
	ps2pdf14 $< $@

$(NAME).ps: $(NAME).dvi
	dvips -P cmz -t letter $< -o $@

$(NAME).dvi: $(NAME).tex ${FIGURES} ${GRAPHS} ${IMAGES} ${BIBLIOGRAPHIES}
	latex $(NAME)
	bibtex $(NAME)
	latex $(NAME)
	latex $(NAME)

%.gif: %.eps
	convert $< $@

%.eps: %.fig
	fig2dev -L eps $< $@

%.eps: %.gnuplot
	gnuplot <$< >$@



clean:
	rm -f *~ $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).dvi $(NAME).ps $(NAME).pdf $(NAME).log  $(NAME).eps *.bak 
