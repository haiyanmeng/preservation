NAME = paper
FIGURES =
IMAGES = overview-of-architecture.eps preservation-integration.eps data-process.eps solution3.eps package-info.eps data-code-size.eps version-evolution.eps dependencies.eps workflow-parrot.eps
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

%.eps: %.svg
	inkscape -z -E$@ $^

clean:
	rm -f *~ $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).dvi $(NAME).ps $(NAME).pdf $(NAME).log  $(NAME).eps *.bak 
