#all:report.pdf
#	@evince $< &
#	@echo "Opening the report in the Gnome document viewer"

#report.pdf:
#	mv -v nodal.tex  ./doc/
#	mv -v mesh.tex   ./doc/
#	mv -v op_tab.tex ./doc/
#	cd ./doc/; pdflatex report.tex
#	cd ./doc/; pdflatex report.tex
#	cd ./doc/; pdflatex report.tex
#	mv -v ./doc/*.pdf ./
#	@echo "Status norminal"
#	@echo "Everything good"

nodal: ./mat/forced_solution.m
	octave $<

forced: ./mat/nodal.m
	octave $<


ngspice2a: ngspice2a.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	@echo "op_tab.tex created successfully"
	touch um

ngspice2a.log: ./sim/t2a.cir
	ngspice -b $< -o $@
	@echo "ngspice2a.log created successfully"
	touch dois

ngspice2b: ngspice2b.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	@echo "op_tab.tex created successfully"
	touch tres

ngspice2b.log: ./sim/t2b.cir
	ngspice -b $< -o $@
	@echo "ngspice2b.log created successfully"
	touch quatro

python: t2_datagen.py
	@echo "insert lowest student number"
	python $< > data

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@rm -rf *_tab.tex octave-workspace *.eps
	@cd ./doc/ ; rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@cd ./doc/ ; rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@cd ./sim/ ; rm -rf *.ps *.log
	@cd ./doc/ ; rm -rf *_tab.tex octave-workspace *.eps
	@cd ./doc/ ; rm -rf nodal.tex mesh.tex
	@echo "All auxiliary files and the report have been erased successfully"

.PHONY: all clean
