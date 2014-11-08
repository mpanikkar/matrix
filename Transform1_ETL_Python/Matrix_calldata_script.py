# Created by: Team Matrix
# Python script
# Insert statements for line and calls transactional table

# list of acceptable customer IDs 1-10
custlist = list(range(1,11))

linetype = [1,2,3]

# number of phone line
phonenum = 4801110000

# number of call receiver
validnum = list(range(4808880000, 4809999999))

# first valid line id, data type is serial in our table
first_valid_line_id = 1

import random

#"matrix_Calldata.sql"
# write code to file
f = open("matrix_Calldata.sql", "w")

for i in range(200):
	# create a new line
	phonenum = phonenum + 1
	chosenLineid = random.choice(linetype)
	sql = "INSERT INTO line (line_number, type_id, cust_id) \n\t VALUES (" + \
		str(phonenum) + ", " + \
		str(chosenLineid) + ", " + \
		str(random.choice(custlist)) + ");\n"
	f.write(sql)

	#now create a random number of calls for each line
	num_calls = random.randint(500, 1000)	#500 to 1000 calls per line
	for j in range(num_calls):
		order_day = random.randint(1,28)
		order_month = random.choice(["01","02","03","04","05","06","07","08","09","10","11","12"])
		order_year = "2014"
		order_date = order_year + "-" + order_month + "-" + str(order_day)
		call_hour = random.randint(0,23)
		call_minute = random.randint(0, 59)
		call_time = str(call_hour) + ":" + str(call_minute)
		call_duration = random.randint(1,15)
		sql = "INSERT INTO calls (call_date, call_time, call_duration, call_from, call_to, line_id) \n\t VALUES ('" + \
			order_date + "', " + "'" + \
			call_time + "', " + \
			str(call_duration) + ", " + \
			str(phonenum) + ", " + \
			str(random.choice(validnum)) + ", " + \
			str(first_valid_line_id) + ");\n"
		f.write(sql)
	first_valid_line_id = first_valid_line_id + 1			
f.close()
			
		
	
	