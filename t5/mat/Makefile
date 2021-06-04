all: octave.log
	@echo "octave complete"

octave.log: t4_2.m
	octave $< > $@
	mv -v *.tex ..
	mv -v *.png ..

clean:
	@rm -f octave.log octave-workspace *.eps *.tex *.png
	@echo "mat cleaned"
.PHONY: all clean
