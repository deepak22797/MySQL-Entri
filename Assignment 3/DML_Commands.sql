#creating database#
create database manager_details;

#using database
use manager_details;

#creating table#
create table managers(
Manager_Id int primary key,
First_name char(20) not null,
Last_name char(20) not null,
DOB date,
Age int check(Age > 0),
Last_update timestamp,
Gender char(1),
Department varchar(30),
Salary decimal(10,2) not null
);

#inserting 10 rows to the table managers
insert into managers (Manager_Id, First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary) values
(1, 'John', 'Doe', '1980-01-01', 44, NOW(), 'M', 'IT', 30000),
(2, 'Jane', 'Smith', '1985-05-12', 39, NOW(), 'F', 'HR', 28000),
(3, 'Robert', 'Brown', '1978-07-21', 46, NOW(), 'M', 'Finance', 32000),
(4, 'Emily', 'Davis', '1990-03-14', 34, NOW(), 'F', 'IT', 26000),
(5, 'Michael', 'Johnson', '1982-09-09', 42, NOW(), 'M', 'Marketing', 27000),
(6, 'Aaliya', 'Ahmed', '1987-11-23', 36, NOW(), 'F', 'IT', 25000),
(7, 'Linda', 'Lee', '1979-02-28', 45, NOW(), 'F', 'Finance', 29000),
(8, 'David', 'Clark', '1986-06-30', 38, NOW(), 'M', 'HR', 24000),
(9, 'James', 'Harris', '1983-10-05', 41, NOW(), 'M', 'Marketing', 35000),
(10, 'Patricia', 'Martinez', '1992-08-19', 32, NOW(), 'F', 'IT', 27500);

#retrieving the name and dob of the manager with manager_id =1
select First_name, Last_name, DOB
from managers
where Manager_Id = 1;

#displaying the annual income of all the managers
select First_name, Last_Name, (Salary * 12) 
as Annual_Income
from managers;

#displaying all managers details except Aaliya
select *
from managers
where First_name != 'Aaliya';

#displaying  the details of managers whose department is IT and earns more than 25000 per month
select *
from managers
where Department = 'IT' and Salary > 25000;

#displaying the details of managers whose salary is between 10000 and 35000
select *
from Managers
where Salary between 10000 and 35000;




