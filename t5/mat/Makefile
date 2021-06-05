all: octave.log
	@echo "octave complete"

octave.log: main.m
	octave $< > $@
	-mv -v *.tex ..
	-mv -v *.png ..

clean:
	-@rm -f octave.log octave-workspace *.eps *.tex *.png
	@echo
	@echo "mat cleaned"
	@echo
	@echo
.PHONY: all clean
