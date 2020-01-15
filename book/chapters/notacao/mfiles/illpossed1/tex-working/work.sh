#!/bin/bash
NAME=surfcax

latex -src-specials -interaction=nonstopmode ${NAME}.tex
dvips -E -o ${NAME}.eps ${NAME}.dvi
epstool --copy --bbox ${NAME}.eps ${NAME}-new.eps
ps2epsi ${NAME}-new.eps ${NAME}.eps
#epstool --copy --bbox ${NAME}-new.eps ${NAME}.eps 
rm -f ${NAME}-new.eps
rm -f ${NAME}.log
rm -f ${NAME}.aux
rm -f ${NAME}.dvi


NAME=surfcex

latex -src-specials -interaction=nonstopmode ${NAME}.tex
dvips -E -o ${NAME}.eps ${NAME}.dvi
epstool --copy --bbox ${NAME}.eps ${NAME}-new.eps
ps2epsi ${NAME}-new.eps ${NAME}.eps
#epstool --copy --bbox ${NAME}-new.eps ${NAME}.eps 
rm -f ${NAME}-new.eps
rm -f ${NAME}.log
rm -f ${NAME}.aux
rm -f ${NAME}.dvi
