# !/bin/sh
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: tiff2png.sh
# Desc: Converts .tif files to .png
# 
# Saves the output into a .png file
# Arguments: 1 -> tab delimited file
# Date: Oct 2025

for f in *.tif;
    do
        echo "Converting $f";
        convert "$f" "$(basename "$f" .tif).png";
    done    