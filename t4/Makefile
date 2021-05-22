all:report.pdf
	@echo "How do you generate a random string?"
	@echo "You give Vim to a Windows user and ask them to exit!"

report.pdf:
#	mv -v *.tex  ./doc/
#	mv -v *.ps   ./doc/
#	mv -v *.png  ./doc/ 
#	mv -v *.pdf  ./doc/
	cd ./doc/; pdflatex report.tex
	cd ./doc/; pdflatex report.tex
	cd ./doc/; pdflatex report.tex
	mv -v ./doc/*.pdf ./
	@echo "Status norminal"
	@echo "Everything good"
	
	

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof data.txt
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@rm -rf *.tex octave-workspace *.eps *.svg
	@cd ./doc/ ; rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof *.svg 
	@cd ./doc/ ; rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@cd ./cir/ ; rm -rf *.ps *.log
	@cd ./doc/ ; rm -rf *_tab.tex octave-workspace *.eps Oct_results.tex Condensador.png
	@echo "All auxiliary files and the report have been erased successfully"
	

.PHONY: all clean
