create database School;

#using the database for creating the table

use school;

#creating table

create table Student(
Roll_No int auto_increment primary key,
Name char(25) not null,
Marks float(4,1),
Grade char(5)
);

# to view the description of the table

desc Student;

#adding column "Contact" to the student table using alter command

alter table student add Contact varchar(12); 

#inserting data to the "student" table

insert into student values(1,"Deepak",95,"A+", 9822078791);
insert into student values(2,"manu",90,"B+", 9832078791);
insert into student values(3,"Sam",92,"A", 9832998791);

select * from student;

#removing the grade column from the student table

alter table student drop column Grade;

select * from student;

#renaming table name "student" to "classten"

rename table student to classten;

#removing all the rows from the table "classten"

truncate table classten;

select * from classten;

#removing table "classten" from the database "School"

drop table classten;