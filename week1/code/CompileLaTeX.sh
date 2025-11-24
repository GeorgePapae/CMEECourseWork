#!/bin/bash
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: CompileLaTeX.sh
# Desc: Compile a LaTeX document with a bibliography
#       removes auxiliary files, and saves PDF to ../results/
# Arguments: 1 -> file.tex
# Date: Oct 2025

# Exit if no input file is provided
if [ ! $1 ]; then
    echo "No input file provided"
    exit 1
fi
# Ensure input file is a .tex file
if [[ $1 != *.tex ]]; then
    echo "Input file must be a .tex file"
    exit 1
 
fi
# Get base name of the file
base=${1%.tex}
outdir
# Compile LaTeX document, bibliography, and recompile
pdflatex $1
bibtex $base
pdflatex $1
pdflatex $1
evince ../results/$base.pdf &

# Cleanup of extra files
rm *.aux
rm *.log
rm *.bbl
rm *.blg
# Save PDF to results directory
mv -f "$base.pdf" ../results/"$base.pdf"
