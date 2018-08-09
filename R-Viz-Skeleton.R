
# Load library -----
library(tidyverse)

# Download data and skeleton script from GitHub into project -----

# Go to GitHub [repo](https://github.com/mariekekjones/BIMS-bootcamp) to get these materials

# NHANES data ----
nh <- read_csv("nhanes.csv")
View(nh)

# Read in downloaded data using `read_csv()` from {readr} package


# Show the first few lines of the data and the dimensions
head(nh)
head(nh, 16)

dim(nh)

# Optionally bring up data in a viewer window.


# dplyr review --------

# Access dplyr cheat sheet from `Help` menu

# dplyr verbs
# 1. `filter()`
# 2.. `group_by()` 
# 3. `summarize()`

# dplyr takes a tibble dataframe as its first argument and then a logical condition to meet as the second argument.

# - `==`: Equal to
# - `!=`: Not equal to
# - `>`, `>=`: Greater than, greater than or equal to
# - `<`, `<=`: Less than, less than or equal to
 
# If you want to satisfy *all* of multiple conditions, you can use the "and" operator, `&`. 
# The "or" operator `|` (the pipe character, usually shift-backslash) will return a subset that meet *any* of the conditions.

# Let's use filter to return rows where the person was elderly (defined as >= 80 years old)

filter(nh, Age >= 80)
filter(nh, Age == 80)

# Using the pipe -----
# `%>%` or `Control + Shift + M` 

# `head()` without pipe
head(nh, 8)

# `head()` with pipe
nh %>% head(8)

# Now let's use the pipe operator with filter to subset for elderly people >= 80 years old
# without pipe
filter(nh, Age >= 80)

# with pipe
nh %>% filter(Age >=80)

# Nesting v. %>% ----------

# Let's say we want to see the mean height, grouped by Race, only for adults.
# without pipe
summarise(group_by(filter(nh, Age >= 18), Race), meanHeight = mean(Height, na.rm = TRUE) )

# with pipe
nh %>% 
  filter(Age >=18) %>% 
  group_by(Race) %>% 
  summarise(meanHeight = mean(Height, na.rm = TRUE))

# with pipe arranged in order
nh %>% 
  filter(Age >=18) %>% 
  group_by(Race) %>% 
  summarise(meanHeight = mean(Height, na.rm = TRUE)) %>% 
  arrange(meanHeight)

nh %>% 
  filter(Age >=18) %>% 
  group_by(Race) %>% 
  summarise(meanHeight = mean(Height, na.rm = TRUE)) %>% 
  arrange(desc(meanHeight))


# ** EXERCISE 1 ** ------------
# ** YOUR TURN **
#   A. How many observations are there of children (< 18 years old)?
nh %>% 
 count(Age <18)
#   B. How many cases of obese children are there (BMI >= 30)?
nh %>% 
  count(BMI >= 30)

#   C. Use `filter()`, `group_by()` and `summarize()` to find the mean BMI by Smoking Status for only Adults who have Diabetes. Do diabetic smokers or non-smokers have higher BMI?
nh %>% 
  filter(Diabetes == "Yes") %>% 
  group_by(SmokingStatus) %>% 
  summarise(meanBMI = mean(BMI, na.rm = TRUE)) %>% 
  arrange(desc(meanBMI))

# ggplot2 ---------

# allows you to build a plot layer-by-layer by specifying:
 
# - a **geom**, which specifies how the data are represented on the plot (points, lines, bars, etc.),
# - **aesthetics** that map variables in the data to axes on the plot or to plotting size, shape, color, etc.,
# - **facets**, which we've already seen above, that allow the data to be divided into chunks on the basis of other categorical or continuous variables and the same plot drawn for each chunk.
 
# Scatterplots ---------
# Age (X) against Height (Y) (continuous X, continuous Y)

# color the points by Gender

# color the points blue and shape them as +

# what is the difference between coloring by a variable and coloring by static values?

# plot points colored by Gender and smoothed line

# plot smoothed trend line and points both colored by gender

# color all layers by Gender

# color all layers by Gender, add transparency to points, make line bolder

# ** EXERCISE 2 ** ----------
# ** YOUR TURN **
#   A. Use a scatterplot to investigate the relationship between Age and Testosterone.

#   B. Color the plot in A by Gender.

#   C. Create the plot in A for just men.

#   D. Filter for men > 65 and < 80 years old and then examine the relationship between Age and Testosterone.

#   E. Does the relationship you saw in D differ if the man is physically active (PhysActive == "Yes")? Use colored loess lines to see the effect of physical activity.

# Visualizations for discrete X ---------
# Plot BMI by Smoking Status
# blank canvas, note categories on X

# try with geom point

# no variability in X values --> overplotting
# so add some random variability to x-axis using geom_jitter

# remove NA category and add transparency

# plot boxplot

# plot jitter and boxplot

# improve the jitter/boxplot

# color boxplot by gender

# fill boxplot by gender

# **EXERCISE 3** ----------
# ** YOUR TURN **
#   A. Create boxplots showing height for Adults of different Races

#   B. Add jittered data under boxplots in A.

#   C. Fill boxplots in A by Gender

# Plotting univariate continuous data -------

#canvas for height

# save canvas as p then add histogram

# change bin size

# smoothed density curve

# histogram colored by Race

# histogram filled by Race

# get help on histogram function

# change position

# add transparency

# try with density curves colored by Race

# change fill color and add transparency

# Faceting -----------

# overlapping histograms filled by Race

# facet histograms by race

# facet density plots by Race

# Choosing colors and themes ----------

# boxplot of BMI by Smoking status without missing Smoking Status

# filled by Diabetes

# see all color options

#change colors manually

#change theme

# ** EXERCISE 4 ** ----------
# ** YOUR TURN **
# Practice creating the plots pictured

#   A. 
#   No = not physically active, Yes = physically active

#   B. 
#   Custom colors are "salmon" and "seagreen"

#   C. 
