--•	Create a new database named "CompanyDB."
--•	Create a schema named "Sales" within the "CompanyDB" database.
--•	Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.
--Note: on employee_id use squence NOT identity.
--•	Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
--•	If you want to Add mock data test use 
CREATE DATABASE CompanyDB

CREATE SCHEMA SALES
GO

CREATE TABLE SALES.EMPLOYEES
(
  ID INT DEFAULT NEXT VALUE FOR SALES.I,
  FNAME VARCHAR(50),
  LNAME VARCHAR(50),
  SALARY DEC
)

CREATE SEQUENCE SALES.I
 AS INT
 START WITH 1
 INCREMENT BY 1

 ALTER TABLE SALES.EMPLOYEES 
 ADD hire_date DATETIME

 --INSERTED DUMMY DATA.
 -----------------------------------------START DATA MANIPULATION-------------------------------------

 --•	Select all columns from the "employees" table.
 SELECT *
 FROM SALES.EMPLOYEES
--•	Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT FNAME , LNAME
FROM SALES.EMPLOYEES
--•	Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
SELECT FNAME + ' '+ LNAME AS 'FULL NAME'
FROM SALES.EMPLOYEES
--•	Show the average salary of all employees.
SELECT AVG(SALARY) AS 'AVERAGE SALARY'
FROM SALES.EMPLOYEES 
--•	Select employees whose salary is greater than 50000.
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY > 5000
--•	Retrieve employees hired in the year 2020.
SELECT *
FROM SALES.EMPLOYEES
WHERE YEAR(HIRE_DATE) = 2020
--•	List employees whose last names start with 'S.'
SELECT *
FROM SALES.EMPLOYEES
WHERE LNAME
LIKE 'S%'
--•	Display the top 10 highest-paid employees.
SELECT *
FROM SALES.EMPLOYEES
ORDER BY SALARY DESC 
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY
--•	Find employees with salaries between 40000 and 60000.
SELECT * 
FROM SALES.EMPLOYEES
WHERE SALARY > 40000 AND SALARY < 60000
--•	Show employees with names containing the substring 'man.'
SELECT *
FROM SALES.EMPLOYEES
WHERE FNAME
LIKE '%MAN%' 
OR 
LNAME LIKE '%MAN%'
--•	Display employees with a NULL value in the "hire_date" column.
SELECT *
FROM SALES.EMPLOYEES
WHERE HIRE_DATE = NULL
--•	Select employees with a salary in the set (40000, 45000, 50000).
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY 
IN(40000,45000,50000)
--•	Retrieve employees hired between '2020-01-01' and '2021-01-01.'
SELECT *
FROM SALES.EMPLOYEES
WHERE 
YEAR(HIRE_DATE) IN(2020,2021) 
AND 
MONTH(HIRE_DATE) IN(01,01)
AND
DAY(HIRE_DATE) IN(01,01)
--•	List employees with salaries in descending order.
SELECT *
FROM SALES.EMPLOYEES
ORDER BY SALARY DESC
--•	Show the first 5 employees ordered by "last_name" in ascending order.
SELECT *
FROM SALES.EMPLOYEES
ORDER BY LNAME 
OFFSET 0 ROWS
FETCH FIRST 5 ROWS ONLY 
--•	Display employees with a salary greater than 55000 and hired in 2020.
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY > 55000
AND 
YEAR(HIRE_DATE) = 2020
--•	Select employees whose first name is 'John' or 'Jane.'
SELECT *
FROM SALES.EMPLOYEES
WHERE FNAME = 'John'
or
FNAME = 'Jane'
--•	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY <= 55000
AND
YEAR(HIRE_DATE) >= 2022
AND 
MONTH(HIRE_DATE) >= 01
AND
DAY(HIRE_DATE) > 01
--•	Retrieve employees with a salary greater than the average salary.
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY > (SELECT AVG(salary) FROM SALES.EMPLOYEES)
--•	Display the 3rd to 7th highest-paid employees.
SELECT *
FROM SALES.EMPLOYEES
ORDER BY SALARY DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY
--•	List employees hired after '2021-01-01' in alphabetical order.
SELECT *
FROM SALES.EMPLOYEES
WHERE YEAR(HIRE_DATE) >= 2021
AND 
MONTH(HIRE_DATE) >= 01
AND
DAY(HIRE_DATE) > 01
ORDER BY FNAME 
--•	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY > 50000
AND
LNAME NOT LIKE 'A%'
--•	Display employees with a salary that is not NULL.
SELECT *
FROM SALES.EMPLOYEES
WHERE SALARY != NULL
--•	Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT *
FROM SALES.EMPLOYEES
WHERE( FNAME
LIKE '%e%'
or FNAME
LIKE '%I%')
AND 
SALARY > 45000