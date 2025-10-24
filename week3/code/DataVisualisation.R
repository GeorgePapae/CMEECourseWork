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

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data = MyDf, geom = "boxplot")

##### HISTOGRAMS AND DENSITY PLOTS #######
qplot(log(Prey.mass/Predator.mass), data = MyDf, geom = "histogram")
qplot(log(Prey.mass/Predator.mass), data = MyDf, geom = "histogram",
        fill = Type.of.feeding.interaction)

 qplot(log(Prey.mass/Predator.mass), data = MyDf, geom = "histogram",
        fill = Type.of.feeding.interaction, binwidth = 1)       

qplot(log(Prey.mass/Predator.mass), data = MyDf, geom = "density",
        fill = Type.of.feeding.interaction)

qplot(log(Prey.mass/Predator.mass), data = MyDf, geom =  "density", 
      fill = Type.of.feeding.interaction, 
      alpha = I(0.5))
# Using colour
qplot(log(Prey.mass/Predator.mass), data = MyDf, geom =  "density", 
      colour = Type.of.feeding.interaction)

####### MULTI-FACETED PLOTS #######
# Flip .~ with Typeof... to change between column or row faceting
qplot(log(Prey.mass/Predator.mass), facets = .~ Type.of.feeding.interaction, data = MyDf, geom = "density")

####### LOGARITHMIC AXES #########
qplot(Prey.mass, Predator.mass, data = MyDf, log="xy")

qplot(Prey.mass, Predator.mass, data = MyDf, log="xy",
    main = "Relation between predator and prey mass", 
    xlab = "log(Prey mass) (g)", 
    ylab = "log(Predator mass) (g)") + theme_bw()

pdf("../results/MyFirst-ggplot2-Figure.pdf")
print(qplot(Prey.mass, Predator.mass, data = MyDf,log="xy",
    main = "Relation between predator and prey mass", 
    xlab = "log(Prey mass) (g)", 
    ylab = "log(Predator mass) (g)") + theme_bw())
dev.off()



######### GEOM ARGUMENT ########
# load the data
MyDF <- as.data.frame(read.csv("../data/EcolArchives-E089-51-D1.csv"))

# barplot
qplot(Predator.lifestage, data = MyDF, geom = "bar")

# boxplot
qplot(Predator.lifestage, log(Prey.mass), data = MyDF, geom = "boxplot")

# violin plot
qplot(Predator.lifestage, log(Prey.mass), data = MyDF, geom = "violin")

# density
qplot(log(Predator.mass), data = MyDF, geom = "density")

# histogram
qplot(log(Predator.mass), data = MyDF, geom = "histogram")

# scatterplot
qplot(log(Predator.mass), log(Prey.mass), data = MyDF, geom = "point")

# smooth
qplot(log(Predator.mass), log(Prey.mass), data = MyDF, geom = "smooth")

qplot(log(Predator.mass), log(Prey.mass), data = MyDF, geom = "smooth", method = "lm")

######### ADVANCED PLOTTING: GGPLOT ############
p <- ggplot(MyDF, aes(x = log(Predator.mass),
                y = log(Prey.mass),
                colour = Type.of.feeding.interaction))

