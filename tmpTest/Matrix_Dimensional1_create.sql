
-- Dimensional Database schema for the Telecommunications case
-- Created by team Matrix

-- Drop all tables if they exist
DROP TABLE IF EXISTS call_fact CASCADE;
DROP TABLE IF EXISTS date_dim CASCADE;
DROP TABLE IF EXISTS minute_dim CASCADE;
--DROP TABLE IF EXISTS store_dim CASCADE;
DROP TABLE IF EXISTS line_dim CASCADE;
DROP TABLE IF EXISTS cust_dim CASCADE;

-- Customer Dimension
CREATE TABLE cust_dim (
	cust_key				serial		NOT NULL	PRIMARY KEY,
	cust_number					integer,
	cust_firstname				char(30),
	cust_lastname				char(30)
);

-- Date Dimension 
CREATE TABLE date_dim (
    date_key                       		serial  	NOT NULL	PRIMARY KEY,
    date                            		date,
    day_number_in_week              		smallint,   -- sunday = 0, saturday = 6
    day_number_in_calendar_month  		smallint,
    day_number_in_calendar_year    		smallint,
    calendar_week_number_in_year  		smallint,
    calendar_month_number_in_year		smallint,
    calendar_quarter             		char(1),
    calendar_year                		smallint,
    day_of_week                   		char(9),
    calendar_month_name      			char(9),
    full_date_description       		char(20),
    calendar_year_month             		char(7),
    calendar_year_quarter          		char(6)
);

CREATE TABLE minute_dim (
	minute_key			serial NOT NULL PRIMARY KEY,
	time_hourminutes	timestamp		--1440 entries listed as hour:minute:00 not tracking seconds
);

-- Line Dimension
CREATE TABLE line_dim (
	line_key						serial		NOT NULL	PRIMARY KEY,
	line_number						bigint,
	line_description				char(30)
);	

-- Create the Call Log Fact table
-- Grain is one row per call in a call log
CREATE TABLE call_fact (
	-- foreign keys
	call_id					char(5),	-- degenerate dimension
	date_key				integer		references date_dim(date_key),
	cust_key				integer		references cust_dim(cust_key),
	line_key				integer		references line_dim(line_key),
	minute_key				integer		references minute_dim(minute_key),
	-- facts
	call_duration				numeric,
	call_price_perminute		money,
	call_totalcharge			money,
-- primary key
PRIMARY KEY (call_id, line_key)
);
