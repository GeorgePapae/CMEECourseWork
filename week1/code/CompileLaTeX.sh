#!/bin/bash
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: CompileLaTeX.sh
# Desc: Compile a LaTeX document with a bibliography
# 
# Removes auxiliary files after compilation
# Arguments: 1 -> file.tex
# Date: Oct 2025

if [ ! $1 ]; then
    echo "No input file provided"
    exit 1
fi

if [[ $1 != *.tex ]]; then
    echo "Input file must be a .tex file"
    exit 1
] ]
fi

base=${1%.tex}

pdflatex $1
bibtex $base
pdflatex $1
pdflatex $1
evince $base.pdf &

##Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg