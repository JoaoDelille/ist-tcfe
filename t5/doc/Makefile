# ---------------------------------------------------------
# type the "make" command to create report.pdf 
# ---------------------------------------------------------

#list of LibreOffice Draw files
LODFIGS = $(patsubst %.odg,%.pdf,$(wildcard *.odg))

all: report.pdf
	evince ../$< &
	@echo
	@echo
	@echo
	@echo "The only program that doesnt have bugs is an empty file."
	@echo
	@echo
	@echo

report.pdf:
	@echo "beginning"
	-mv -v ../*.tex ./resources
	-mv -v ../*.pdf ./resources
	-mv -v ../*.png ./resources
	pdflatex report.tex
	pdflatex report.tex
	pdflatex report.tex
	mv -v ./$@ ..
	@echo "Status norminal"
	@echo "Everything good"

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof 
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps
	@rm ./resources/*
	@echo "doc cleaned"
.PHONY: all clean
