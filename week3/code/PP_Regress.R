mydata <- read.csv("../data/EcolArchives-E089-51-D1.csv", header = T)
head(mydata)
#Change columns to factor to use as grouping variables
mydata$Type.of.feeding.interaction <- as.factor(mydata$Type.of.feeding.interaction)
mydata$Location <- as.factor(mydata$Location)
str(mydata)
## Ensure mass in same units
unique(mydata$Prey.mass.unit)
## Convert mg to g
mydata$Prey.mass[mydata$Prey.mass.unit == "mg"] <- mydata$Prey.mass[mydata$Prey.mass.unit =="mg"] / 1000
mydata$Prey.mass.unit[mydata$Prey.mass.unit == "mg"] <- "g"

library(ggplot2)
library(dplyr)

p <- ggplot(mydata, aes(x=Prey.mass, y = Predator.mass, colour = Predator.lifestage)) +
        geom_point(shape = 3) +
        geom_smooth(method = "lm", se = TRUE, size = 1, fullrange= TRUE) +
        facet_wrap(~Type.of.feeding.interaction, scales = "fixed", nrow = 5, strip.position = "right") +
        labs(x = "Prey Mass in grams", y = "Predator mass in grams") +
        scale_x_log10() + scale_y_log10() +
        theme_bw(base_size = 12) + 
        theme(
            strip.text = element_text(size = 7),
            legend.text = element_text(size = 7),
            legend.position = "bottom",
            legend.title = element_text(face = "bold", size = 9),
            panel.grid.minor = element_blank()
            ) + guides(colour = guide_legend(nrow = 1, byrow = TRUE))

pdf("../results/PP_plot.pdf")
print(p)
dev.off()

# Functions to extract values
df <- mydata %>%
    group_by(Type.of.feeding.interaction) %>%
    do({
        model <- lm(log10(Predator.mass) ~ log10(Prey.mass), data = .)
        data.frame(
            Predator_Life_Stage = unique(.$Predator.lifestage),
            Regression_Slope = coef(model)[2],
            Regression_Intercept = coef(model)[1],
            R_squared = summary(model)$r.squared,
            F_statistic = summary(model)$fstatistic[1],
            p_value = pf(summary(model)$fstatistic[1],
                         summary(model)$fstatistic[2],
                         summary(model)$fstatistic[3],
                         lower.tail = FALSE)
        )
    })
write.csv(df,"../results/PP_Regress_Results.csv", row.names = FALSE)



head(mydata)


























