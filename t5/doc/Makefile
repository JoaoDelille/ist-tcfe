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
	@echo "Keep finding bugs in your code? Try applying Raid to your disk drives next time!"
	@echo
	@echo
	@echo
	
report.pdf:
	@echo "beginning"
	mv -v ../*.tex .
#	mv -v ../*.ps .
	mv -v ../*.png .
	pdflatex report.tex
	pdflatex report.tex
	pdflatex report.tex
	mv -v ./*.pdf ..
	@echo "Status norminal"
	@echo "Everything good"

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof Impedancias.tex Cutoff.tex
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps *.png *_tab.tex
	@echo "doc cleaned"
.PHONY: all clean


