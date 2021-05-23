all: ngspice.log ngspiceout.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	ps2pdf gain.ps

ngspice.log: ../sim/t4.cir
	ngspice -b $< -o $@

ngspiceout.log: ../sim/out_imped.cir
	ngspice -b $< -o $@

clean:
	@rm -f *.log *.tex *.pdf *.ps *~
	@echo "sim cleaned"
.PHONY: all clean
