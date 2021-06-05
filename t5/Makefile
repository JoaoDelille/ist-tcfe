all:
	#soffice --headless --convert-to pdf circuit.odg
	#soffice --headless --convert-to pdf incrementalgain.odg
	#soffice --headless --convert-to pdf incrementaloutput.odg
	-cd ./doc/; mkdir ./resources
	-mv *.pdf ./doc/resources
	make -C mat
	make -C sim
	make -C doc
	-cp doc/report.pdf .

clean:
	@make -C mat clean
	@make -C sim clean
	@make -C doc clean
	@rm *.pdf *_tab.tex
.PHONY: all clean
