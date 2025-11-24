#!/bin/sh
# Author: George gp222@ic.ac.uk
# Script: tabtocsv.sh
# Desc: Substitutes the tabs in a text file with commas.
#       Saves the output into a .csv file.
# Arguments: 1 -> tab delimited file
# Date: Oct 2025

# Exit if no input file is provided
if [ ! "$1" ]; then
    echo "No input file provided"
    exit 1
fi
# Create comma delimited version of the input file
echo "Creating a comma delimited version of $1 ..."
cat $1 | tr -s "\t" "," >> $1.csv
echo "Done!"
exit