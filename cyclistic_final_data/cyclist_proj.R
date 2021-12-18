
                    ### Data Wrangling with Tidyverse ###


## Hi and Hello there, this is a Project from Google Data Analytics Professional Certificate
## Brief : A Bicycle rent company looking to convert its casual riders into Members, The datasets
## are downloaded from https://divvy-tripdata.s3.amazonaws.com/index.html and aggregated into a single 
## file from combining data from all all csv files. Link to the raw files used in this analysis 
## https://drive.google.com/drive/u/0/folders/1KtGQ4Ht2itRLivrfkbjGpWpNN1pG2Rtb.


## 1. Loading packages: Tidyverse/Dplyr/Ggplot2
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(tidyverse)
library(ggplot2)

# 2. Creating new Variable to Data set
cycle <- cyclr

head(cycle)
str(cycle)

#  3. Summarizing the data of Different Bike riders
# Time length rides day wise from Sep-2020 to Aug-2021

 daily_riders_minutes <- cycle %>% 
  group_by(day) %>% 
  summarize(casual_mins = sum(casual_ride_len), member_mins = sum(member_ride_len))

 daily_riders_minutes
 
 #  4. Summarizing the data of Different Bike riders
 # count of rides day wise from Sep-2020 to Aug-2021
 
 daily_riders_counts <- cycle %>% 
   group_by(day) %>% 
   summarize(casual_count = sum(casual_ride_count), member_count = sum(member_ride_count))
 
 daily_riders_counts
 
 #  5. Summarizing the data of Different Bikes'
 # Time length of rides day wise from Sep-2020 to Aug-2021
 
 daily_bikes_minutes <- cycle %>% 
   group_by(day) %>% 
   summarize(clasc_mins = sum(classic_bike_len), elec_mins = sum(electric_bike_len),
             dockd_mins = sum(docked_bike_len))
 
print(daily_bikes_minutes)
 
 #  6. Summarizing the data of Different Bikes'
 # count of rides day wise from Sep-2020 to Aug-2021
 
 daily_bikes_counts <- cycle %>% 
   group_by(day) %>% 
   summarize(clasc_count = sum(classic_bike_count), elec_count = sum(classic_bike_count),
             dockd_count = sum(docked_bike_count))
 
 print(daily_bikes_counts)
 
 # 7. Average minutes rode by different riders on 
 # different days of the week per ride
 
 avg_riders_mins <- cycle %>% 
   group_by(day) %>% 
   summarize(memb_avg = sum(member_ride_len) / sum(member_ride_count),
             casu_avg = sum(casual_ride_len) / sum(casual_ride_count))
 
 print(avg_riders_mins)
 
 # 8. Average minutes rode on different bikes
 # in week days from Sep-2020 to Aug-2021
 
 avg_bikes_mins <- cycle %>% 
   group_by(day) %>% 
   summarize(clasc_avg = sum(classic_bike_len) / sum(classic_bike_count),
             elec_avg = sum(electric_bike_len) / sum(electric_bike_count),
             dock_avg = sum(docked_bike_len)/ sum(docked_bike_count))
 
 print(avg_bikes_mins)
 
        ############### SUMMARIZING DATA INTO MONTHLY FORMAT ##########################
 
 # 9. converting Date column from character into Date format and summarizing vlaues into monthly
 # Note: I have created new  data set variable "cycled" to avoid any errors in original.
 # this will be used on wards now for future analysis.
 
 cycled <- cycle
cycled 

cycled$date <- as.Date(cycled$date, format = "%d-%m-%Y")
cycled

# summarizing into monthly data
library(tidyverse)
install.packages("lubridate")
library(lubridate)
library(dplyr)

cycled$year_month <- floor_date(cycled$date, "month")
cycled

cycled_agg <- cycled %>% 
  group_by(year_month) %>% 
  summarize(classic_count = sum(classic_bike_count),
            electric_count = sum(electric_bike_count),
            docked_count = sum(docked_bike_count),
            classic_len = sum(classic_bike_len),
            electric_len = sum(electric_bike_len),
            docked_len = sum(docked_bike_len),
            member_count = sum(member_ride_count),
            casual_count = sum(casual_ride_count),
            member_len = sum(member_ride_len),
            casual_len = sum(casual_ride_len))

#Now we can see the monthly summary of all variables 
cycled_agg


