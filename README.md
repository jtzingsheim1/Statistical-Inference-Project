# Statistical Inference Project README

## Overview

This repo contains my work from the course project from the
[Statistical Inference course][1] from Johns Hopkins University within the
[Data Science Specialization][2] on Coursera. The original instructions for the
project can be found beneath the brief description section below. The scripts
and markdowns were all created in RStudio.

[1]: https://www.coursera.org/learn/statistical-inference "Statistical Inference course"
[2]: https://www.coursera.org/specializations/jhu-data-science "Data Science Specialization"


## Brief Description

As described in the original instructions below, the project consists of two
parts. The files in this repo follow a naming convention that begins with
C6_Project1 for Course 6 Project 1. The a or b following the 1 indicates either
part a or part b of the project. Each part began with an R script to achieve the
basic requirements of the project. The script was then used to help write an R
markdown file. The markdowns were knit into html files using `knitr` (while
retaining the intermediate md files). The course instructions asked to submit
the assignment as a pdf, so the Rmd files were also knit to pdfs.

## Original Project Instructions (abbreviated)

Credit for the material below goes to the original authors Caffo, Peng, and
Leek from John Hopkins University. This material was accessed through the course
content on Coursera.

>
>The project consists of two parts:
>
>* A simulation exercise.  
>* Basic inferential data analysis.
>
>You will create a report to answer the questions. Given the nature of the
series, ideally you'll use `knitr` to create the reports and convert to a pdf.
(I will post a very simple introduction to `knitr`). However, feel free to use
whatever software that you would like to create your pdf.
>
>Each pdf report should be no more than 3 pages with 3 pages of supporting
appendix material if needed (code, figures, etcetera).
>
>### Part 1: Simulation Exercise Instructions
>In this project you will investigate the exponential distribution in R and
compare it with the Central Limit Theorem. The exponential distribution can be
simulated in R with `rexp(n, lambda)` where `lambda` is the rate parameter. The
mean of exponential distribution is 1/lambda and the standard deviation is also
1/lambda. Set `lambda = 0.2` for all of the simulations. You will investigate
the distribution of averages of 40 exponentials. Note that you will need to do a
thousand simulations.
>
>Illustrate via simulation and associated explanatory text the properties of the
distribution of the mean of 40 exponentials. You should:
>
>* Show the sample mean and compare it to the theoretical mean of the
distribution.  
>* Show how variable the sample is (via variance) and compare it to the
theoretical variance of the distribution.  
>* Show that the distribution is approximately normal.
>
>In point 3, focus on the difference between the distribution of a large
collection of random exponentials and the distribution of a large collection of
averages of 40 exponentials.
>
>### Part 2: Basic Inferential Data Analysis Instructions 
Now in the second portion of the project, we're going to analyze the
`ToothGrowth` data in the R `datasets` package.
>
>* Load the `ToothGrowth` data and perform some basic exploratory data analyses
>* Provide a basic summary of the data.
>* Use confidence intervals and/or hypothesis tests to compare tooth growth by
`supp` and `dose`. (Only use the techniques from class, even if there's other
approaches worth considering)
>* State your conclusions and the assumptions needed for your conclusions.
>

