/* Query answers: 
- Most Flights Origin Arriving in Las Vegas - Top 10 
- Least Flights Origin Arriving in Las Vegas - Top 10
*/ 
SELECT origin_city_name, origin, COUNT(*) AS total
FROM flights2019
GROUP BY origin_city_name, origin
-- ORDER BY total DESC
ORDER BY total ASC
LIMIT 20;

/* Query answers: 
- Most Delayed Airport Flights Total (in minutes) Arriving in Las Vegas - Top 10 
- Least Delayed Airport Flights Total (in minutes) Arriving in Las Vegas - Top 10
*/ 
SELECT origin_city_name, origin, SUM(arr_delay) AS total_minutes
FROM flights2019
GROUP BY origin_city_name, origin
-- ORDER BY total_minutes DESC 
ORDER BY total_minutes ASC;

/* 
A query to see how many flights came from MSP - Minneapolis, MN since they have the least minutes in late arrivals.
As results shows, I was not disappointed. 
Because MSP had a total of 221 flights, which they had a decent handful of flights comint to Las Vegas. 
Only 22 flights were late for 15 minutes or more. 
About 10% of flights in MSP -> LAS are late for 15+ minutes. 
*/
SELECT COUNT(*)
FROM flights2019
WHERE origin = 'MSP';
SELECT *
FROM flights2019
WHERE origin = 'MSP' and arr_del15 = 1;

/* 
A query to see how many flights came from SFO - San Francisco, CA since they have the most minutes in late arrivals.
Looking at SFO on the other hand... 
SFO flight total counts = 669
SFO late flights total counts = 193
About 29% of flights in SFO -> LAS are late for 15+ minutes.
*/
SELECT COUNT(*)
FROM flights2019
WHERE origin = 'SFO' and arr_del15 = 1;

/* Query answers: 
- Airline Carrier Arrival Counts
*/ 
SELECT op_unique_carrier, COUNT(*) AS total_carriers
FROM flights2019
GROUP BY op_unique_carrier
ORDER BY total_carriers DESC;

/* Query answers: 
- Airline Carrier Delayed Counts
*/ 
SELECT op_unique_carrier, COUNT(*) AS total_delays
FROM flights2019
WHERE arr_delay=1
GROUP BY op_unique_carrier
ORDER BY total_delays DESC;