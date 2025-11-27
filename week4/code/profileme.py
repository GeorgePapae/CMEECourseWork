#!/usr/bin/env python3#
#filename: profileme.py
"""A module with functions to be profiled."""

# Returns a list of squares
def my_squares(iters):
    out = []
    for i in range(iters):
        out.append(i ** 2)
    return out
# Joins a string iters times
def my_join(iters, string):
    out = ''
    for i in range(iters):
        out += string.join(", ")
    return out
# Profile functions
def run_my_funcs(x,y):
    print(x,y)
    my_squares(x)
    my_join(x,y)
    return 0
# Run the profiler
run_my_funcs(10000,"My string")