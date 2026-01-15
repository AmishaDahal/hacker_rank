/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the 

+-------------+--------------+
| Field       | Type         |
+-------------+--------------+
| employee_id  | Integer     |
| name         | String      |
| month        | Integer     |
| salary       |Integer      |
+-------------+--------------+
*/

select name
from Employee
order by name asc;
