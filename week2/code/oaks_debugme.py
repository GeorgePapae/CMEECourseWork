#!/usr/bin/env python3
# filename: oaks_debugme.py
""" A script to filter oak species from a CSV file of tree species, including minor spelling errors in species names."""

__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"

# Imports
import csv
import sys

#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus' 
    >>> is_an_oak('Quercus robur')
    True
    >>> is_an_oak('Fagus sylvatica')
    False
    >>> is_an_oak('Quercuss robur')
    True
    >>> is_an_oak('quercus ilex')
    True
    """
    #import ipdb; ipdb.set_trace()
    return name.lower().startswith('quercus')

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n') # Returns the genus name
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

print ("Script complete!")