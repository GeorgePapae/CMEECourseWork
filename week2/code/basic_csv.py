
__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"
""" Example of reading and writing CSV files using csv module."""
import csv

# Read a file containing:
# 'Species','Infraorder','Family','Distribution','Body mass male (Kg)'
with open('../data/testcsv.csv','r') as f:

    csvread = csv.reader(f)
    temp = []
    for row in csvread:
        temp.append(tuple(row))
        print(row)
        print("The species is", row[0])

# write a file containing only species name and Body mass
with open('../data/testcsv.csv','r') as f:
    with open('../data/bodymass.csv','w') as g:

        csvread = csv.reader(f) # read from file
        csvwrite = csv.writer(g) # write to file
        for row in csvread:
            print(row)  # print the whole row
            csvwrite.writerow([row[0], row[4]]) # write only desired subset of columns