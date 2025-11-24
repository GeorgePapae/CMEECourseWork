#!/usr/bin/env python3
# filename: lc1.py
"""A script to create lists of bird information using both loops and list comprehensions."""

__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

# Get each element from the tuples in birds.
latin_names= [bird[0] for bird in birds]
common_names= [bird[1] for bird in birds]
mean_body_masses= [bird[2] for bird in birds]
# Print the three lists to screen.
print("Latin names (list comprehension):")
print(latin_names)
print("Common names (list comprehension):")
print(common_names)
print("Mean body masses (list comprehension):")
print(mean_body_masses)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

latin_names_loop = [] # initialize empty list
for bird in birds:
    latin_names_loop.append(bird[0]) # append latin name to list

common_names_loop = []
for bird in birds:
    common_names_loop.append(bird[1])

mean_body_masses_loop = []
for bird in birds:
    mean_body_masses_loop.append(bird[2])
# Print the three lists to screen.
print("Latin names (loop):")
print(latin_names_loop)
print("Common names (loop):")
print(common_names_loop)
print("Mean body masses (loop):")
print(mean_body_masses_loop)

# A nice example out out is:
# Step #1:
# Latin names:
# ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
# ... etc.
 