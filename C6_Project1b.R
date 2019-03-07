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
print(qplot(x = dose, y = len, data = tooth.data, facets = ~ supp, color = dose,
            main = "The Effect of Vitamin C on Tooth Growth in Guinea Pigs",
            xlab = "Dose of Vitamin C [mg/day]", ylab = "Tooth Length [mm]"))
# In the plot above the dose appears to correlate with longer tooth length, and
# it is difficult to say if there is a correlation to supplement type.


# 2. Provide a basic summary of the data
summary(tooth.data)
# The summary shows that the "len" variable ranges from 4.20 to 33.90 with a
# mean of 18.81. There are 60 total observations - 30 each with the two
# supplement types: orange juice and ascorbic acid. There are 20 observations
# each of the 3 dosage levels. Essentailly there are six groups and each of them
# has 10 observations.


# 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by
# supp and dose.

# Before proceeding with tests the assumptions for t-tests should be reviewed:
# 1. Means of populations follow a normal distribution
# 2. Variances of populations are equal
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

# The second check is of the variance, which does appear to be reasonably equal
# in this case. However, the t.test function is capable of compensating for
# unequal variance, so that method will be used to remain conservative. Lastly,
# there is no reason to believe the data were not sampled independently.
# Additionally there is no way to test for this assumption, so analysis will
# continue assuming that all conditions for the two-sided t-test are met.

# The first hypothesis test investigates the effect of the supplement type. The
# hypotheses are stated below:
# H_0: mu_oj = mu_vc (There is no significant difference in the means)
# H_a: mu_oj != mu_vc (There is a significant difference in the means)

# The t.test function will be used to evaluate the hypotheses
t.test(x = filter(tooth.data, supp == "VC")$len,
       y = filter(tooth.data, supp == "OJ")$len)
# The p-value of this test is 0.06063, so the test is not significant at the
# 0.95 confidence level. There does not appear to be a significant difference
# between the supplement types.

# Next, the effect of the dose will be explored, but the instructions specify
# that only methods taught in the course up to this point can be used. Because
# of this t-tests will be used again even though other methods could be
# superior.

# The next test will compare the 0.5 dose level to the 1.0 dose level, and the
# hypotheses are stated below.
# H_0: mu_05 = mu_10 (There is no significant difference in the means)
# H_a: mu_05 != mu_10 (There is a significant difference in the means)

# The t.test function will be used to evaluate the hypotheses
t.test(x = filter(tooth.data, dose == "0.5")$len,
       y = filter(tooth.data, dose == "1")$len)
# The p-value of this test is 1.268e-07 which is extreemly small and is
# significant at the 0.95 confidence level. One more test will be checked below.

# The last test will compare the 1.0 dose level to the 2.0 dose level, and the
# hypotheses are stated below.
# H_0: mu_10 = mu_20 (There is no significant difference in the means)
# H_a: mu_10 != mu_20 (There is a significant difference in the means)

# The t.test function will be used to evaluate the hypotheses
t.test(x = filter(tooth.data, dose == "1")$len,
       y = filter(tooth.data, dose == "2")$len)
# The p-value of this test is 1.906e-05 which is extreemly small and is
# significant at the 0.95 confidence level. Between these two tests it does
# appear that the dose level is significantly correlated with tooth length. A
# correction could be applied to compensate for the fact that two tests were
# conducted, but the p-values are low enough that the results would still be
# significant.


# 4. State your conclusions and the assumptions needed for your conclusions

# The conclusions of this analysis are that tooth growth does have a
# statistically significant correlation with dosage level of vitamin C. Another
# conclusion is that tooth growth was not significantly correlated with the
# types of vitamin C used in the experiment. There are only two assumptions
# needed to make these conclusions:
# 1. Means of populations follow a normal distribution
# 2. Data are sampled independently from the populations
# While the t-test is robust to the normality assumption, plots were created
# which show that the data are reasonably normal. While the variance appears to
# be homogenous in this case, it was compensated for in the t-test. The
# assumption for independent sampling seems reasonable as well.

