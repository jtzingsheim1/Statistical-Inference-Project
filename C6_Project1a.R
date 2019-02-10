# Coursera Data Science Specialization Course 6 Project 1 Part 1 Script


# The purpose of this script is to satisfy the requirements of the project 1
# peer-graded assignment that is part of the Statistical Inference course
# within the Data Science Specialization on Coursera. As per the instructions
# the project will consist of the two parts and this script is for part 1.
#
# The first part is a simulation exercise which will simulate 1000 averages of
# 40 exponentials and then:
# 1. Show the sample mean and compare it to the theoretical mean of the
# distribution
# 2. Show how variable the sample is (via variance) and compare it to the
# theoretical variance of the distribution
# 3a. Show that the distribution is approximately normal
# 3b. Focus on the difference between the distribution of a large collection of
# random exponentials and the distribution of a large collection of averages of
# 40 exponentials. (Show the effect of the Central Limit Theorem)


# Part 1) Simulation Exercise

# Define a function which takes the mean of exponentials
MeanOfExponentials <- function(n.obs, lambda) {
  # Takes the mean of exponentials from the rexp() function
  #
  # Args:
  #   n.obs: The number of observations variable, passed to rexp()
  #   lambda: The rate variable of the exponential, passed to rexp()
  #
  # Returns:
  #   The mean of the exponentials
  exp.mean <- mean(rexp(n.obs, lambda))
  return(exp.mean)
}

# Perform simulation
set.seed(190205)  # Set seed for reproducibility
# The instructions specify 1000 simulations of 40 exponentials with rate 0.2
n <- 40  # Set the number of observations per simulation
lambda <- 0.2  # Set the rate
sim.results <- replicate(1000, MeanOfExponentials(n, lambda))  # Do 1000 sims

# 1. Show the sample mean and compare it to the theoretical mean
sample.mean <- mean(sim.results)  # 4.99928
theoretical.mean <- 1/lambda  # 5
# The sample mean of 4.999 is very close to the theoretical mean of 5

# 2. Show the sample variance and compare it to the theoretical variance
sample.variance <- var(sim.results)  # 0.59796
theoretical.variance <- 1/(n * lambda^2)  # 0.625
# The sample variance of 0.598 is fairly close to the theoretical variance

# 3a. Show that the distribution is approximately normal
par(mfrow = c(1, 2))  # Setup plot space
hist(sim.results, freq = FALSE)  # Plot the simulation results by probability
# Next a line representing a normal distribution will be overlaid on this plot
curve(dnorm(x, mean = theoretical.mean, sd = sqrt(theoretical.variance)),
      add = TRUE)
# curve() plots a function of x. dnorm() is the expression for the normal
# distribution, and here it is written as a function of x. dnorm() is scaled to
# the theoretical mean and standard deviation of this situation. In this first
# plot the histogram appears to follow the reference line well, but it is
# recommended to check the Q-Q plot as well.
qqnorm(sim.results, main = "Q-Q Plot of sim.results")  # Add Q-Q Plot
qqline(sim.results)  # Add reference line
# In the second plot the simulation results still appear to follow the normal
# reference line fairly well.

# 3b. Show the effect of the Central Limit Theorem

# Run another simulation, but without taking the mean or many observations
sim.results2 <- replicate(1000, rexp(1, lambda))  # Do 1000 sims of 1 obs
theoretical.variance2 <- 1/(lambda^2)  # 25

# Plot the new simulation results as before
par(mfrow = c(1, 2))  # Setup plot space
hist(sim.results2, freq = FALSE)  # Plot the simulation resuls by probability
curve(dnorm(x, mean = theoretical.mean, sd = sqrt(theoretical.variance2)),
      add = TRUE)  # Add the corresponding normal curve
qqnorm(sim.results2, main = "Q-Q Plot of sim.results2")
qqline(sim.results2)
# These simulation results follow the underlying distribution (exponential), so
# the normal curve does not fit as well in the first plot. The Q-Q plot makes it
# much more obvious that the distribution is not normal. This shows the power of
# the CLT, that by taking the mean and taking large samples the distribution
# becomes more normal.

