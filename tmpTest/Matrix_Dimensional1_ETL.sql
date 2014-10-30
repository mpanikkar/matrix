insert into date_dim (date, day_number_in_week, day_number_in_calendar_month,
                      day_number_in_calendar_year, calendar_week_number_in_year, 
                      calendar_month_number_in_year, calendar_quarter, calendar_year, 
                      day_of_week, calendar_month_name, full_date_description,
                      calendar_year_month, calendar_year_quarter )

	SELECT 
        -- 'extract' and 'to_char' are powerful Postgres functions for manipulating dates
        d as date,
        extract(dow from d) as day_number_in_week,
        extract(day from d) as day_number_in_calendar_month,
        extract(doy from d) as day_number_in_calendar_year,
        extract(week from d) as calendar_week_number_in_year,
        extract(month from d) as calendar_month_number_in_year,
        extract(quarter from d) as calendar_quarter,
        extract(year from d) as calendar_year,
        to_char(d,'Day') as day_of_week,
        to_char(d,'Month') as calendar_month_name,
        to_char(d,'MonthDD, YYYY') as full_date_description,
        to_char(d,'YYYY-MM') as calendar_year_month,
        to_char(d,'YYYY-Q') as calendar_year_quarter
	-- this line creates a temporary table with one column, "d", containing dates
	FROM (select date(generate_series(DATE '20120101', DATE '20141231', interval '1' day)) as d) as daterange;
	
insert into cust_dim (cust_number, cust_firstname, cust_lastname)

	SELECT
	cust_id AS cust_number,
	cust_firstname AS cust_firstname,
	cust_lastname AS cust_lastname
	FROM customer;

	
insert into line_dim (line_number, line_description)
			
	SELECT
	line_number AS line_number,
	line_description AS line_description
	FROM line_type, line
	WHERE line_type.type_id = line.type_id;

	
insert into minute_dim (time_hourminutes)
select * FROM generate_series('2012-01-01 00:00'::timestamp, '2012-01-01 23:59', interval '1' minute);

		
INSERT INTO call_fact

		SELECT
		-- dimension keys
		CS.call_id AS call_id,
		(SELECT date_key FROM date_dim WHERE date=call_date) AS date_key,
		(SELECT cust_key FROM cust_dim CD WHERE CD.cust_number=C.cust_id) AS cust_key,
		(SELECT line_key FROM line_dim LD WHERE LD.line_number=CS.call_from) AS line_key,
		(SELECT minute_key FROM minute_dim MD WHERE MD.time_hourminutes=CS.call_time) AS minute_key,
		-- fact columns
		CS.call_duration AS call_duration,
		(SELECT line_price_perminute FROM line_type WHERE L.type_id = line_type.type_id) AS call_price_perminute,
		((SELECT line_price_perminute FROM line_type WHERE L.type_id = line_type.type_id) *CS.call_duration) AS call_total_charge
	FROM	calls CS , customer C, line L
			WHERE CS.line_id = L.line_id
			AND	L.cust_id = C.cust_id

		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
