﻿-- Matrix Group
-- Alex Neumann
-- Lim Zhang
-- Lucas Cruz






drop table if exists bill;
drop table if exists call;
drop table if exists line;
drop table if exists line_type;
drop table if exists customer;
drop table if exists representative;
drop table if exists store;

-- Store Table

create table store(
store_id	serial		not null	unique,
store_street	varchar(20)	not null,
store_city	varchar(20)	not null,
store_state	char(2)		not null,
primary key (store_Id)
);

-- Representative Table
create table representative(
rep_id		serial		not null	unique,
rep_firstname	varchar(20)	not null,
rep_lastname	varchar(20)	not null,
store_id	int		not null,
primary key(rep_id),
foreign key(store_id) references store(store_Id)
);

-- Customer Table
create table customer(
cust_id 	serial		not null  unique,
cust_firstname	varchar(20)	not null,
cust_lastname	varchar(20)	not null,
cust_dob	date		not null,
cust_login	varchar(20)	not null,
cust_password	varchar(20)	not null,
rep_id		int	not null,
primary key(cust_id),
foreign key(rep_id) references representative(rep_id)
);
-- Line Type Table
create table line_type(
type_id		serial	not null	unique,
line_price	int	not null,
line_datalimit	int	not null,
line_talklimit	int	not null,
line_textlimit	int	not null,
primary key(type_id)
);
-- Line Table
create table line(
line_id		serial	not null	unique,
line_number	bigint	not null,
type_id		int	not null,
cust_id		int	not null,
primary key(line_id),
foreign key(type_id) references line_type(type_id),
foreign key(cust_id) references customer(cust_id)
);


-- Call Table
create table call(
call_id		serial	not null	unique,
call_time	date	not null,
call_duration	int	not null,
call_to		varchar(20)	not null,
call_from	varchar(20)	not null,
line_id		int	not null,
primary key(call_id),
foreign key(line_id) references line(line_id)
);

-- Bill Table
CREATE TABLE bill
(
bill_id			serial		not null 	unique,
bill_total_price	money		not null,
bill_date		date		not null,
cust_id			int		not null,
primary key(bill_id),
foreign key(cust_id) references customer(cust_id)
);






