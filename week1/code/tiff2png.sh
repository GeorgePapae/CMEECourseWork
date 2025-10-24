#!/bin/sh
# Author: George gp222@ic.ac.uk
# Script: tiff2png.sh
# Desc: Converts all .tiff files in ../data/ to .png format.
#       Saves the output .pgn files in ../results/ 
# Arguments: none
# Date: Oct 2025

for f in ../data/*.tiff; do
    base=$(basename "$f" .tiff)      
    echo "Converting $f -> ../results/$base.png"
    convert "$f" "../results/$base.png"
done