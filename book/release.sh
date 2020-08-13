#!/bin/bash
./exec.sh

EDITION="1raEd"
TITULO="Metodos-Numericos"
NOME="Fernando-PR"
PDFFILENAME=$TITULO-$EDITION-$NOME.pdf
echo "PDFTK:$PDFFILENAME"
#pdftk A=Pictures/background.pdf B=Pictures/blank.pdf C=main.pdf D=Pictures/background-back.pdf cat A B C B D output final.pdf
pdftk A=cover/capa.pdf B=pictures/blank.pdf C=metodos-numericos.pdf D=cover/contra-capa.pdf cat A B C B D output $PDFFILENAME

################################################################################
### Crear SIG file
gpg --detach-sign --use-agent $PDFFILENAME 
mv $PDFFILENAME.sig GnuPG-Verificador.sig

### To verify using the sig file
gpg --verify GnuPG-Verificador.sig $PDFFILENAME
