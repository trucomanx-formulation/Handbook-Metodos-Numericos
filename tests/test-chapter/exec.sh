#!/bin/bash
#pdflatex -interaction=nonstopmode cover.tex
#pdflatex -interaction=nonstopmode cover.tex
#pdflatex -interaction=nonstopmode cover.tex

PDFFILENAME=metodos-numericos.pdf

for VARIABLE in 1 2 ##habilitar para corregir paginas glosario
do
	pdflatex -shell-escape main
	makeindex main.idx -s StyleInd.ist
	biber main
	pdflatex -shell-escape main
	makeindex main.idx -s StyleInd.ist
	pdflatex -shell-escape main x 2
done

mv -f main.pdf $PDFFILENAME

./clean.sh

# convert -density 300 -quality 100 -colorspace GRAY metodos-numericos.pdf gray.pdf

################################################################################
### Crear SIG file
# gpg -b --use-agent $PDFFILENAME
### To verify using the sig file
# gpg --verify $PDFFILENAME.sig