p + geom_point()
# Using "+" to concatenate different commands
p <- ggplot(MyDF, aes(x = log(Predator.mass), y = log(Prey.mass), colour = Type.of.feeding.interaction ))
q <- p + 
geom_point(size=I(2), shape=I(10)) +
theme_bw() + # make the background white
theme(aspect.ratio=1) # make the plot square
q
# Remove the legend
q + theme(legend.position = "none") + theme(aspect.ratio=1)

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction )) + geom_density()
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction)) + geom_density(alpha=0.5)
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction )) +  geom_density() + facet_wrap( .~ Type.of.feeding.interaction)
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass), fill = Type.of.feeding.interaction )) +  geom_density() + facet_wrap( .~ Type.of.feeding.interaction, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass/Predator.mass))) +  geom_density() + facet_wrap( .~ Location, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location + Type.of.feeding.interaction, scales = "free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Type.of.feeding.interaction + Location, scales = "free")
p

#### plotting a matrix ####

require (reshape2)

GenerateMatrix <- function(N){
    M <- matrix(runif(N * N), N, N)
    return(M)
}
M <- GenerateMatrix(10)
Melt <- melt(M)

p <- ggplot(Melt, aes(Var1, Var2, fill = value)) + geom_tile() + theme(aspect.ratio = )
p
# Adding black line dividing cells
p + geom_tile(colour = "black") + theme(aspect.ratio = 1)
# Removing legend
p + theme(legend.position = "none") + theme(aspect.ratio = 1)
# Removing everything else
p + theme(legend.position = "none", 
     panel.background = element_blank(),
     axis.ticks = element_blank(), 
     panel.grid.major = element_blank(),
     panel.grid.minor = element_blank(),
     axis.text.x = element_blank(),
     axis.title.x = element_blank(),
     axis.text.y = element_blank(),
     axis.title.y = element_blank())

#Exploring colours
p + scale_fill_continuous(low = "yellow", high = "darkgreen")
p + scale_fill_gradient2()
p + scale_fill_gradientn(colours = grey.colors(10))
p + scale_fill_gradientn(colours = rainbow(10))

# Plotting 2 dataframes together
build_ellipse <- function(hradius, vradius){ # function that returns an ellipse
  npoints = 250
  a <- seq(0, 2 * pi, length = npoints + 1)
  x <- hradius * cos(a)
  y <- vradius * sin(a)  
  return(data.frame(x = x, y = y))
}

N <- 250 # Assign size of the matrix

M <- matrix(rnorm(N * N), N, N) # Build the matrix

eigvals <- eigen(M)$values # Find the eigenvalues

eigDF <- data.frame("Real" = Re(eigvals), "Imaginary" = Im(eigvals)) # Build a dataframe

my_radius <- sqrt(N) # The radius of the circle is sqrt(N)

ellDF <- build_ellipse(my_radius, my_radius) # Dataframe to plot the ellipse

names(ellDF) <- c("Real", "Imaginary") # rename the columns

# plot the eigenvalues
p <- ggplot(eigDF, aes(x = Real, y = Imaginary))
p <- p +
  geom_point(shape = I(3)) +
  theme(legend.position = "none")

# now add the vertical and horizontal line
p <- p + geom_hline(aes(yintercept = 0))
p <- p + geom_vline(aes(xintercept = 0))

# finally, add the ellipse
p <- p + geom_polygon(data = ellDF, aes(x = Real, y = Imaginary, alpha = 1/20, fill = "red"))
p



#### ANNOTATING PLOTS ####
a <- read.table("../data/Results.txt", header = TRUE)
head(a)
a$ymin <- rep(0, dim(a)[1]) # append a column of zeros

# Print the first linerange
p <- ggplot(a)
p <- p + geom_linerange(data = a, aes(
                          x = x,
                          ymin = ymin,
                          ymax = y1,
                          size = (0.5)
                          ),
                        colour = "#E69F00",
                        alpha = 1/2, show.legend = FALSE)

# Print the second linerange
p <- p + geom_linerange(data = a, aes(
                          x = x,
                          ymin = ymin,
                          ymax = y2,
                          size = (0.5)
                          ),
                        colour = "#56B4E9",
                        alpha = 1/2, show.legend = FALSE)

# Print the third linerange:
p <- p + geom_linerange(data = a, aes(
                          x = x,
                          ymin = ymin,
                          ymax = y3,
                          size = (0.5)
                          ),
                        colour = "#D55E00",
                        alpha = 1/2, show.legend = FALSE)

# Annotate the plot with labels:
p <- p + geom_text(data = a, aes(x = x, y = -500, label = Label))

# now set the axis labels, remove the legend, and prepare for bw printing
p <- p + scale_x_continuous("My x axis",
                            breaks = seq(3, 5, by = 0.05)) + 
                            scale_y_continuous("My y axis") + 
                            theme_bw() + 
                            theme(legend.position = "none") 
p

###### MATHEMATICAL DISPLAY ###########
x <- seq(0, 100, by = 0.1)
y <- -4. + 0.25 * x +
  rnorm(length(x), mean = 0., sd = 2.5)

# and put them in a dataframe
my_data <- data.frame(x = x, y = y)

# perform a linear regression
my_lm <- summary(lm(y ~ x, data = my_data))

# plot the data
p <-  ggplot(my_data, aes(x = x, y = y,
                          colour = abs(my_lm$residual))
             ) +
  geom_point() +
  scale_colour_gradient(low = "black", high = "red") +
  theme(legend.position = "none") +
  scale_x_continuous(
    expression(alpha^2 * pi / beta * sqrt(Theta)))

# add the regression line
p <- p + geom_abline(
  intercept = my_lm$coefficients[1][1],
  slope = my_lm$coefficients[2][1],
  colour = "red")
# throw some math on the plot
p <- p + geom_text(aes(x = 60, y = 0,
                       label = "sqrt(alpha) * 2* pi"), 
                       parse = TRUE, size = 6, 
                       colour = "blue")

p


library(ggthemes)

p <- ggplot(MyDF, aes(x = log(Predator.mass), y = log(Prey.mass),
                colour = Type.of.feeding.interaction )) +
                geom_point(size=I(2), shape=I(10)) + theme_bw()

p + geom_rangeframe() + # now fine tune the geom to Tufte's range frame
        theme_tufte() # and theme to Tufte's minimal ink theme    


