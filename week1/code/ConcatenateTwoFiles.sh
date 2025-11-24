#!/bin/bash
# Author: George gp222@ic.ac.uk
# Script: ConcatenateTwoFiles.sh
# Desc: Merges two files and saves result into a new file.
# Arguments: 1 -> file1
#            2 -> file2
#            3 -> output file
# Date: Oct 2025

# Exit if two input files are not provided
if [ ! $1 ] | [ ! $2 ]; then
    echo "Two input files are required"
    exit 1
fi
# Concatenate files and display result
cat $1> $3
cat $2 >> $3
echo "Merged File is"
cat $3