#creating database "sales"#
create database sales;

#using database sales#
use sales;

#creating table named "orders"#
create table orders(
Order_Id varchar(25) unique,
Customer_name char(20),
Product_category char(20),
Ordered_item char(25) not null,
Contact_No int primary key
);

#adding new column "Order_quantity" to the table orders#
alter table orders add column Order_quantity int;

#renaming the orders table to sales_orders table#
rename table orders to sales_orders;

#modifying the type of the column Order_quantity#
alter table sales_orders modify Order_quantity int not null default("0");

#modifying the type of the column Contact_No#
alter table sales_orders modify Contact_No bigint;

#inserting data to the table "sales_orders"
insert into sales_orders values("E0A1","Rahul","Electronics","Laptop", 9872634324,1);
insert into sales_orders values("E1B5","Thomas","Electronics","Mobile", 9232634325,2);
insert into sales_orders values("F00G","Vishak","Furniture","Chair", 9172674324,10);
insert into sales_orders values("FADF","Manu","Fashion","Tshirt", 9772654324,3);
insert into sales_orders values("E3G5","Anaz","Electronics","Power Bank", 9272631124,4);
insert into sales_orders values("E6P4","Affrin","Electronics","Headphone", 9972639324,1);
insert into sales_orders values("FA2J","Mathew","Fashion","Pants", 9872333324,2);
insert into sales_orders values("E3R1","Deepak","Electronics","Laptop", 9072608324,1);
insert into sales_orders values("F2H2","Roy","Furniture","Table", 9112634321,1);
insert into sales_orders values("F11Y","Catherine","Furniture","Sofa", 9472428324,3);

#retrieving customer name and ordered item
select Customer_name, Ordered_item from sales_orders;

#using the update command for changing the value of the ordered item in 8th row
update sales_orders set Ordered_item = "Speaker" where Contact_No = "9072608324";

#fetching all the data in the table
select * from sales_orders;

#deleting the sales_orders table from the database
drop table sales_orders;