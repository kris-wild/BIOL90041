library(dplyr)
library(nycflights13)
###

# data
flights
weather



# Quistion 1
# What is the Zuur protocol’s recommendation if your response variable is right-skewed?
#
# A. Remove the extreme values causing skewness
# B. Apply a transformation, such as log or square-root
# C. Switch to a categorical response variable
# D. Replace skewed values with the mean
# 
# Correct Answer: B
# (Transforming the response (e.g., log, square-root) helps normalize data and meet model assumptions.)



# Question 2:
# What is the purpose of checking for outliers in covariates (explanatory variables)?
#   
# A. To remove all unusual values
# B. To verify if the response variable needs to be log-transformed
# C. To avoid influential points that can distort model estimates
# D. To simplify variable names
# 
# Correct Answer: C
# (Outliers in covariates can disproportionately affect model estimates and residual structure.)


# Question 3
# Which code creates a new column called gain that is arr_delay - dep_delay?
#
# A. summarise(gain = arr_delay - dep_delay)
# B. filter(gain = arr_delay - dep_delay)
# C. mutate(gain = arr_delay - dep_delay)
# D. select(gain = arr_delay - dep_delay)
# 
# Correct Answer: C


# Question 4
# What will the following code return?
#   flights %>%
#   select(year:day)
#
# A. All variables from year to day inclusive
# B. Only the day variable
# C. Only the year variable
# D. All variables except year to day

# Correct Answer: A


# Question 5
# What class is the flights dataset in nycflights13? Note bring in the package 'nycflights13'.   library(nycflights13)
#
# A. data.frame
# B. tibble
# C. matrix
# D. list

# Correct Answer: B
str(flights)
#tibble [336,776 × 19] 

# Question 6
# How many character (`chr`) columns are there in the flights data set?
#
# A. 2
# B. 3
# C. 4
# D. 5
#
# Correct Answer: C
str(flights)
# (There are 4 character columns (chr): `carrier`, `tailnum`, `origin`, and `dest`.)

# Question 7
# Using the flights data, what is the maximum air time (air_time) for flights with destination (dest) Philadelphia (PHL)?

# A. 183 minutes
# B. 115 minutes
# C. 75 minutes
# D. 204 minutes
# 
# Correct Answer: C
flights %>%
  filter(dest == 'PHL' ) %>% # filter Philadelphia
  summarise(max = max(air_time, na.rm = TRUE)) # summarise max air time


# Question 8
# Using the flights dataset, what is the minimum distance flown (distance) across all flights?
# 
# A. 0 miles
# B. 17 miles
# C. 52 miles
# D. 102 miles
# 
# Correct Answer: B
min(flights$distance)
# (The shortest recorded flight distance in the dataset is 17 miles.)


# Question 9
# Using the flights dataset, what is the average distance flown (distance) by the plane with tail number N14228?
#
# A. 872 miles
# B. 2034 miles
# C. 1547 miles
# D. 1289 miles
#
# Correct Answer: C
flights %>% 
  filter(tailnum == 'N14228') %>% # filter the tail numer
  summarise(mean = mean(distance)) # summarise the mean distance
# (The average distance flown by the plane with tail number N14228 is 1547 miles.)


# Question 10
# Using the flights dataset, what tail number had the most flights?
#
# A. N14228
# B. N505JB
# C. N722MQ
# D. N725MQ
#
# Correct Answer: D
flights %>%
  group_by(tailnum) %>% # group by tail number
  summarise(n = n()) %>% # sumarise sample size n()
  arrange(desc(n)) # optional, arrange by sample size. 
# (Tail number N725MQ had the most flights in the data set.)


# Question 11
# Using the flights dataset, how many flights had NA or no tail number (tailnum) recorded?
#
# A. 945
# B. 1,110
# C. 2,517
# D. All were recorded
#
# Correct Answer: C
sum(is.na(flights$tailnum))
# (There are 2,517 flights in the dataset with missing tail numbers.)


# Question 12
# Using the weather dataset, what was the minimum and maximum temperature (temp).
# recorded in 2013?
# (Note: Use na.rm = TRUE to ignore missing values when calculating min and max.)
#
# A. 5.2°F and 98.6°F
# B. 8.7°F and 102.3°F
# C. 10.9°F and 100°F
# D. 12.1°F and 97.5°F
#
# Correct Answer: C
weather %>%
  filter(year == 2013) %>%
  summarise(min = min(temp, na.rm = T),
            max = max(temp, na.rm = T))
# (The minimum temperature recorded was 10.9°F and the maximum was 100°F in 2013, 
# excluding any NA values.)

# Question 13
# Using the weather dataset, how many years are represented in the data?
#
# A. 1 year
# B. 2 years
# C. 3 years
# D. 5 years
#
# Correct Answer: A
# (The weather dataset only includes data from the year 2013.)
table(weather$year)


# Question 14
# Using the flights dataset, which carrier had the most flights in 2013?
#
# A. DL (Delta Air Lines Inc.)
# B. B6 (JetBlue Airways)
# C. EV (ExpressJet Airlines Inc.)
# D. UA (United Air Lines Inc.)
#
# Correct Answer: D
# (United Air Lines Inc. — carrier code "UA" — had the most flights, with 58,665.)
flights %>%
  group_by(carrier) %>%
  summarise(n = n())

#  Question 15
# You want to add weather data (e.g., temperature) to each flight based on matching
# date, time, and origin. Which of the following code snippets correctly performs this join?
#
# A. left_join(flights, weather, by = c("year", "month", "day", "hour", "origin"))
# B. inner_join(weather, flights, by = "time_hour")
# C. left_join(flights, weather, by = c("time_hour", "origin"))
# D. merge(flights, weather)
#
# Correct Answer: C
# (The `weather` and `flights` data can be joined using both `origin` and `time_hour`, 
# which are shared columns in both data frames.)
left_join(flights, weather, by = c("time_hour", "origin"))