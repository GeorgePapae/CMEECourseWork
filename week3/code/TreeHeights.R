# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
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