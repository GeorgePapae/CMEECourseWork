# !/bin/sh
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: tiff2png.sh
# Desc: Converts .tiff files to .png
# 
# Saves the output into a .png file
# Arguments: 1 -> tab delimited file
# Date: Oct 2025

for f in ../data/*.tiff; do
    base=$(basename "$f" .tiff)      
    echo "Converting $f -> ../results/$base.png"
    convert "$f" "../results/$base.png"
done