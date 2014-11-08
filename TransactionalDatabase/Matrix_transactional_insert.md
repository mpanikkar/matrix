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
	
insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Albert', 'Einstein', '1965-09-22', 'albert', 'math', 1);

insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('John', 'Smith', '1945-03-03', 'Smith', 'smith123', 1);
	
insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Tod', 'Baker', '1967-02-12', 'Tbaker', 'baker123', 1);

insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('John', 'Snow', '1990-01-15', 'snow', 'north123', 1);

insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Sally', 'Renolds', '1977-06-21', 'srenolds', 'sally123', 2);

insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Emily', 'White', '1990-03-02', 'emilyw', 'emily123', 1);

insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Trevor', 'Williams', '1989-09-10', 'trevorw', 'trevor123', 1);

insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Sam', 'Jackson', '1970-08-24', 'samj', 'sam123', 2);
	
insert into line_type (line_description, line_price_perminute)
	VALUES ('Base Package', .45);
	
insert into line_type (line_description, line_price_perminute)
	VALUES ('Premium Package', .42);
	
insert into line_type (line_description, line_price_perminute)
	VALUES ('Ultimate Package', .40);

insert into bill (bill_total_price, bill_date, cust_id)
	VALUES (250, '2014-05-02', 1);
	
insert into bill (bill_total_price, bill_date, cust_id)
	VALUES (50, '2014-06-03', 1);
	

