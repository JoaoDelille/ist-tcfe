

all: mesh nodal ngspice
	mv -v nodal.tex  ./doc/
	mv -v mesh.tex   ./doc/
	mv -v op_tab.tex ./doc/
	echo "Status norminal"

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
	rm ./doc/mesh.tex ./doc/nodal.tex ./doc/op_tab.tex ngspice.log


.PHONY: all clean
