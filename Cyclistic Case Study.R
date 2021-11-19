setwd("C:/Users/as30158/Desktop/Academia/90 Coursera/01 Google Data Analytics/05 Case Study/00 Data")
getwd()

install.packages('tidyverse')
#install.packages('lubridate')
install.packages('ggplot2')
install.packages('Hmisc')
install.packages('dplyr')

library(tidyverse)
library(lubridate)
library(ggplot2)
library(Hmisc)
library(dplyr)

#data_2021_10 <- read.csv(file = "C:\Users\as30158\Desktop\Academia\90 Coursera\01 Google Data Analytics\05 Case Study\00 Data\202110-divvy-tripdata.csv" , header = TRUE, sep = ",")

data_2021_10 <- read.csv(file = "202110-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_09 <- read.csv(file = "202109-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_08 <- read.csv(file = "202108-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_07 <- read.csv(file = "202107-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_06 <- read.csv(file = "202106-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_05 <- read.csv(file = "202105-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_04 <- read.csv(file = "202104-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_03 <- read.csv(file = "202103-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_02 <- read.csv(file = "202102-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2021_01 <- read.csv(file = "202101-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2020_12 <- read.csv(file = "202012-divvy-tripdata.csv" , header = TRUE, sep = ",")
data_2020_11 <- read.csv(file = "202011-divvy-tripdata.csv" , header = TRUE, sep = ",")

colnames(data_2021_10)
colnames(data_2021_09)
colnames(data_2021_08)
colnames(data_2021_07)
colnames(data_2021_06)
colnames(data_2021_05)
colnames(data_2021_04)
colnames(data_2021_03)
colnames(data_2021_02)
colnames(data_2021_01)
colnames(data_2020_12)
colnames(data_2020_11)

str(data_2021_10)
str(data_2021_09)
str(data_2021_08)
str(data_2021_07)
str(data_2021_06)
str(data_2021_05)
str(data_2021_04)
str(data_2021_03)
str(data_2021_02)
str(data_2021_01)
str(data_2020_12)
str(data_2020_11)
#All Structures are same

head(data_2021_10)
head(data_2021_05)
head(data_2021_01)
head(data_2020_11)

combined_data <- rbind( data_2021_10 , data_2021_09 , data_2021_08 , data_2021_07 , data_2021_06 , data_2021_05 , data_2021_04 , data_2021_03 , data_2021_02 , data_2021_01 , data_2020_12 , data_2020_11)

head(combined_data)

save( combined_data , file = "combined_data.RData")
write.csv(combined_data, "Combined_Data.csv")

''''''''''''''''''''''''''''''''''''''''''''''''
#load("combined_data.RData")

head(combined_data)

#describe(data_2021_10)
#describe(combined_data)
summary(combined_data)

table(combined_data$member_casual)
table(combined_data$ride_id)
table(combined_data$rideable_type)

start_dates <- as.Date(combined_data.started_at, "%m/%d/%Y")

head(start_dates)

start_dates <- ymd_hms("2010-12-13 15:30:30")

start_time <- ymd_hms(combined_data$started_at)              
end_time <- ymd_hms(combined_data$ended_at)

str(start_time)
str(end_time)

combined_data <- cbind(combined_data,start_time,end_time)
head(combined_data)

combined_data <- combined_data %>%
                               select(-c(started_at,ended_at))
                               
str(combined_data)                               
              

save( combined_data , file = "combined_data.RData")              
              
              