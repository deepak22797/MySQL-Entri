use country_details;

#1. find the number of persons in each country.
select  Country_name as Country, count(*) as NumberOfPersons from Persons group by Country_Name; 

#2. find the number of persons in each country sorted from high to low.
select  Country_name as Country, count(*) as NumberOfPersons from Persons group by Country_Name order by NumberOfPersons desc; 

#3. find out an average rating for persons in respective countries if the average is greater than 3.0.
select Country_name as Country, avg(Rating) as AverageRating from Persons group by Country_Name 
having AverageRating > 3.0 ;

#4. find the countries with the same rating as the USA (using subqueries)
select Country_name as Country from Persons
where Rating = (select Rating from Persons where Country_name = 'USA');

#5. select all countries whose population is greater than the average population of all nations.
select Country_name as Country from Country where Population > (select avg(Population) from Country);

# Create a database named Product and create a table called Customer 
create database Product;

use Product;

create table Customer (
    Customer_Id int primary key,
    First_name varchar(50),
    Last_name varchar(50),
    Email varchar(100),
    Phone_no varchar(15),
    Address varchar(255),
    City varchar(100),
    State varchar(50),
    Zip_code varchar(10),
    Country varchar(50)
);

#inserting some data to the table Product.
-- Insert data into Customer table
insert into Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
values 
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Springfield', 'Illinois', '62701', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Elm St', 'Madison', 'Wisconsin', '53703', 'USA'),
(3, 'Carlos', 'Garcia', 'carlos.garcia@example.com', '1112223333', '789 Oak St', 'Austin', 'Texas', '73301', 'USA'),
(4, 'Maria', 'Hernandez', 'maria.hernandez@example.com', '2223334444', '101 Pine St', 'Seattle', 'Washington', '98101', 'USA'), 
(5, 'Amit', 'Kumar', 'amit.kumar@example.com', '3334445555', '202 Maple St', 'Kochi', 'Kerala', '682001', 'India'), 
(6, 'Wei', 'Li', 'wei.li@example.com', '4445556666', '303 Birch St', 'Beijing', 'Beijing', '100000', 'China');

insert into Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
values (7, 'Cathy', 'Hernandez', 'Cathy.hernandez@example.com', '2223334444', '101 Pine St', 'San Jose', 'California', '98101', 'USA');

#1.Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
create view customer_info as 
select concat(First_name, ' ' , Last_name) as FullName, Email from Customer;

#viewing customer_info
select * from customer_info;

#2.Create a view named US_Customers that displays customers located in the US.  
create view US_Customers as
select *
from Customer
where Country = 'USA';

#viewing US_Customers
select * from US_Customers;

#3.Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
create view Customer_details as
select concat(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
from Customer;

#viewing Customer_details
select * from Customer_details;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;


#4.Update phone numbers of customers who live in California for Customer_details view.
update Customer 
set Phone_no = '9898989892' 
where State = 'California';

#5.Count the number of customers in each state and show only states with more than 5 customers.
select State, count(*) as NoOfCustomers from Customer group by State 
having count(*) > 5 ; 

#6.Query that will return the number of customers in each state, based on the "state" column in the customer_details view.
select State,count(*) as NoOfCustomers from Customer_details group by State; 

#7.Query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from Customer_details order by State asc; 

