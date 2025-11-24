#!/usr/bin/env python3
# filename: tuple.py
""" A script to print bird species information from a tuple of tuples. """

__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"

# Tuple of tuples of bird species
birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Birds is a tuple of tuples of length three: latin name, common name, mass.
# write a (short) script to print these on a separate line or output block by
# species 
# 
for bird in birds:
    print(f"Latin name: {bird[0]} Common name: {bird[1]} Mass: {bird[2]}") # Extracting elements for each species

# A nice example output is:
# 
# Latin name: Passerculus sandwichensis Common name: Savannah sparrow Mass: 18.7
# ... etc.