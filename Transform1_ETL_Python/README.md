Matrix Python Scripts
====================

**Description of each Script**

1. Matrix_calldata_script.py
Creates between 100,000 and 200,000 rows of fake call data for source system
2. Matrix_date_hour_minute_script.py
Creates 1440 rows of data used to insert into our Minute Dimension
3. matrix_Calldata.sql
This is a sample output of the above calldata script
4. matrix_minute_dim_data.sql
This shows the 1440 rows of data used for minute dimension

**Description of ETL**

1. Matrix_Dimensional1_ETL.sql
This file documents our SQL statements that extract data from our source system and load it into our first dimensional model.
The Minute_dimension data should be directly inserted to the dimensional model using the SQL file listed above.

Updated File Links
=======================

** Run files in this order **

