#!/bin/sh
# Author: George gp222@ic.ac.uk
# Script: csvtospace.sh
# Desc: Substitutes commas in a CSV file with spaces.
#       Saves the output into a .txt file
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