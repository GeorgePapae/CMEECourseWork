#######
# FILE OUTPUT
#######
__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"

""" Example of writing output to a file."""

# Save the elements of a list to a file
list_to_save = range(100)

f= open('../sandbox/testout.txt', 'w')
for i in list_to_save:
    f.write(str(i) + '\n') #Add a newline after each element

f.close()