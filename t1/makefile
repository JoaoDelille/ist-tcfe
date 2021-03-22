testreport.pdf: mesh nodal ngspice
	mv -v nodal.tex  ./doc/
	mv -v mesh.tex   ./doc/
	mv -v op_tab.tex ./doc/
	cd ./doc/; pdflatex report.tex
	mv -v ./doc/*.pdf ./
	@echo "Status norminal"
	@echo "Everything good"

mesh: ./mat/meshm.m
	octave $<

nodal: ./mat/nodalm.m
	octave $<


ngspice: ngspice.log
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

ngspice.log: ./sim/t1.cir
	ngspice -b $< -o $@

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@rm -rf *_tab.tex octave-workspace *.eps
	@cd ./doc/ ; rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@cd ./doc/ ; rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.ps
	@cd ./doc/ ; rm -rf *_tab.tex octave-workspace *.eps
	@cd ./doc/ ; rm -rf nodal.tex mesh.tex

.PHONY: all clean
