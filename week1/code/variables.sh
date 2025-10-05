# !/bin/sh
# Author: George giorgos.papaeracleous22@imperial.ac.uk
# Script: variables.sh
# Desc: Illustrates the use of variables
# Arguments: none
# Date: Oct 2025

# Special variables

echo "This script was called with $# parameters"
echo " the script's name is $0"
echo "the arguments are $@"
echo "The first argument is $1"
echo "The second argument is $2"

# Assigned Variables; Explicit declaration
MY_VAR='some string'
echo "the current value of the variable is:" $MY_VAR
echo "Please enter a new string"
read MY_VAR
echo 
echo "the current value of the variable is:" $MY_VAR
echo
## Assigned Variables; Reading (multiple values) from user input:
echo "Enter two numbers separated by space(s)"
read a b
echo
echo "you entered" $a "and" $b "; Their sum is:"

## Assigned Variables; Command substitution
MY_SUM=$(expr $a + $b)
echo $MY_SUM

