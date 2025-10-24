#!/bin/bash
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: CompileLaTeX.sh
# Desc: Compile a LaTeX document with a bibliography
#       removes auxiliary files, and saves PDF to ../results/
# Arguments: 1 -> file.tex
# Date: Oct 2025

if [ ! $1 ]; then
    echo "No input file provided"
    exit 1
fi

if [[ $1 != *.tex ]]; then
    echo "Input file must be a .tex file"
    exit 1
 
fi

base=${1%.tex}
outdir

pdflatex $1
bibtex $base
pdflatex $1
pdflatex $1
evince ../results/$base.pdf &

##Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg

mv -f "$base.pdf" ../results/"$base.pdf"
