all:report.pdf
	@evince $< &
	@echo "Opening the report in the Gnome document viewer"

report.pdf: nodal forced ngspice2a ngspice2b python ngspicy
	mv -v *.tex  ./doc/
	cd ./doc/; pdflatex report.tex
	cd ./doc/; pdflatex report.tex
	cd ./doc/; pdflatex report.tex
	mv -v ./doc/*.pdf ./
	@echo "Status norminal"
	@echo "Everything good"


nodal: ./mat/forced_solution.m python
	octave $<


forced: ./mat/nodal.m python
	octave $<


ngspicy: ./sim/t2c.cir ./sim/t2d.cir ./sim/t2e.cir python
	ngspice ./sim/t2c.cir
	ngspice ./sim/t2d.cir
	ngspice ./sim/t2e.cir


ngspice2a: ngspice2a.log python
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	@echo "op_tab.tex created successfully"
	mv op_tab.tex 2a_tab.tex


ngspice2a.log: ./sim/t2a.cir python
	ngspice -b $< -o $@
	@echo "ngspice2a.log created successfully"


ngspice2b: ngspice2b.log python
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	@echo "op_tab.tex created successfully"
	mv op_tab.tex 2b_tab.tex #im aware this is not the best way to do this


ngspice2b.log: ./sim/t2b.cir python
	ngspice -b $< -o $@
	@echo "ngspice2b.log created successfully"


python: t2_datagen.py
	@echo "Please enter the lowest student number in your group:"
	@python2.7 $< > data


clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof data
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@rm -rf *.tex octave-workspace *.eps *.svg
	@cd ./doc/ ; rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@cd ./doc/ ; rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@cd ./sim/ ; rm -rf *.ps *.log
	@cd ./doc/ ; rm -rf *_tab.tex octave-workspace *.eps
	@cd ./doc/ ; rm -rf nodeCurr.tex nodeVolt.tex phasor.tex condensador.tex
	@echo "All auxiliary files and the report have been erased successfully"

.PHONY: all clean
