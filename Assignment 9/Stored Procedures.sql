create database CompanyDB;
use CompanyDB;

#creating worker table
create table Worker (
    Worker_Id int primary key,
    FirstName char(25),
    LastName char(25),
    Salary int(15),
    JoiningDate datetime,
    Department char(25)
);

#1. creating a stored procedure that takes in IN parameters for all the columns in the worker table and adds a new record to the table and then invokes the procedure call.
delimiter $$
create procedure InsertingRecords(
    in  p_worker_id int,
    in p_firstname char(25),
    in p_lastname char(25),
    in p_salary int(15),
    in p_joining_date datetime,
    in p_department char(25))
begin
insert into Worker(Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
values (p_worker_id, p_firstname, p_lastname, p_salary, p_joining_date, p_department);
end $$
delimiter ;

call InsertingRecords(101, 'John', 'Doe', 50000, '2024-01-01 09:00:00', 'HR');

#2. creating stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.

delimiter $$
create procedure GetSalaryByWorkerId(in p_worker_id int, out p_salary int)
begin
    select Salary into p_salary
    from Worker
    where Worker_Id = p_worker_id;
end $$

delimiter ;

set @worker_id = 101;
call GetSalaryByWorkerId(@worker_id, @Salary);

select @salary as WorkerSalary;

#3. Creating a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.

delimiter $$
create procedure UpdateDepartment(in p_worker_id int, in p_department char(25))
begin 
update Worker 
set Department = p_department
where Worker_Id = p_worker_id;
end $$
delimiter ; 

call UpdateDepartment(101,'IT');

#4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.

delimiter $$
create procedure GetWorkerCountByDepartment(in p_department char(25), out p_workerCount int)
begin
    select count(*) into p_workerCount
    FROM Worker
    WHERE Department = p_department;
END $$
DELIMITER ;

set @dept = 'IT';
call GetWorkerCountByDepartment(@dept, @worker_count);

select @worker_count as WorkersCount;

#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

delimiter $$
create procedure GetAvgSalaryByDepartment(in p_department char(25),out p_avgSalary decimal(15,2))
begin
    select avg(Salary) into p_avgSalary
    from Worker
    where Department = p_department;
end $$
delimiter ;

set @dept = 'HR';
call GetAvgSalaryByDepartment(@dept, @avg_salary);

SELECT @avg_salary as AvgSalary;



