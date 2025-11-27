# Script name: preallocate.R
# Description: Demonstration of preallocating vectors in R for efficiency
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

NoPreallocFun <- function(x) {
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        #print(a)
        #print(object.size(a))
    }
}

system.time(NoPreallocFun(1500))

PreallocFun <- function(x) {
    a <- rep(NA, x) # pre-allocated vector
    for (i in 1:x) {
        a[i] <- i # assign
        #print(a)
        #print(object.size(a))
    }
}

system.time(PreallocFun(1500))