#adding a new column called DOB in Persons table with data type as Date
alter table Persons add DOB date;

#user defined function to calculate age using DOB
delimiter $$
create function CalculateAge(birthdate date)
returns int
not deterministic
no sql
begin
  declare age int;
  set age = timestampdiff(year, birthdate, curdate());
  return age;
end $$
delimiter ;

#select query to fetch the age of all persons using the fuction that has been created
select Id, Fname, Lname, Country_name, DOB, CalculateAge(DOB) AS Age
from Persons;

#finding the length of each country name in Country table
select Country_name as Country, length(Country_name) as len from Country;

#Extracting the first three characters of each country's name in the Country table.
select Country_name as Country, left(Country_name,3) as FirstThreeChars from Country;

#converting all country names to uppercase and lowercase in the Country table.
select Country_name as Country, upper(Country_name) as Uppercase, lower(Country_name) as Lowercase
from Country;