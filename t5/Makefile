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
	@echo
	@echo
	@echo
	@echo
	@echo "The only program that doesnt have bugs is an empty file."
	@echo
	@echo
	@echo
	@echo

clean:
	-@make -C mat clean
	-@make -C sim clean
	-@make -C doc clean
	-@rm *.pdf *_tab.tex *.toc *~ *.*%
	@echo
	@echo "all clean"
	@echo
	@echo
.PHONY: all clean
