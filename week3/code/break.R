# Script name: break.R
# Description: Demonstration of the break statement in R
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

i <- 0 #Initialise i
while (i < 10) {
    if (i==10){
        break
    } else { #Break out of the while loop!
        cat ("i equals ", i, " \n")
        i <- i+1
    }
}