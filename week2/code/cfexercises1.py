#!/usr/bin/env python3

"""Some functions exemplifying the use of control statements."""

__author__ = "George Papaeracleous (gp222@ic.ac.uk)"
__version__ ="0.0.1"

import sys

def foo_1(x= 0):
    """Calculate the square root of x."""
    sqrt = x ** 0.5
    return f" The square root of {x} is {sqrt}!"

def foo_2(x, y):
    """Find the largest of two numbers x and y."""
    if x > y:
        return f"The largest number of the two is {x}!"
    return f"The largest number of the two is {y}!"

def foo_3(x, y, z):
    """Sort three numbers x, y, z in ascending order."""
    if x > y:
        x, y = y, x
    if x > z:
        x, z = z, x
    if y > z:
        y, z = z, y
    return f" The numbers in ascending order are {x}, {y}, {z}!"

def foo_4(x):
    """Calculate the factorial of x."""
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return f"The factorial of x is {result}!"

def foo_5(x): # a recursive function that calculates the factorial of x
    """Calculate the factorial of x using a recursive function."""
    def factorial(n):
        if n == 0 or n == 1:
            return 1
        return n * factorial(n - 1)
    result = factorial(x)
    return f"The factorial of {x} is {result}!"
     
def foo_6(x): # Calculate the factorial of x in a different way; no if statement involved
    """Calculate the factorial of x using a while loop."""
    facto = 1
    ogx= x
    while x >= 1:
        facto = facto * x
        x = x - 1
    return f"The factorial of {ogx} is {facto}!"

def main(argv):
    print(foo_1(35))
    print(foo_2(30, 40))
    print(foo_3(35, 20, 60))
    print(foo_4(10))
    print(foo_5(10))
    print(foo_6(10))
    return 0

if __name__ =="__main__":
    status = main(sys.argv)
    sys.exit(status)

