CREATE TABLE Public."flights2019"(
	year int,
	month int,
	day_of_month int,
	day_of_week int,
	op_unique_carrier varchar(100),
	tail_num varchar(100),
	origin varchar(100),
	origin_city_name varchar(100),
	dest varchar(100),
	dest_city_name varchar(100),
	arr_time int,
	arr_delay int,
	arr_delay_new int,
	arr_del15 int,
	carrier_delay int,
	weather_delay int,
	nas_delay int,
	security_delay int,
	late_aircraft_delay int 
);

COPY Public."flights2019"
FROM 'D:\DataUploads\LAS_delays_January2019.csv'
DELIMITER ','
CSV HEADER ;