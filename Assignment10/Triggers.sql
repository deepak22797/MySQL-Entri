create database Triggerdb;
use Triggerdb;

#1. creating a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.

create table teachers (
  id int primary key auto_increment,
  name varchar(100),
  subject varchar(50),
  experience int,
  salary decimal(10, 2)
);

insert into teachers (name, subject, experience, salary) values
('john doe', 'mathematics', 5, 50000),
('jane smith', 'english', 8, 55000),
('alex brown', 'history', 12, 60000),
('mary johnson', 'science', 7, 48000),
('david wilson', 'art', 4, 43000),
('lucy davis', 'music', 3, 40000),
('mark evans', 'physical education', 15, 70000),
('emma thompson', 'computer science', 10, 62000);

#2. creating a before insert trigger named before_insert_teacher that will raise an error, if the salary inserted to the table is less than zero.

delimiter $$
create trigger before_insert_teacher
before insert on teachers
for each row
begin
  if new.salary < 0 then
    signal sqlstate '45000' set message_text = 'salary cannot be negative';
  end if;
end $$
delimiter ;

#3. creating an insert trigger named after_insert_teacher 

create table teacher_log (
  teacher_id int,
  action varchar(50),
  timestamp datetime
);

delimiter $$
create trigger after_insert_teacher
after insert on teachers
for each row
begin
  insert into teacher_log (teacher_id, action, timestamp)
  values (new.id, 'insert', now());
end $$
delimiter ;

#4. creating a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.

delimiter $$
create trigger before_delete_teacher
before delete on teachers
for each row
begin
  if old.experience > 10 then
    signal sqlstate '45000' set message_text = 'cannot delete teacher with more than 10 years of experience';
  end if;
end $$
delimiter ;

#5. creating an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

delimiter $$
create trigger after_delete_teacher
after delete on teachers
for each row
begin
  insert into teacher_log (teacher_id, action, timestamp)
  values (old.id, 'delete', now());
end $$
delimiter ;


