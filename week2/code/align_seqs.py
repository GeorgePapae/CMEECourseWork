#!/usr/bin/env python3

"""Script to align two sequences and find the best alignment and score."""
#docstrings are considered part of the running code (normal comments are
#stripped). Hence, you can access your docstrings at run time#)

__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"


import csv

with open("../data/sequences.csv", "r") as f:
    csvread = csv.reader(f)
    seqs = [row[1] for row in csvread]

seq1, seq2 = seqs[0], seqs[1]

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

l1 = len(seq1)
l2 = len(seq2)
if l1 >= l2:
    s1 = seq1
    s2 = seq2
else:
    s1 = seq2
    s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by usser)
def calculate_score(s1, s2, l1, l2, startpoint):
    matched = "" # to hold string displaying alignements
    score = 0 
    import ipdb; ipdb.set_trace()
    for i in range(l2):

        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"
    return score

# now try to find the best match (highest score) for the two sequences
my_best_align = None
my_best_score = -1

for i in range(l1): # Note that you just take the last alignment with the highest score
    z = calculate_score(s1, s2, l1, l2, i)
    if z > my_best_score:
        my_best_align = "." * i + s2 # think about what this is doing!
        my_best_score = z

with open("../results/alignedsequences.txt", "w") as f:
    f.write("Best alignment:\n")
    f.write(my_best_align + "\n")
    f.write(s1 + "\n")
    f.write("Best score: " + str(my_best_score) + "\n")

print("Script complete! Results written to ../results/alignedsequences.txt")