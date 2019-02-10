# Coursera Data Science Specialization Course 6 Project 1 Part 2 Script


# The purpose of this script is to satisfy the requirements of the project 1
# peer-graded assignment that is part of the Statistical Inference course
# within the Data Science Specialization on Coursera. As per the instructions
# the project will consist of the two parts and this script is for part 2.
#
# The second part focuses on basic inferential data analysis. The steps are:
# 1. Load the ToothGrowth data and perform some basic exploratory data analysis
# 2. Provide a basic summary of the data
# 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by
# supp and dose.
# 4. State your conclusions and the assumptions needed for your conclusions


library(dplyr)
library(ggplot2)


# 1. Load the ToothGrowth data and perform some basic exploratory data analysis
tooth.data <- as_tibble(ToothGrowth)  # Load data
?ToothGrowth  # View documentation
str(tooth.data)  # Display structure
head(tooth.data)  # View first 6 rows

# In the documentation the units of the "len" variable are not provided. Based
# on its values it seems likely that the measurements are in millimeters. The
# analysis will proceed on this assumption.

tooth.data <- mutate(tooth.data, dose = as.factor(dose))  # Make "dose" a factor
print(qplot(x = dose, y = len, data = tooth.data, facets = ~ supp, color = dose,
            main = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs",
            xlab = "Dose of Vitamin C [mg/day]", ylab = "Tooth Length [mm]"))
 
# 2. Provide a basic summary of the data

