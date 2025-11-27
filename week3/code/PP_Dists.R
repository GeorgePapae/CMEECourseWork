# Script name: PP_Dists.R
# Description: Analyzing predator-prey body mass distributions
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

# Store and check data
mydata <- read.csv("../data/EcolArchives-E089-51-D1.csv")

require(tidyverse)

#Change columns to factor to use as grouping variables
mydata$Type.of.feeding.interaction <- as.factor(mydata$Type.of.feeding.interaction)
mydata$Location <- as.factor(mydata$Location)
str(mydata)
## Ensure mass in same units
unique(mydata$Prey.mass.unit)
## Convert mg to g
mydata$Prey.mass[mydata$Prey.mass.unit == "mg"] <- mydata$Prey.mass[mydata$Prey.mass.unit =="mg"] / 1000
mydata$Prey.mass.unit[mydata$Prey.mass.unit == "mg"] <- "g"

head(mydata)
colnames(mydata)

uniq_feeding <- unique(mydata$Type.of.feeding.interaction)


# Predators
pdf("../results/Pred_Subplots.pdf")
par(mfrow = c(2,3))
for (f in uniq_feeding) {
    subset_data <- subset(mydata, Type.of.feeding.interaction == f)
    hist(log(subset_data$Predator.mass),
    main = paste ("Predator Mass:", f),
    xlab = "log(Predator mass)",
    cex.main = 1,
    col = "red",
    border = "white",
    xlim = range(log(mydata$Predator.mass))
    )
}
dev.off()

# Prey
pdf("../results/Prey_Subplots.pdf")
par(mfrow = c(2,3))
for (f in uniq_feeding) {
    subset_data <- subset(mydata, Type.of.feeding.interaction == f)
    hist(log(subset_data$Prey.mass),
    main = paste ("Prey Mass:", f),
    cex.main = 01,
    xlab = "log(Prey mass)",
    col = "blue",
    border = "white",
    xlim = range(log(mydata$Prey.mass))
    )
}
dev.off()

# Size Ratio
pdf("../results/SizeRatio_Subplots.pdf")
par(mfrow = c(2,3))
for (f in uniq_feeding) {
    subset_data <- subset(mydata, Type.of.feeding.interaction == f)
    hist(log(subset_data$Prey.mass)/log(subset_data$Predator.mass),
    main = paste ("Prey/Predator Mass:", f),
    cex.main = 1,
    xlab = "log(Prey mass) / log(Predator Mass)",
    col = "Orange",
    border = "white",
    )
}
dev.off()

# Results .csv

results <- data.frame(FeedingType = uniq_feeding, MeanPred = NA, MedianPred = NA, MeanPrey = NA, MedianPrey = NA, MeanRatio = NA, MedianRatio = NA)

for (i in 1:length(uniq_feeding)) {
    subset_data <- subset(mydata, Type.of.feeding.interaction == uniq_feeding[i])
    results$MeanPred[i] = mean(log(mydata$Predator.mass), na.rm = TRUE)
    results$MedianPred[i] = median(log(mydata$Predator.mass), na.rm = TRUE)
    results$MeanPrey[i] = mean(log(mydata$Prey.mass), na.rm = TRUE)
    results$MedianPrey[i] = median(log(mydata$Prey.mass), na.rm = TRUE)
    results$MeanRatio[i] = mean(log(mydata$Prey.mass) / log(mydata$Predator.mass), na.rm = TRUE)
    results$MedianRatio[i] = mean(log(mydata$Prey.mass)/ log(mydata$Predator.mass), na.rm = TRUE)
}
write.csv(results, "../results/PP_Results.csv", row.names = FALSE)



