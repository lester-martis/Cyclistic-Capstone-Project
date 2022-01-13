
##### EDA : Google Capstone Project (Cyclistic)####
# The following EDA is done using Capstone project from Google Data Analysis 
# Professional Certificate : Cyclistic Datasets with 4.6 Million Rows of Data.
    # Overview of Case-Study: The director of Marketing believes the company's
    # future success depends on maximizing the number of annual memberships.
    # Therefore need to understand how Casual and annual members use Cyclistic
    # Bikes differently. So they need insights of the datasets to make
    # Data Driven decisions.

        
#### Installing Packages ####

install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
install.packages("data.table")
library(data.table)
install.packages("scales")
library(scales)


#### Format Data class a Data Table ####  
cyclistic <- as.data.table(cyclist_data)



#### No. of Rides of Bikers on different Bikes,#### 
  #arranged in High to low counts.


cyclistic[, .(total_rides =.N), 
          by = .(rider_type, bike_type)][order(-total_rides)]


#### Duration of Bikers on different Bikes (In Hours)####
  #arranged in High to low duration.

Total_Hrs <- cyclistic[, .(ride_dur_hrs = (sum(ride_length)/60)),
          by = .(rider_type, bike_type)][order(-ride_dur_hrs)]



#### First and last ride for each rider and bike.####

cyclistic[order(start_time), .(start_time = start_time[c(1, .N)]),
          by = .(rider_type, bike_type)][order(rider_type)]



#### Total No. Rides by Each  Rider and Bikes every month ####

rider_bikes <-cyclistic[, .(total_rides = .N), by = .(month_year = format(start_time, "%Y-%b"),
                                       rider_type, bike_type)][order(month_year)]
View(rider_bikes)

      ## Bikes Rides over the time Plot The Bar ##
ggplot(rider_bikes, aes(x = month_year, y = total_rides, fill = bike_type))+
  geom_col()+xlab("Month_Year")+ylab("No.of Rides")+
  theme(legend.position = c(0.3, 0.8))+
  scale_y_continuous(labels = comma)

ggplot(rider_bikes, aes(x = month_year, y = total_rides, fill = rider_type))+
  geom_col()+xlab("Month_Year")+ylab("No.of Rides")+
  theme(legend.position = c(0.3, 0.8))+
  scale_y_continuous(labels = comma)


#### Bar plot : No. of Rides by riders on different Bikes####

ggplot(cyclistic, aes(bike_type, fill = rider_type))+
  geom_bar()+
  xlab("Bikes")+ylab("No.of Rides")+
  theme(axis.title = element_text(color = "Blue"))




