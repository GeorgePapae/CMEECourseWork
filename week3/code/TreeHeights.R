# Script name: TreeHeights.R
# Description: Calculating tree heights from distance and angle data
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"
TreeData <- read.csv("../data/trees.csv", header = TRUE)

TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    #print(paste("Tree height is:", height))
  
    return (height)
}

for (species in TreeData$Species) {
    degrees <- TreeData$Angle.degrees[TreeData$Species == species]
    distance <- TreeData$Distance.m[TreeData$Species == species]
    height <- TreeHeight(degrees, distance)
    TreeData$Tree.Height.m [TreeData$Species == species] <- height
}

write.csv(TreeData, "../results/TreeHts.csv", row.names=FALSE)
print ("Script complete! Results written to ../results/TreeHts.csv")