-- Matrix Group
-- Alex Neumann
-- Lim Zhang
-- Lucas Cruz

DROP TABLE IF EXISTS calls CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS line_type CASCADE;
DROP TABLE IF EXISTS store CASCADE;
DROP TABLE IF EXISTS line CASCADE;
DROP TABLE IF EXISTS representative CASCADE;
DROP TABLE IF EXISTS bill CASCADE;

-- Store Table

create table store(
store_id				serial		not null	unique,
store_street			varchar(20)	not null,
store_city				varchar(20)	not null,
store_state				char(2)		not null,
store_region			varchar(20),
store_zipcode			char(6),
primary key (store_Id)
);

-- Representative Table
create table representative(
rep_id					serial		not null	unique,
rep_firstname			varchar(20)	not null,
rep_lastname			varchar(20)	not null,
store_id				int		not null,
primary key(rep_id),
foreign key(store_id) references store(store_Id)
);

-- Customer Table
create table customer(
cust_id 				serial		not null  unique,
cust_firstname			varchar(20)	not null,
cust_lastname			varchar(20)	not null,
cust_dob				date		not null,
cust_login				varchar(20)	not null,
cust_password			varchar(20)	not null,
rep_id					int			not null,
primary key(cust_id),
foreign key(rep_id) references representative(rep_id)
);

-- Line Type Table
create table line_type(
type_id					serial	not null	unique,
line_description		varchar(25),
line_price_perminute	money,
primary key(type_id)
);

-- Line Table
create table line(
line_id					serial	not null	unique,
line_number				bigint	not null,
type_id					int	not null,
cust_id					int	not null,
primary key(line_id),
foreign key(type_id) references line_type(type_id),
foreign key(cust_id) references customer(cust_id)
);

-- Call Table
create table calls(
call_id					serial		not null	unique,
call_date				date	not null,
call_time				timestamp 	not null,
call_duration			int		default 0,
call_from				bigint not null,
call_to					bigint	not null,
line_id					int			not null	references line(line_id),
primary key(call_id)
);

-- Bill Table
CREATE TABLE bill
(
bill_id					serial		not null 	unique,
bill_total_price		money		not null,
bill_date				date		not null,
cust_id					int		not null,
primary key(bill_id),
foreign key(cust_id) references customer(cust_id)
);







