NAME = paper
IMAGES = data-code-size.eps preservation_framework.eps
BIBLIOGRAPHIES = cclpapers.bib this.bib 

$(NAME).pdf: $(NAME).tex ${IMAGES} ${BIBLIOGRAPHIES}
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)

clean:
	#rm -f $(NAME).aux $(NAME).bbl $(NAME).blg $(NAME).dvi $(NAME).ps $(NAME).pdf 
	rm -f $(NAME).pdf
