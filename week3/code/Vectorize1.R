# Script name: Vectorize1.R
# Description: Comparing loop-based and vectorized summation in R
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

# Create a large matrix
M <- matrix(runif(1000000), 1000, 1000)
# Function to sum all elements using loops
SumAllElements <- function(N) {
    Dimensions <- dim (M)
    Tot <- 0
    for (i in 1:Dimensions[1]) {
        for (j in 1:Dimensions[2]) {
            Tot <- Tot + M[i,j]
        }
    }
    return (Tot)
}
 
print ("Using loops, the time taken is :")
print (system.time(SumAllElements(M)))

print("Using the in-built vectorised function, the time taken is :")
print (system.time(sum(M)))

