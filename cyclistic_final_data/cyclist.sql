/* The following SQL Unguided project is taken from "Google Data Analytics Professional Certificate"
Capstone project, Datasets of during Sep-20 to Aug-21 has been used.
	Cyclist company is looking to convert it's Casual Bike riders into annual Member Rider which is more profitable
    to the company. The following Queries or Questions all are asked by me to get the deep insight of Data which will used 
    in answering "Marketing Department's" enquiries for making Data derived decision making.*/

/*            Q1. Exploring Data Set 
 The following query will provide glimpse into the complete dataset */
select
	*
from
	cyclist_data
    ORDER BY ride_length ;

/*			Q2. Delete the End time column
	A column has been removed from databse which is no longer required 
    End_time : which provides the data on the date and time riders finished their ride*/
ALTER TABLE cyclist_data 
DROP COLUMN end_time;

/* 			Q3. Summarizing Data Date and Day wise.
 This query aggregates the data Date and Day wise while summarizing the 
 riders total bike riding duration on different bikes */
SELECT
	date_format(start_time, "%Y-%m-%d") AS start_time,
	day,
	SUM(ride_length),
	rider_type,
	bike_type
FROM
	cyclist_data
GROUP BY date_format(start_time, "%Y-%m-%d"), rider_type, bike_type
ORDER BY date_format(start_time, "%Y-%m-%d");

/* Q4. Total Minutes & Hours of Riders 
The following query describes total ride duration for Member and Casual Riders 
in a year during Sep-20 to Aug-21*/

SELECT
	rider_type,
    SUM(ride_length) AS total_minutes,
    ROUND(SUM(ride_length) / 60, 0) AS total_hours
FROM
cyclist_data
GROUP BY rider_type;

/* Q5. Riders total ride length on Each Bikes */
SELECT
	rider_type,
    bike_type,
    SUM(ride_length) AS total_mins,
    SUM(ride_length) / COUNT(rider_type) AS rider_avg_len
FROM
	cyclist_data
GROUP BY rider_type, bike_type
ORDER BY rider_type;


SELECT
	SUM(ride_length)
FROM
cyclist_data
WHERE rider_type = 'casual' AND bike_type = 'classic';

    