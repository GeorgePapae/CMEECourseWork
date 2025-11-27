# Script name: apply2.R
# Description: Using apply with a custom function in R
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

SomeOperation <- function (v) {
    if (sum(v) > 0) {
        return (v * 100)
    } else {
        return (v)
    }
}

M <- matrix(rnorm(100), 10, 10)
print(apply(M, 1, SomeOperation))