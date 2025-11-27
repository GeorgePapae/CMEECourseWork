#!usr/bin/env python3
# filename: sysargv.py
""" Example of using sys.argv to handle command-line arguments."""
__author__ = "George Papaeracleous (gp222@ic.ac.uk)"

import sys
print("this is the name of the scipt:", sys.argv[0])
print("Number of arguments: ", len(sys.argv))
print("The arguments are: ", str(sys.argv))