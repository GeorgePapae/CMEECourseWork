rm(list=ls())

load("../data/KeyWestAnnualMeanTemperature.RData")

ls()
class(ats)
head(ats)
plot(ats)
# Calculate the observed correlation between the data
obs_cor <- cor(ats$Year, ats$Temp)
obs_cor
# Set number of permutations and create an empty vector
num_perms <- 10000
perm_cor <- c()
# Run the loop for num_perms times while keeping the years and sampling the temperature values
for (i in 1:num_perms){
    perm_cor[i] <- cor(ats$Year, sample(ats$Temp))
}
# Find the fraction of correlation values from permutational analysis
# that are bigger than our observed correlation value
p_value <- sum (perm_cor >= obs_cor)/ num_perms
p_value


hist(perm_cor)