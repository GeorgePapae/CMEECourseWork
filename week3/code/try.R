# Script name: try.R
# Description: Demonstration of error handling in R using try and stop
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

rm(list=ls()) # Clear workspace
# Define a function that samples from a population and calculates the mean
doit <- function(x) {
    temp_x <- sample(x, replace=TRUE)
    if(length(unique(temp_x)) > 30) {
        print(paste("Mean of this sample was:", as.character(mean(temp_x))))
    } else {
        stop("Couldn't calculate mean: too few unique values")
    }
}
# Generate a population and plot its histogram
set.seed(1345)
popn <- rnorm(50)
hist (popn)
# Run the function multiple times
# lapply(1:15, function(i) doit(popn)) # Halts execution on error, so we use try instead
# Using try to handle errors

result <- lapply(1:15, function(i) try(doit(popn), FALSE))

class(result)
result

result <- vector("list", 15) #Preallocate/Initialize
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
    }

result