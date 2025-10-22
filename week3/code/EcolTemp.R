MyDf <- read.csv("../data/EcolArchives-E089-51-D1.csv")
dim(MyDf)
str(MyDf)
head(MyDf)

require(tidyverse)
glimpse(MyDf)

#Change columns to factor to use as grouping variables
MyDf$Type.of.feeding.interaction <- as.factor(MyDf$Type.of.feeding.interaction)
MyDf$Location <- as.factor(MyDf$Location)
str(MyDf)
## Ensure mass in same units
unique(MyDf$Prey.mass.unit)
## Convert mg to g
MyDf$Prey.mass[MyDf$Prey.mass.unit == "mg"] <- MyDf$Prey.mass[MyDf$Prey.mass.unit =="mg"] / 1000
MyDf$Prey.mass.unit[MyDf$Prey.mass.unit == "mg"] <- "g"

###### SCATTER PLOTS #######
# Predator mass vs Prey Mass
plot(MyDf$Predator.mass, MyDf$Prey.mass)
# Take log 
plot(log(MyDf$Predator.mass), log(MyDf$Prey.mass))
# Base 10 log transform
plot(log10(MyDf$Predator.mass), log10(MyDf$Prey.mass))
plot(log10(MyDf$Predator.mass), log10(MyDf$Prey.mass), pch=20) # changing marker
plot(log10(MyDf$Predator.mass),log10(MyDf$Prey.mass),pch=20, xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels

###### HISTOGRAMS #######
hist(MyDf$Predator.mass)
hist(log10(MyDf$Predator.mass), xlab = "log10 (Predator Mass (g))", ylab = "Count")
#Change borders an bar colours
breaks <- seq(-11,10,0.5)
hist(log10(MyDf$Predator.mass),xlab="log10(Predator Mass (g))",ylab="Count",
    cex.lab = 1.5, cex.main =1.5, font.lab = 2, breaks = breaks,
    col = "lightblue", border = "pink") # Change bar and borders colors 

hist(log10(MyDf$Prey.mass),xlab="log10(Prey Mass (g))",ylab="Count",
    cex.lab = 1.5, cex.main =1.5, font.lab = 2, breaks=breaks,
    col = "lightblue", border = "pink") # Change bar and borders colors 

###### SUBPLOTS #######
par(mfcol=c(2,1)) # initialise multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first
hist(log10(MyDf$Predator.mass),
xlab = "log10(Predator Mass(g))", ylab= "Count", col = "lightblue", border = "pink",
main = "Predator")
par(mfg = c(2,1))
hist(log10(MyDf$Prey.mass), xlab="log10(Prey Mass (g))",ylab="Count", col = "lightgreen", border = "pink", main = 'prey')

###### OVERLAYING PLOTS ######
breaks = seq(-11,7,0.5)
hist(log10(MyDf$Predator.mass), # Predator histogram
    xlab="log10(Body Mass (g))", ylab="Count", breaks = breaks,
    col = rgb(1, 0, 0, 0.5), # Note 'rgb', fourth value is transparency
    main = "Predator-prey size Overlap") 
hist(log10(MyDf$Prey.mass), col = rgb(0, 0, 1, 0.5), add = T, breaks=breaks) # Plot prey
legend('topleft',c('Predators','Prey'),   # Add legend
    fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) # Define legend colors

###### BOXPLOTS ########
boxplot(log10(MyDf$Predator.mass), xlab = "Location", ylab = "log10(Predator Mass)", main = "Predator mass")
boxplot(log10(MyDf$Predator.mass) ~ MyDf$Location,
    xlab = "Location", ylab = "log10(Predator Mass)", main = "Predator mass")
## By feeding interaction
boxplot(log(MyDf$Predator.mass) ~ MyDf$Type.of.feeding.interaction,
    xlab = "Location", ylab = "Predator Mass",
    main = "Predator mass by feeding interaction type")

###### COMBINING PLOT TYPES #######
 par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion
 plot(log(MyDf$Predator.mass),log(MyDf$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
 par(fig=c(0,0.8,0.47,1), new=TRUE)
 boxplot(log(MyDf$Predator.mass), horizontal=TRUE, axes=FALSE)
 par(fig=c(0.55,1,0,0.8),new=TRUE)
 boxplot(log(MyDf$Prey.mass), axes=FALSE)
 mtext("Fancy Predator-prey scatterplot", side=3, outer=TRUE, line=-3)

pdf("../results/Pred_Prey_Overlay.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
hist(log(MyDf$Predator.mass), # Plot predator histogram (note 'rgb')
    xlab="Body Mass (g)", ylab="Count", col = rgb(1, 0, 0, 0.5), main = "Predator-Prey Size Overlap") 
hist(log(MyDf$Prey.mass), # Plot prey weights
    col = rgb(0, 0, 1, 0.5), 
    add = T)  # Add to same plot = TRUE
legend('topleft',c('Predators','Prey'), # Add legend
    fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) 
graphics.off(); #you can also use dev.off() 


###############################
## GGPOT2 #####
######################

require(ggplot2)

##### SCATTERPLOTS #####
qplot(Prey.mass, Predator.mass, data = MyDf)
qplot(log(Prey.mass), log(Predator.mass), data = MyDf)
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, colour = Type.of.feeding.interaction)
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, colour = Type.of.feeding.interaction, asp = 1)
#CHanging shape
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, shape = Type.of.feeding.interaction, asp = 1)
## Aesthetic mappings ##
qplot(log(Prey.mass), log(Predator.mass), 
    data = MyDf, colour = "red")
qplot(log(Prey.mass), log(Predator.mass), 
    data = MyDf, colour = I("red")) # To se it manually to real red
# Similar with point sizes
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, size = 3) #with ggplot size mapping
qplot(log(Prey.mass), log(Predator.mass),  data = MyDf, size = I(3)) #no mapping
# No continuous mapping for shapes, so only this works:
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, shape= I(5))
## Adding smoothers and regression lines
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, geom = c("point", "smooth"))
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, geom = c("point", "smooth")) + geom_smooth(method = "lm")
# Add smoother for each type of interaction
qplot(log(Prey.mass), log(Predator.mass), data = MyDf, geom = c("point", "smooth"), 
      colour = Type.of.feeding.interaction) + geom_smooth(method = "lm", fullrange = TRUE) #Extends lines to full range
# Ratio between prey and predator mass to type of interaction
qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data = MyDf)
# Jitter them 
qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), 
    data = MyDf, geom = "jitter")

##### BOXPLOTS #######




