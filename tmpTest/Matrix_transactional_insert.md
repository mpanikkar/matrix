insert into store (store_street, store_city, store_state, store_region, store_zipcode)
	VALUES ('123 Maplestreet', 'Scottsdale', 'AZ', 'North Region', '85259');

insert into representative (rep_firstname, rep_lastname, store_id)
	VALUES ('Joe', 'Smith', 1);
	
insert into representative (rep_firstname, rep_lastname, store_id)
	VALUES ('William', 'House', 1);
	
insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Alex', 'Neumann', '1994-03-10', 'ANeumann', 'Test123', 2);
	
insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Tony', 'Stark', '1985-05-15', 'Ironman', 'stark123', 2);
	
insert into line_type (line_description, line_price_perminute)
	VALUES ('Base Package', .45);
	
insert into line_type (line_description, line_price_perminute)
	VALUES ('Premium Package', .42);
	
insert into line_type (line_description, line_price_perminute)
	VALUES ('Ultimate Package', .40);

insert into line (line_number, type_id, cust_id)
	VALUES (4806974124, 1, 1);
	
insert into line (line_number, type_id, cust_id)
	VALUES (6045491988, 2, 1);

insert into line (line_number, type_id, cust_id)
	VALUES (4802529999, 3, 1);
	
insert into line (line_number, type_id, cust_id)
	VALUES (4804148989, 1, 2);

insert into line (line_number, type_id, cust_id)
	VALUES (4801234567, 2, 2);
	
insert into calls (call_date, call_time, call_duration, call_from, call_to, line_id)
	VALUES ('2014-09-22', '2012-01-01 11:34:00', 4, 4806974124, 4805888999, 1);

insert into calls (call_date, call_time, call_duration, call_from,  call_to, line_id)
	VALUES ('2014-09-12', '2012-01-01 07:40:00', 9, 6045491988, 4805679999, 2);
	
insert into bill (bill_total_price, bill_date, cust_id)
	VALUES (250, '2014-05-02', 1);
	
insert into bill (bill_total_price, bill_date, cust_id)
	VALUES (50, '2014-06-03', 1);
	

