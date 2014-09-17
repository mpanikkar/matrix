Matrix ER Diagram & Requirements
=================================
**Overview**: This document describes the requirements for a database for a simple telecommunications company similar to AT&T. It only involves the telephone service rather than internet and cable. It includes customers, represenatives, call history, bills and lines which are split into corporate and personal lines.

**Business Rules**
1. Each customer has one representative that works with them. For customer we track customer ID, first name, last name and date of birth.
2. Each representative can only work for one store at a time and for each representative we track representative ID, first name and last name.
3. Every store must have at least one representative. For each store we track store ID, address, city and state.
4. A representative can work with many different customers.
5. A customer can have several accounts.
6. For each customer account we track account ID, login and password.
7. Each account must have at least one call on record. For each call we keep track of call ID, time of call, duration, location of receiver and location from where the call originated.
8. An account must have at least one bill. For bill we track bill ID, total price and date
9. Each account can have multiple lines connected to it. For Lines we track line ID, telephone number and line type
10. We offer two separate line types, a corporate line and a personal line
11. For each line we track the price, data limit, talk limit and text limit.
12. A line can either be a corporate or personal line, but it cannot be both.
13. We are only offering these two types of lines and do not track any others.
14. Lines are unique to specific accounts, they cannot be shared between accounts of the same customer.
15. Each account may have several personal or corporate lines attached to it. They are not required to have one of each before being able to add a second of either type

**ER Diagram**