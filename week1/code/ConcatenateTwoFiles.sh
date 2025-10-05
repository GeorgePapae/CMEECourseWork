#!/bin/bash
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: ConcatenateTwoFiles.sh
# Desc: Merge two files
# 
# Saves the output into a new file
# Arguments: 1 -> file1
#            2 -> file2
#            3 -> output file
# Date: Oct 2025

if [ ! $1 ] | [ ! $2 ]; then
    echo "Two input files are required"
    exit 1
fi
cat $1> $3
cat $2 >> $3
echo "Merged File is"
cat $3