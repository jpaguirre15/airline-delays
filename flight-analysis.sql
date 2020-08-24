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
/***

Most Flights Origin Arriving in Las Vegas - Top 10
"LAX"	1059
"SFO"	669
"SEA"	593
"DEN"	534
"PHX"	470
"SAN"	399
"OAK"	395
"DFW"	387
"ATL"	372
"ORD"	364

Least Flights Origin Arriving in Las Vegas - Top 10
"GSP"	2
"ATW"	8
"ORF"	8
"PIA"	9
"GFK"	9
"GRI"	9
"MFR"	9
"GTF"	9
"XNA"	9
"SHV"	9
***/ 

/* Query answers: 
- Most Delayed Airport Flights Total (in minutes) Arriving in Las Vegas - Top 10 
- Least Delayed Airport Flights Total (in minutes) Arriving in Las Vegas - Top 10
*/ 
SELECT origin_city_name, origin, SUM(arr_delay) AS total_minutes
FROM flights2019
GROUP BY origin_city_name, origin
-- ORDER BY total_minutes DESC 
ORDER BY total_minutes ASC;
/***

Most Delayed Airport Flights Total (in minutes) Arriving in Las Vegas - Top 10
"SFO"	9079
"LAX"	3578
"ORD"	1966
"DFW"	1437
"CVG"	1422
"SJC"	1387
"MIA"	1379
"PDX"	1374
"SMF"	1161
"BUR"	734

Least Delayed Airport Flights Total (in minutes) Arriving in Las Vegas - Top 10
"MSP"	-3403
"JFK"	-2679
"BWI"	-1489
"MCI"	-1164
"PHL"	-1150
"ATL"	-1140
"SEA"	-1093
"OAK"	-780
"IND"	-763
"DAL"	-749

***/ 

/* 
A query to see how many flights came from MSP - Minneapolis, MN since they have the most minutes in earliest arrivals.
As results shows, I was not disappointed. 
Because MSP had a total of 221 flights, only 22 flights were late
About 10% of flights in MSP -> LAS are late for 15+ minutes. 
*/
SELECT COUNT(*)
FROM flights2019
WHERE origin = 'MSP';
SELECT *
FROM flights2019
WHERE origin = 'MSP' and arr_del15 = 1;