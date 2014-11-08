# Created by: Team Matrix
# Python script
# Insert statements for minute_dimension

f = open("matrix_minute_dim_data.sql", "w")

# sample row:   5:20	-->	5:20AM
#				17:20	-->	5:20PM

minute = 0
hour = 0

for i in range(1440):
	# populate minute_dim with the format hh:mm
	if (minute <= 59):
			sql = "INSERT INTO minute_dim (time_hourminutes) VALUES ('" + \
			str(hour) + ":" + str(minute) + "');\n"
	else:
		hour = hour + 1
		minute = 0
		sql = "INSERT INTO minute_dim (time_hourminutes) VALUES ('" + \
			str(hour) + ":" + "0');\n"
	minute = minute + 1
	
	f.write(sql)
	
			
f.close()
