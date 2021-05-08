all:report.pdf
#	@evince $< &
	@echo "Opening the report in the Gnome document viewer"

report.pdf: Condensador.png tab.tex
	ps2pdf out.ps out.pdf
	ps2pdf zoom.ps zoom.pdf
	mv -v *.tex  ./doc/
	mv -v *.ps   ./doc/
	mv -v *.png  ./doc/ 
	mv -v *.pdf  ./doc/
	cd ./doc/; pdflatex report.tex
	cd ./doc/; pdflatex report.tex
	cd ./doc/; pdflatex report.tex
	mv -v ./doc/*.pdf ./
	@echo "Status norminal"
	@echo "Everything good"


Condensador.png: ./mat/main3.m
	cd ./mat/; octave main3.m
	cd ./mat/; mv $@ ../$@ 
	cd ./mat/; mv *.tex ../
	@echo "octave complete"

tab.tex: spice.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	

spice.log: ./cir/L3.cir 
	cd ./cir/; ngspice -b L3.cir -o ../$@
	mv -v ./cir/*.ps ./ 
#	sed 's/.*v/vavg/' $@ > a$@
#	sed 's/.*v/vavg/' a$@ > aa$@
#	sed 's/.*v/vavg/' aa$@ > aaa$@
#	rm $@
	@echo "ngspice.log created"


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
