#!/bin/bash

pdflatex main
makeindex main.idx -s StyleInd.ist
biber main
pdflatex main
pdflatex main x 2

rename main.pdf bsltool-userman.pdf

./clean.sh
