#creating database
create database Library;
use Library;

#creating tables.

create table branch (
    branch_no int primary key,
    manager_id int,
    branch_address varchar(255),
    contact_no varchar(15)
);

create table employee (
    emp_id int primary key,
    emp_name varchar(100),
    position varchar(50),
    salary decimal(10, 2),
    branch_no int,
    foreign key (branch_no) references branch(branch_no)
);

create table books (
    isbn int primary key,
    book_title varchar(255),
    category varchar(50),
    rental_price decimal(10, 2),
    status varchar(3),  
    author varchar(100),
    publisher varchar(100)
);

create table customer (
    customer_id int primary key,
    customer_name varchar(100),
    customer_address varchar(255),
    reg_date date
);

create table issuestatus (
    issue_id int primary key,
    issued_cust int,
    issued_book_name varchar(255),
    issue_date date,
    isbn_book int,
    foreign key (issued_cust) references customer(customer_id),
    foreign key (isbn_book) references books(isbn)
);

create table returnstatus (
    return_id int primary key,
    return_cust int,
    return_book_name varchar(255),
    return_date date,
    isbn_book2 int,
    foreign key (return_cust) references customer(customer_id),
    foreign key (isbn_book2) references books(isbn)
);

#inserting data to the tables.

insert into branch (branch_no, manager_id, branch_address, contact_no)
values 
(1, 101, '123 Main St, City', '1234567890'),
(2, 102, '456 Park Ave, City', '9876543210');

insert into employee (emp_id, emp_name, position, salary, branch_no)
values 
(201, 'John Doe', 'Manager', 60000, 1),
(202, 'Jane Smith', 'Clerk', 35000, 2),
(203, 'Mark Evans', 'Assistant', 45000, 1);

insert into books (isbn, book_title, category, rental_price, status, author, publisher)
values 
(111, 'History of the World', 'History', 30.00, 'yes', 'John Doe', 'XYZ Publisher'),
(112, 'Introduction to Programming', 'Technology', 25.00, 'no', 'Jane Doe', 'ABC Publisher'),
(113, 'Art and Culture', 'Art', 20.00, 'yes', 'Mary Jane', 'ArtPress');

insert into customer (customer_id, customer_name, customer_address, reg_date)
values 
(301, 'Alice Green', '789 Sunset Blvd', '2021-05-12'),
(302, 'Bob Brown', '1010 Oak St', '2020-11-30');

insert into issuestatus (issue_id, issued_cust, issued_book_name, issue_date, isbn_book)
values 
(401, 301, 'History of the World', '2023-01-15', 111),
(402, 302, 'Introduction to Programming', '2023-06-10', 112);

insert into returnstatus (return_id, return_cust, return_book_name, return_date, isbn_book2)
values 
(501, 301, 'History of the World', '2023-02-10', 111);

#1. Retrieve the book title, category, and rental price of all available books.
select book_title, category, rental_price
from books
where status = 'yes';

#2. List the employee names and their respective salaries in descending order of salary.
select emp_name, salary
from employee
order by salary desc;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
select b.book_title, c.customer_name
from books b
join issuestatus i on b.isbn = i.isbn_book
join customer c on i.issued_cust = c.customer_id;

#4. Display the total count of books in each category.
select category, count(*) as total_books
from books
group by category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select emp_name, position
from employee
where salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select c.customer_name
from customer c
left join issuestatus i on c.customer_id = i.issued_cust
where c.reg_date < '2022-01-01' and i.issued_cust is null;

#7. Display the branch numbers and the total count of employees in each branch.
select e.branch_no, count(*) as total_employees
from employee e
group by e.branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
select distinct c.customer_name
from customer c
join issuestatus i on c.customer_id = i.issued_cust
where i.issue_date between '2023-06-01' and '2023-06-30';

#9. Retrieve book_title from book table containing history. 
select book_title 
from books
where book_title like "%history%";

#10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
select e.branch_no, count(*) as EmpCount
from employee e
group by branch_no 
having EmpCount > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses.
select e.emp_name, b.branch_address
from employee e
join branch b on e.branch_no = b.branch_no
where e.position = 'manager';

#12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
select distinct c.customer_name
from customer c
join issuestatus i on c.customer_id = i.issued_cust
join books b on i.isbn_book = b.isbn
where b.rental_price > 25;








