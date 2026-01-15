/*
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
Given a City table, whose fields are described as

+-------------+----------+
| Field       | Type     |
+-------------+----------+
| ID          | Number   |
| Name        | Char(35) |
| CountryCode | Char(3)  |
| District    | Char(20) |
| Population  | Number   |
+-------------+----------+

you have to print all the details of all the cities of Japan. The CountryCode for Japan is "JPN".
*/

select *
from CITY
where COUNTRYCODE='JPN';

