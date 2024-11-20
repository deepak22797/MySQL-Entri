#creating database
create database country_details;

#using database
use country_details;

#creating table country
create table Country(
Id int primary key,
Country_name varchar(50),
Population bigint,
Area float
);

#creating table Persons
create table Persons(
Id int primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
Population bigint,
Rating float, 
Country_id int,
Country_name varchar(50),
foreign key (Country_id) references Country(Id)
);

# inserting data to the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 37740000, 9984670),
(3, 'UK', 67860000, 243610),
(4, 'Australia', 25690000, 7692024),
(5, 'India', 1393409038, 3287263),
(6, 'Brazil', 213993437, 8515767),
(7, 'China', 1444216107, 9596961),
(8, 'Russia', 145912025, 17098246),
(9, 'Germany', 83240525, 357022),
(10, 'Japan', 125960000, 377975);

#inserting data to the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 37740000, 4.2, 2, 'Canada'),
(3, 'Emily', 'Jones', 67860000, 4.8, 3, 'UK'),
(4, 'Michael', 'Brown', 25690000, 4.0, 4, 'Australia'),
(5, 'Rahul', 'Sharma', 1393409038, 3.9, 5, 'India'),
(6, 'Alice', 'Johnson', 213993437, 4.1, 6, 'Brazil'),
(7, 'Chang', 'Li', 1444216107, 4.9, 7, 'China'),
(8, 'Igor', 'Petrov', 145912025, 4.6, 8, 'Russia'),
(9, 'Hans', 'Schmidt', 83240525, 3.8, 9, 'Germany'),
(10, 'Sato', 'Tanaka', 125960000, 4.3, 10, 'Japan');

#Listing the distinct country names from the Persons table
select distinct Country_name from Persons;

#selcting first names and last names from the Persons table with aliases
select Fname as "First Name", Lname as "Last Name" from Persons;

#finding all persons with a rating greater than 4.0
select Fname, Lname, Rating from Persons where Rating > 4.0;

#finding countries with a population greater than 10 lakhs
select Country_name from Country where Population > 1000000;

#finding persons who are from USA or having a rating greater than 4.5
select concat(Fname,' ', Lname) as Name from Persons where Country_name = "USA" or Rating > 4.5;

#finding all persons where the country name is null
select concat(Fname, " ", Lname) as Name from Persons where Country_name is null;

#finding all persons from the countries "USA","UK","Canada"
select  concat(Fname, " ", Lname) as Name from Persons where Country_name in ("USA","UK","Canada");

#finding all persons not from the countries "India" and "Australia"
select concat(Fname, " ", Lname) as Name from Persons where Country_name not in ("India", "Australia");

#finding all countries with a population between 5 lakhs and 20 lakhs
select Country_name from Country where Population between 500000 and 2000000; 

#finding all countries whose names do not start with "C" 
select Country_name from Country where Country_name not like "C%";