NAME = paper
IMAGES = data-code-size.eps preservation_framework.eps
BIBLIOGRAPHIES = cclpapers.bib this.bib 

all: $(NAME).pdf

$(NAME).pdf: $(NAME).ps
	ps2pdf14 $< $@

$(NAME).ps: $(NAME).dvi
	dvips -P cmz -t letter $< -o $@

$(NAME).dvi: $(NAME).tex ${IMAGES} ${BIBLIOGRAPHIES}
	latex $(NAME)
	bibtex $(NAME)
	latex $(NAME)
	latex $(NAME)

clean:
	rm -f $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).dvi $(NAME).ps $(NAME).pdf 
