setwd("C:/Users/as30158/Desktop/Academia/90 Coursera/01 Google Data Analytics/05 Case Study/00 Data")
getwd()
load("combined_data.RData")    

library(tidyverse)
library(lubridate)
library(ggplot2)
library(Hmisc)
library(dplyr)

head(combined_data)
str(combined_data)

trip_data <- combined_data

trip_data$Start_month <- format(as.Date(trip_data$start_time), "%m")
trip_data$Start_day <- format(as.Date(trip_data$start_time), "%d")
trip_data$Start_year <- format(as.Date(trip_data$start_time), "%Y")
trip_data$Start_day_of_week <- format(as.Date(trip_data$start_time), "%A")

head(trip_data)

trip_data <- arrange(trip_data, start_time)

trip_data$ride_length <- difftime(trip_data$end_time ,trip_data$start_time)
str(trip_data)

trip_data$ride_length <- as.numeric(as.character(trip_data$ride_length))
is.numeric(trip_data$ride_length)

summary(trip_data)
head(trip_data)

trip_data_v2 <- trip_data[!(trip_data$start_station_name == "HQ QR" | trip_data$ride_length<0),]

summary(trip_data_v2)

trip_data_v3 <- trip_data_v2 %>%
    filter(
      !(is.na(start_station_name) |
          start_station_name == "")
      ) %>% 
  
  filter(
    !(is.na(end_station_name) |
        end_station_name == "")
    )

summary(trip_data_v3)

aggregate(trip_data_v2$ride_length ~ trip_data_v2$member_casual, FUN = mean)
aggregate(trip_data_v2$ride_length ~ trip_data_v2$member_casual, FUN = median)
aggregate(trip_data_v2$ride_length ~ trip_data_v2$member_casual, FUN = max)
aggregate(trip_data_v2$ride_length ~ trip_data_v2$member_casual, FUN = min)



counts <- aggregate(trip_data_v2$ride_length ~ trip_data_v2$member_casual + trip_data_v2$day_of_week, FUN = mean)
write.csv(counts, file = "Exported_data")

