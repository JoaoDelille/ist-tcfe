# ------------------------------------------------------------
# type "make" command in the Linux terminal create report.pdf
#
# type "make clean" to delete all generated files
# ------------------------------------------------------------

all:
	soffice --headless --convert-to pdf circuit.odg
	mv *.pdf ./doc/
	make -C mat
	make -C sim
	make -C doc
	cp doc/report.pdf .

clean:
	@make -C mat clean
	@make -C sim clean
	@make -C doc clean

.PHONY: all clean


