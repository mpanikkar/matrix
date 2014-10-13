
-- Dimensional Database schema for the Telecommunications case
-- Created by team Matrix

-- Drop all tables if they exist
DROP TABLE IF EXISTS call_fact CASCADE;
DROP TABLE IF EXISTS date_dim CASCADE;
DROP TABLE IF EXISTS store_dim CASCADE;
DROP TABLE IF EXISTS line_dim CASCADE;
DROP TABLE IF EXISTS customer_dim CASCADE;

-- Store Dimension
CREATE TABLE store_dim (
	store_key				serial	NOT NULL	PRIMARY KEY,
	store_number			smallint,
	store_street			char(30),
	store_city				char(30),
	store_state				char(2),
	store_zipcode			char(6),
	store_region			char(15),
	store_representative	char(30)
);

-- Customer Dimension
CREATE TABLE cust_dim (
	cust_key			serial		NOT NULL		PRIMARY KEY,
	cust_firstname		char(30),
	cust_lastname		char(30),
	cust_dateofbirth		date,
	cust_login			char(15),
	cust_password		char(15),
	cust_joindate			date
);

-- Date Dimension 
CREATE TABLE date_dim (
    date_key                       		serial      NOT NULL    PRIMARY KEY,
    date                            	date,
    day_number_in_week              	smallint,   -- sunday = 0, saturday = 6
    day_number_in_calendar_month  		smallint,
    day_number_in_calendar_year    		smallint,
    calendar_week_number_in_year  		smallint,
    calendar_month_number_in_year		smallint,
    calendar_quarter             		char(1),
    calendar_year                		smallint,
    day_of_week                   		char(9),
    calendar_month_name      			char(9),
    full_date_description       		char(20),
    calendar_year_month             	char(7),
    calendar_year_quarter          		char(6)
);

-- Line Dimension
CREATE TABLE line_dim (
	line_key			serial		NOT NULL		PRIMARY KEY,
	line_number			bigint,
line_description		char(30),
line_price				int,
line_datalimit			int,
line_talklimit			int,
line_textlimit			int
);

-- Create the Call Log Fact table
-- Grain is one row per call in a call log
CREATE TABLE call_fact (
	-- foreign keys
	date_key			integer		references date_dim(date_key),
	store_key			integer		references store_dim(store_key),
	cust_key			integer		references cust_dim(cust_key),
	line_key			integer		references line_dim(line_key),
	call_id				integer,	-- degenerate dimension
	-- facts
	call_duration				numeric,
	call_perminutecharge		money,
	call_totalcharge			money,
	call_totalcharge_tax		money,
-- primary key
PRIMARY KEY (call_id, line_key)
);
