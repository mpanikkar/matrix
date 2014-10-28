Matrix Dimensional Periodic Snapshot (Telecommunication)
===================================================


**Granularity**: The grain is one row per calls a day

**Details**: We decided to limit our case to only tracking phone calls (no SMS). We the set the grain to be one row (1 unique call) found on a call log for our customers.

**Periodic Snapshot Fact Table**:

![](https://raw.githubusercontent.com/asu-cis-355/matrix/master/DimensionalModel/Requirements%202/periodicSnapshot.png)

**Enterprise Bus Matrix**


The most trivial conformed dimensions used was the date dimension. In other business processes, we find that the Customers and Store dimensions can be re-used.

![](https://raw.githubusercontent.com/asu-cis-355/matrix/master/DimensionalModel/Requirements%202/Enterprise%20Bus%20Matrix.jpg)
