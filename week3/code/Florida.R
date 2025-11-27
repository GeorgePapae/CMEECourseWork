# Script name: Florida.R
# Description: Permutation test on Key West Annual Mean Temperature data
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

rm(list=ls())

load("../data/KeyWestAnnualMeanTemperature.RData")

ls()
class(ats)
head(ats)
plot(ats$Year, ats$Temp, xlab = "Year", ylab = "Temperature (°C)")
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

png("../results/florida_line_graph.png")
plot(ats$Year, ats$Temp, xlab = "Year", ylab = "Temperature (°C)",
    main = "Annual Temperature from Key West, Florida (19011 - 2000)")
abline(lm(Temp ~ Year, data = ats), col = "red", lwd=3)
dev.off()

png("../results/florida_histogram.png")
hist(perm_cor, main = "Distribution of Permutational Correlations",
    xlab = "Correlation coefficient", xlim = c(-1,1))
abline(v = obs_cor, col = "red", lwd=1)
dev.off()

