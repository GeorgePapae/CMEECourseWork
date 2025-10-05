# !/bin/sh
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: tabtocsv.sh
# Desc: substitute the tabs in the files with commas
# 
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2025

if [ ! "$1" ]; then
    echo "No input file provided"
    exit 1
fi
echo "Creating a comma delimited version of $1 ..."
cat $1 | tr -s "\t" "," >> $1.csv
echo "Done!"
exit