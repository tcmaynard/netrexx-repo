TARGET		:= quickstart
PDFTARGET	:= $(TARGET).pdf
TEX_SRC		:= $(wildcard *.tex)
LATEX_EXE	:= xelatex -shell-esc
RAIL_EXE	:= rail
RELEASE		:= `java org.netrexx.process.NrVersion`
DOCNAME         := "NetRexx $(RELEASE) QuickStart Guide.pdf"

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
	mv quickstart.pdf $(DOCNAME)

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
	rm -f *.log
	rm -f *.lot
	rm -f *.idx
	rm -f *.ilg
	rm -f *.lol
	rm -f *.rai
	rm -f *.rao
	rm -f *.toc
	rm -f *.lof
	rm -f *.out
	rm -f *~
