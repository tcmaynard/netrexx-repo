TARGET		:= nrl
PDFTARGET	:= $(TARGET).pdf
TEX_SRC		:= $(wildcard *.tex)
LATEX_EXE	:= xelatex
RAIL_EXE	:= rail

.SUFFIXES: .nrx .nry .njp .class .skel .xsl .java .pdf

all:	$(PDFTARGET)

$(TARGET).pdf: $(TEX_SRC)
	$(MAKE) -k $(TARGET).bbl
	$(LATEX_EXE) $(TARGET).tex
	$(RAIL_EXE) $(TARGET)
	@while ( grep "There were undefined references." $(TARGET).log >/dev/null ); do \
		echo '** Re-running pdfLaTeX **'; \
		$(LATEX_EXE) $(TARGET).tex; \
		makeindex $(TARGET); \
	done
	mv nrl.pdf "NetRexx Language Reference 3.03.pdf"
$(TARGET).bbl: $(TEXSRC) $(BIBSRC)
	$(LATEX_EXE) $(TARGET).tex
#	bibtex $(TARGET)
	makeindex $(TARGET)

#
# target clean removes compiled products
#
.PHONY: clean
clean: 
	rm -f *.class
	rm -f *.crossref
	rm -f *.aux
	rm -f *~
