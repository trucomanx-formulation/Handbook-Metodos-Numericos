#!/bin/bash

pdflatex main
makeindex main.idx -s StyleInd.ist
biber main
pdflatex main
pdflatex main x 2


mv -f main.pdf metodos.pdf

./clean.sh


