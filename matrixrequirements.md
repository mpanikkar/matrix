Matrix ER Diagram & Requirements
=================================
**Overview**: This document describes the requirements for a database for a simple telecommunications company similar to AT&T. It only involves the telephone service rather than internet and cable. It includes customers, represenatives, call history, bills and lines which are split into corporate and personal lines.

**Business Rules**

1. Each customer has one representative that works with them. For customer we track customer ID, first name, last name, date of birth, login and password.
2. Each representative can only work for one store at a time and for each representative we track representative ID, first name and last name.
3. Every store must have at least one representative. For each store we track store ID, address, city and state.
4. A representative can work with many different customers.
5. Each customer must have at least one call on record. For each call we keep track of call ID, time of call, duration, location of receiver and location from where the call originated.
6. Each customer must have at least one bill. For bill we track bill ID, total price and date
7. Each customer can have multiple lines connected to it. For Lines we track line ID and telephone number.
8.Each line is a subset of a line type.
9. For each line type, we track the type id, price, data limit, talk limit and text limit.
10. Lines are unique to each customer, they cannot be shared between different customers.
11. Each customer may have several lines attached to him/her. He/she will be allowed to add lines at any point of time

**ER Diagram**

![](https://github.com/asu-cis-355/matrix/blob/master/matrixERD.jpg)