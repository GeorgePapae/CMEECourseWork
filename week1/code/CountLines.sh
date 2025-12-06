#!/bin/bash
# Author: George gp222@ic.ac.uk
# Script: CountLines.sh
# Desc: Counts the number of lines in a text file.
# Arguments: 1 -> file1
# Date: Oct 2025

# Exit if no input file is provided
if [ ! $1 ]; then
    echo "No input file provided"
    exit 1
fi
# Count number of lines in the file
NumLines=$(wc -l < "$1")
echo "The file $1 has $NumLines lines"
echo