Matrix Dimensional DB Schema (Telecommunication)
===================================================

**Granularity**: The grain is one row per call in a call log

**Details**: We decided to limit our case to only tracking phone calls (no SMS). We the set the grain to be one row (1 unique call) found on a call log for our customers.

**Star Schema**

![](https://github.com/asu-cis-355/matrix/blob/master/matrixStarSchema.jpg)


**SQL Create Statements File Link**

[](https://github.com/asu-cis-355/matrix/blob/master/matrix_dimensional_SQL.sql)
