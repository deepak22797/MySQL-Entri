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

#Query to print the first three characters of Country_name from the country table
select left(Country_name,3) as Country from Country;

#Query to concatenate first name and last name from persons table
select concat(Fname, " ", Lname) as Name from Persons;

#Query to count the number of unique country names from persons table
select count(distinct Country_name) as UniqueCountryCount from Persons;

#Query to print the maximum population from the country table
select max(Population) as HighestPopulation from Country;

#Query to print the minimum population from persons table
select min(Population) as LowestPopulation from Persons;

#Removing the not null constriant from the Lname inorder to insert 2 null values
alter table Persons modify Lname varchar(50);

#Inserting 2 rows to the persons table making the Lname NULL
insert into Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) values
(11, 'Aiden', NULL, 987654321, 4.0, 3, 'UK'),
(12, 'Olivia', NULL, 876543210, 4.7, 5, 'India');

#Query to count the Lname from the Persons table
select count(Lname) as LnameCount from Persons;

#Query to find the number of rows in the persons table
select count(*) as NumberOfRows from Persons;

#Query to show the population of the Country table for the first 3 rows
select Population from Country limit 3;

#Query to print 3 random rows of countries
select * from Country order by rand() limit 3;

#Listing all persons ordered by their rating in descending order
select concat(Fname, " ",Lname), Rating as Name from Persons order by Rating desc;

#finding the total population for each country in the Persons table
select Country_name as Country, sum(Population) as TotalPopulation from Persons group by Country_name;

#finding countries in the Persons table with a total population greater than 50000
select Country_name as Country, sum(Population) as TotalPopulation from Persons 
group by Country_name having TotalPopulation > 50000;

#listing the total number of persons and average rating for each country, but only for countries with more than two persons, ordered by the average rating in ascending order
select Country_name, count(*) as TotalPersons, avg(Rating) as AverageRating 
from Persons 
group by Country_name 
having TotalPersons > 2 
order by AverageRating ASC ;



