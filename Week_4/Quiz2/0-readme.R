For exam, put the .html questions sheet and the .xlsx data workbook on D2L
#did not ue github

#data from https://github.com/statmanrobin/Stat2Data
#https://www.rdocumentation.org/packages/Stat2Data/versions/2.0.0

#The package doesn't seem to work well when pullled from CRAN. Convert data
#to .csv files, then import into project

#Information
#https://www.rdocumentation.org/packages/Stat2Data/versions/2.0.0/topics/Hawks


#Question1
#Does body weight differ between Cooper's and Sharp-shinned Hawks?'

hawks <- read.csv("hawks.csv")

two_hawks <- hawks %>%
  filter(Species != "Red-tailed")
t.test(Weight~Species, two_hawks)


#Question 2 
#Recreate this summary table using the verbs we have learned in dplyr.

all three species, filter out the females, select bill attributes, calc mean and sd for each variable.

#Question3
#Linear regression with prediction

ggplot(hawks, aes(Wing, Weight)) +
  geom_point()+
  geom_smooth(method='lm')

model <- lm(Weight~Species, data=hawks)
library(ggfortify)
autoplot(model)
