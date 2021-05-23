# ---------------------------------------------------------
# type the "make" command to create report.pdf 
# ---------------------------------------------------------

#list of LibreOffice Draw files
LODFIGS = $(patsubst %.odg,%.pdf,$(wildcard *.odg))

all: report.pdf
	evince $< &

report.pdf:
	@echo "beginning"
	mv -v ../*.tex .
#	mv -v ../*.png .
	pdflatex report.tex
	pdflatex report.tex
	pdflatex report.tex
	mv -v ./*.pdf ..
	@echo "Status norminal"
	@echo "Everything good"

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof Impedancias.tex Cutoff.tex
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps
	@echo "doc cleaned"
.PHONY: all clean


