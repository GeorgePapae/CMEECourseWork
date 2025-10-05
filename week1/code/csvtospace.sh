# !/bin/sh
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: csvtospace.sh
# Desc: substitute the commas in the files with spaces
# 
# Saves the output into a .txt file
# Arguments: 1 -> comma separated values file
# Date: Oct 2025

if [ ! "$1" ]; then
    echo "No input file provided"
    exit 1
fi

echo "Creating a space separated version of $1 ..."
cat $1 | tr -s "," " " > $1.txt
echo "Done!"
exit