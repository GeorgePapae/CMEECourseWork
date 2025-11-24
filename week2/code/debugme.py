#!/usr/bin/env python3

""" A buggy function example for debugging practice."""

__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"


def buggyfunc(x):
    y = x
    for i in range(x): # Loop x times
        try: 
            y = y-1
            z = x/y # This will cause an error when y = 0
        except ZeroDivisionError: # Catch division by zero error
            print(f"The result of dividing a number by zero is undefined")
        except: # Catch any other error
            print(f"This didn't work;{x = }; {y = }")
        else: # If no error occurs
            print(f"OK; {x = }; {y = }, {z = };")
    return z
# Run the buggy function
buggyfunc(20)