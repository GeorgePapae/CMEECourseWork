# Script name: GPDD_Data.R
# Description: Loading and plotting GPDD data on a world map in R
# Author: George Papaeracleous (gp222@ic.ac.uk)
# Date: November 2025

# Clear workspace
rm(list=ls())
# Load packages
library(maps)
library(ggplot2)

#load data
load("../data/GPDDFiltered.RData")
ls()
str(gpdd)
# Get world map coordinates
world_coordinates <- map_data("world")
# Plot data points on world map
LandMassMap <- ggplot() +
    geom_map(data=world_coordinates, map= world_coordinates,
             aes(long, lat, map_id=region),
             fill="lightgreen", color="black", linewidth=0.2)
LandMassMap
# Add sea, and remove axes
WorldMap <- LandMassMap +
    theme(panel.background = element_rect(fill="lightblue"),
    panel.grid.minor = element_line(color = "lightblue"),
    panel.grid.major = element_line(color = "lightblue"),
    axis.title.x=element_blank(),
    axis.title.y=element_blank(),
    axis.ticks=element_blank(),
    axis.text.x=element_blank(),
    axis.text.y=element_blank())
WorldMap

str(gpdd)

# Add gpdd data points
DataWorldMap <- WorldMap +
    geom_point(data=gpdd,
               aes(x=long, y=lat),
               color="darkred", size=1, alpha=1)
DataWorldMap
# Save the plot in the results folder
ggsave("../results/GPDD_Data.pdf", DataWorldMap)


# There are only data points in the northern hemisphere, 
# except a sinlge point in South Africa. Also, these are only in 
# Europe and North America, excluding Asia and the rest of the world. 
# Furthermore, most data points are in coastal areas.
