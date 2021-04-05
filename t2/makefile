all:report.pdf
	@evince $< &
	@echo "Opening the report in the Gnome document viewer"

report.pdf: octave ngspice2a ngspice2b ngspicy
	ps2pdf plotmagnitude.ps plotmagnitude.pdf
	ps2pdf plotnatural.ps plotnatural.pdf
	ps2pdf plotfinal.ps plotfinal.pdf
	ps2pdf plotfase.ps plotfase.pdf
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

#data.txt
octave: ./mat/forced_solution.m data.txt
	octave $<


#data.txt
ngspicy: ./sim/t2c.cir ./sim/t2d.cir ./sim/t2e.cir 
	ngspice ./sim/t2c.cir
	ngspice ./sim/t2d.cir
	ngspice ./sim/t2e.cir

#valuesa.cir
ngspice2a: ngspice2a.log 
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	@echo "op_tab.tex created successfully"
	mv op_tab.tex 2a_tab.tex

#valuesa.cir
ngspice2a.log: ./sim/t2a.cir 
	ngspice -b $< -o $@
	@echo "ngspice2a.log created successfully"

#valuesb.cir
ngspice2b: ngspice2b.log 
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	@echo "op_tab.tex created successfully"
	mv op_tab.tex 2b_tab.tex #im aware this is not the best way to do this

#valuesb.cir
ngspice2b.log: ./sim/t2b.cir 
	ngspice -b $< -o $@
	@echo "ngspice2b.log created successfully"

#valuesa.cir: data.txt
#	octave filegenner.m
	
	
#valuesb.cir: data.txt
#	octave filegennerb.m
	

data.txt: t2_datagen.py
	@echo "Please enter the lowest student number in your group:"
	@python2.7 $< > $@
	


clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof data.txt
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@rm -rf *.tex octave-workspace *.eps *.svg
	@cd ./doc/ ; rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof *.svg
	@cd ./doc/ ; rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@cd ./sim/ ; rm -rf *.ps *.log
	@cd ./doc/ ; rm -rf *_tab.tex octave-workspace *.eps
	@cd ./doc/ ; rm -rf nodeCurr.tex nodeVolt.tex phasor.tex condensador.tex
	@echo "All auxiliary files and the report have been erased successfully"

.PHONY: all clean
