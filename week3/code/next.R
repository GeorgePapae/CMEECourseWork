# Script name: next.R
# Description: Demonstration of the next statement in R
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

for (i in 1:10) {
    if ((i %% 2) ==0)
        next # pass to next iteration of loop
    print(i)
}