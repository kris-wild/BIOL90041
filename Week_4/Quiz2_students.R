library(dplyr)
library(nycflights13)
###

# data
flights
weather



# Quistion 1
# What is the Zuur protocol’s recommendation if your response variable is right-skewed?
#
# Remove the extreme values causing skewness
# Apply a transformation, such as log or square-root
# Switch to a categorical response variable
# Replace skewed values with the mean
# 
# Correct Answer: Apply a transformation, such as log or square-root
# (Transforming the response (e.g., log, square-root) helps normalize data and meet model assumptions.)



# Question 2:
# What is the purpose of checking for outliers in covariates (explanatory variables)?
#   
#  To remove all unusual values
#  To verify if the response variable needs to be log-transformed
#  To avoid influential points that can distort model estimates
#  To simplify variable names
# 
# Correct Answer: To avoid influential points that can distort model estimates
# (Outliers in covariates can disproportionately affect model estimates and residual structure.)



# Question 3
# What will the following code return?
#   flights %>%
#   select(year:day)
#
# All variables from year to day inclusive
# Only the day variable
# Only the year variable
# All variables except year to day

# Correct Answer: All variables from year to day inclusive


# Question 4
# What class is the flights dataset in nycflights13? Note bring in the package 'nycflights13'.   library(nycflights13)
#
# data.frame
# tibble
# matrix
# list

# Correct Answer: tibble
str(flights)
#tibble [336,776 × 19] 

# Question 5
# How many character (`chr`) columns are there in the flights data set?
#
# 2
# 3
# 4
# 5
#
# Correct Answer: 4
str(flights)
# (There are 4 character columns (chr): `carrier`, `tailnum`, `origin`, and `dest`.)

# Question 6
# Using the flights data, what is the maximum air time (air_time) for flights with destination (dest) Philadelphia (PHL)?

# 183 minutes
# 115 minutes
# 75 minutes
# 204 minutes
# 
# Correct Answer: 75 minutes
flights %>%
  filter(dest == 'PHL' ) %>% # filter Philadelphia
  summarise(max = max(air_time, na.rm = TRUE)) # summarise max air time


# Question 7
# Using the flights dataset, what is the minimum distance flown (distance) across all flights?
# 
# 0 miles
# 17 miles
# 52 miles
# 102 miles
# 
# Correct Answer: 17 miles
min(flights$distance)
# (The shortest recorded flight distance in the dataset is 17 miles.)


# Question 8
# Using the flights dataset, what is the average distance flown (distance) by the plane with tail number N14228?
#
# 872 miles
# 2034 miles
# 1547 miles
# 1289 miles
#
# Correct Answer: 1547 miles
flights %>% 
  filter(tailnum == 'N14228') %>% # filter the tail numer
  summarise(mean = mean(distance)) # summarise the mean distance
# (The average distance flown by the plane with tail number N14228 is 1547 miles.)


# Question 9
# Using the weather dataset, what was the minimum and maximum temperature (temp).
# recorded in 2013?
# (Note: Use na.rm = TRUE to ignore missing values when calculating min and max.)
#
# 5.2°F and 98.6°F
# 8.7°F and 102.3°F
# 10.9°F and 100°F
# 12.1°F and 97.5°F
#
# Correct Answer: 10.9°F and 100°F
weather %>%
  filter(year == 2013) %>%
  summarise(min = min(temp, na.rm = T),
            max = max(temp, na.rm = T))
# (The minimum temperature recorded was 10.9°F and the maximum was 100°F in 2013, 
# excluding any NA values.)



# Question 10
# Using the weather dataset, how many years are represented in the data?
#
# 1 year
# 2 years
# 3 years
# 5 years
#
# Correct Answer: 1 year
# (The weather dataset only includes data from the year 2013.)
table(weather$year)


# Question 11
# Using the flights dataset, which carrier had the most flights in 2013?
#
# DL (Delta Air Lines Inc.)
# B6 (JetBlue Airways)
# EV (ExpressJet Airlines Inc.)
# UA (United Air Lines Inc.)
#
# Correct Answer: UA (United Air Lines Inc.)
flights %>%
  group_by(carrier) %>%
  summarise(n = n())
# (United Air Lines Inc. — carrier code "UA" — had the most flights, with 58,665.)


#  Question 12
# You want to add weather data (e.g., temperature) to each flight based on matching
# date, time, and origin. Which of the following code snippets correctly performs this join?
#
# left_join(flights, weather, by = c("year", "month", "day", "hour", "origin"))
# inner_join(weather, flights, by = "time_hour")
# left_join(flights, weather, by = c("time_hour", "origin"))
# merge(flights, weather)
#
# Correct Answer: left_join(flights, weather, by = c("time_hour", "origin"))
# (The `weather` and `flights` data can be joined using both `origin` and `time_hour`, 
# which are shared columns in both data frames.)
left_join(flights, weather, by = c("time_hour", "origin"))
