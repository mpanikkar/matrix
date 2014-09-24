Matrix Sample Insert Statements and Test Query
=================================

**Insert Statements**

insert into store (store_street, store_city, store_state)
	VALUES ('123 Maplestreet', 'Scottsdale', 'AZ');

insert into representative (rep_firstname, rep_lastname, store_id)
	VALUES ('Joe', 'Smith', 1);
	
insert into representative (rep_firstname, rep_lastname, store_id)
	VALUES ('William', 'House', 1);
	
insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Alex', 'Neumann', '1994-03-10', 'ANeumann', 'Test123', 2);
	
insert into customer (cust_firstname, cust_lastname, cust_dob, cust_login, cust_password, rep_id)
	VALUES ('Tony', 'Stark', '1985-05-15', 'Ironman', 'stark123', 2);
	
insert into line_type (line_price, line_datalimit, line_talklimit, line_textlimit)
	VALUES (100, 500, 9999, 1000);
	
insert into line_type (line_price, line_datalimit, line_talklimit, line_textlimit)
	VALUES (50, 300, 9999, 500);

insert into line (line_number, type_id, cust_id)
	VALUES (4806974124, 1, 1);
	
insert into line (line_number, type_id, cust_id)
	VALUES (6045491988, 2, 1);
	
insert into line (line_number, type_id, cust_id)
	VALUES (4804148989, 1, 2);

insert into line (line_number, type_id, cust_id)
	VALUES (4801234567, 1, 2);
	
insert into call (call_time, call_duration, call_to, call_from, line_id)
	VALUES ('2014-09-12', 9, '4805679999', '4806974124', 1);

insert into call (call_time, call_duration, call_to, call_from, line_id)
	VALUES ('2014-09-14', 20, '6025558787', '4806974124', 1);
	
insert into bill (bill_total_price, bill_date, cust_id)
	VALUES (250, '2014-05-02', 1);
insert into bill (bill_total_price, bill_date, cust_id)
	VALUES (50, '2014-06-03', 1);
	
	
TESTS

/* Test: Make sure that each representative can have more than one customer
Expected Result: Two customers with the same rep_id */
select * from customer

/* Test: show that each customer can have multiple lines.
Expected Result: same cust_id should be linked to two lines. */
select * from line

/* Test: Some customers have multiple calls on record, while others have no calls
Expected Result: One customer with two calls while the customer with 0 calls is not displayed */
select C.cust_id, C.cust_firstname, Ca.call_time, Ca.call_to, Ca.call_from, Ca.line_id
FROM customer C, call Ca, line L
WHERE C.cust_id = L.cust_id
	AND L.line_id = Ca.line_id;

/* Test: Each customer can have multiple lines of the same TYPE.
Expected Result: Same customer_id showing for two lines of the same type */
select * from line
where cust_id = 2;
