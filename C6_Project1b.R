# Coursera Data Science Specialization Course 6 Project 1 Part 2 Script


# The purpose of this script is to satisfy the requirements of the project 1
# peer-graded assignment that is part of the Statistical Inference course
# from Johns Hopkins University within the Data Science Specialization on
# Coursera. As per the instructions the project will consist of the two parts
# and this script is for part 2.
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
tooth.data <- as_tibble(ToothGrowth)  # Load data as a tibble
?ToothGrowth  # View documentation
str(tooth.data)  # Display structure
head(tooth.data)  # View first 6 rows

# In the documentation the units of the "len" variable are not provided. Based
# on its values it seems likely that the measurements are in millimeters. The
# analysis will proceed on this assumption.

tooth.data <- mutate(tooth.data, dose = as.factor(dose))  # Make "dose" a factor
# Plot the data
#print(qplot(x = dose, y = len, data = tooth.data, facets = ~ supp, color = dose,
#            main = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs",
#            xlab = "Dose of Vitamin C [mg/day]", ylab = "Tooth Length [mm]"))


# 2. Provide a basic summary of the data
summary(tooth.data)
# The summary shows that the "len" variable ranges from 4.20 to 33.90 with a
# mean of 18.81. There are 60 total observations - 30 each with the two
# supplement types: orange juice and ascorbic acid. There are 20 observations
# each of the 3 dosage levels. Essentailly there are six groups and each of them
# has 10 observations.


# 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by
# supp and dose.

# First, tooth growth will be investigated based on supplement type using a two
# sided t-test. The assumptions to proceed with the test are:
# 1. Means of populations follow a normal distribution
# 2. Variance of populations is equal
# 3. Data are sampled independently from the populations
# These assumptions will be checked before continuing

# First check if data follow a normal distribution
# Make a histogram
hist(tooth.data$len, main = "Histogram of Tooth Length",
     xlab = "Tooth Length [mm]")
# The histogram doesn't look very normal, but it's reasonably symmetric
# Check a Q-Q Plot also
qqnorm(tooth.data$len)  # Plot data
qqline(tooth.data$len)  # Add the normal line
# While the Q-Q Plot isn't perfect, the t-test is robust to the normality
# assumption. The analysis will continue assuming the data are normal enough

# Second check if the variance is equal, plot the values side by side
print(qplot(x = supp, y = len, data = tooth.data,
            main = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs",
            xlab = "Supplement", ylab = "Tooth Length [mm]"))
# In the plot above the Vitamin C supplement appears to vary more, but the
# t-test is highly robust to unequal variances when the sample sizes are equal,
# which they are in this case. If in doubt however, an F-test can be performed
# to show the variances are not statistically different.
var.test(x = filter(tooth.data, supp == "VC")$len,
         y = filter(tooth.data, supp == "OJ")$len)  # p-value = 0.2331

# Lastly, there is no reason to believe the data were not sampled independently.
# Additionally there is no way to test for this assumption, so analysis will
# continue assuming that all conditions for the two-sided t-test are met.

# First, hypothesis tests will be conducted to investigate the effect of the
# supplement type. The hypotheses are stated below:
# H_0: mu_oj = mu_vc (There is no significant difference in the means)
# H_a: mu_oj != mu_vc (There is a significant difference in the means)

# The t.test function will be used to evaluate the test the hypothesis
t.test(x = filter(tooth.data, supp == "VC")$len,
       y = filter(tooth.data, supp == "OJ")$len, var.equal = TRUE)
# The p-value of this test is 0.06063, so the test is not significant at the
# 0.95 confidence level


# 4. State your conclusions and the assumptions needed for your conclusions


