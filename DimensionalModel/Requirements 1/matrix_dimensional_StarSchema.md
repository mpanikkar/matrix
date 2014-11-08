Matrix Dimensional DB Schema (Telecommunication)
===================================================

**Granularity**: The grain is one row per call in a call log

**Details**: We decided to limit our case to only tracking phone calls (no SMS). We the set the grain to be one row (1 unique call) found on a call log for our customers.

**Star Schema**

![](https://github.com/asu-cis-355/matrix/blob/master/DimensionalModel/Requirements%201/matrix_dimensional1_starschema.jpg)


**SQL Create Statements File Link**

[SQL Creaate statements for first Dimensional Model](Matrix_Dimensional1_create.sql)
