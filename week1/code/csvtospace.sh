#!/bin/sh
# Author: George gp222@ic.ac.uk
# Script: csvtospace.sh
# Desc: Substitutes commas in a CSV file with spaces.
#       Saves the output into a .txt file
# Arguments: 1 -> comma separated values file
# Date: Oct 2025

# Exit if no input file is provided
if [ ! "$1" ]; then
    echo "No input file provided"
    exit 1
fi

# Create space separated version of the input file
echo "Creating a space separated version of $1 ..."
cat $1 | tr -s "," " " > $1.txt
echo "Done!"
exit