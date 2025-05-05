--🟢 Easy-Level Tasks (10)
create database hw3
use hw3

--Define and explain the purpose of BULK INSERT in SQL Server.
/*
BULK INSERT is a SQL Server command used to import large amounts of data from a data file
(such as a .txt or .csv file) directly into a table in a database.
The main purpose of BULK INSERT is to efficiently load massive datasets into SQL Server tables,
which is much faster than inserting data row by row with individual INSERT statements.
*/

--List four file formats that can be imported into SQL Server.
/*
.txt, .csv, .xls, .xlsx
*/

--Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products (ID int primary key, ProductName varchar(50), Price decimal(10,2))

--Insert three records into the Products table using INSERT INTO.
insert into Products values (1, 'peach', 34.2), (2, 'apple', 18.34), (3, 'banana', 22.3)

--Explain the difference between NULL and NOT NULL with examples.
/*
NULL represents missing or unknown data. It is not the same as an empty string ('') or zero (0).
It means that no value has been assigned to the column or that the value is unknown.
NOT NULL is a constraint that ensures a column cannot have a NULL value. Every record must have a value for this column.
This is useful when you want to ensure that certain data is always provided.

CREATE TABLE Employees (ID INT, Name VARCHAR(100), Age INT);
INSERT INTO Employees VALUES (1, 'Alice', NULL);  ** Age is NULL

CREATE TABLE Employees (ID INT,
    Name VARCHAR(100) NOT NULL,  ** Name cannot be NULL
    Age INT NOT NULL             ** Age cannot be NULL
);

INSERT INTO Employees (ID, Name, Age) 
VALUES (2, 'Bob', 30);  ** Both Name and Age must have values
*/

--Add a UNIQUE constraint to the ProductName column in the Products table.
alter table Products add constraint unique_ProductName unique (ProductName)

--Write a comment in a SQL query explaining its purpose.
/* 
Comments are usually used for providing explanations to particular code.
Comments should be started with mark "--" or covered with "/*   */" in order not to mass up with code itself.
*/

--Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)
insert into Categories values (1, 'imported'), (2, 'local')

--Explain the purpose of the IDENTITY column in SQL Server.
/*
The IDENTITY column in SQL Server is used to automatically generate unique,
incremental values for a column, often for a primary key or other identifiers.
It’s a special column type that helps ensure that each row in a table gets
a unique value without needing to manually specify one during insertion.
*/

--🟠 Medium-Level Tasks (10)
--Use BULK INSERT to import data from a text file into the Products table.
create table Customer (ID int, Name varchar (20))
bulk insert Customer
from 'C:\Users\shohu\Dropbox\My PC (DESKTOP-85MLQR9)\Downloads\Telegram Desktop\Class_3.txt'
with (firstrow=2,
fieldterminator = ',',
rowterminator  ='\n')

--Create a FOREIGN KEY in the Products table that references the Categories table.
alter table Products add CategoryID int
alter table Products add constraint FK_Categoru_ID foreign key (CategoryID) references Categories(CategoryID) 

select * from Products
select * from Categories

--Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.
/*
A PRIMARY KEY uniquely identifies each record in a table. It cannot contain NULL values, and each table can have only one primary key.
A UNIQUE KEY ensures that all values in a column or group of columns are distinct across rows
*/
create table Users (UserID int primary key, Email varchar(50) unique, Username varchar(50) unique)

--Add a CHECK constraint to the Products table ensuring Price > 0.
alter table Products add constraint chk_Price_positive check (Price>0) 

--Modify the Products table to add a column Stock (INT, NOT NULL).
alter table Products add Stock int

--Use the ISNULL function to replace NULL values in a column with a default value.
select isnull(CategoryID, 0) as CategoryID, ISNULL(Stock, 0) as Stock  from Products	

--Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
/*
A FOREIGN KEY in SQL Server is used to enforce referential integrity between two tables.
It ensures that the value in one column (or set of columns) must exist in another table's column (usually the primary key).
*/

--🔴 Hard-Level Tasks (10)
--Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
create table Customers (CustomerID int, Name varchar(50), Age int check(Age>=18))

--Create a table with an IDENTITY column starting at 100 and incrementing by 10.
alter table Customers add [IDENTITY] int identity(100, 10)

--Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
create table OrderDetails (OrderID int primary key, Item_name varchar (20), Order_amount int)

--Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.

--COALESCE provides result by omitting null values from original table
create table employee (ID int identity, firstName varchar(20), middleName varchar(20), LastName varchar(20))

insert into employee values ('Sam', null, null), (null, 'Bob', 'Robertson'), (null, null, 'Alex'), 
('Josh', 'Steven', null), (null, null, null), ('Sam', 'Johnson', 'Max')

select id, coalesce(firstName, middlename, lastname, id) as name from employee

--ISNULL helps to update nulls with known values
create table table1 (id int identity, [min] int, [max] int)

insert into table1 values (2, null), (null, null), (3, 5)

select id, ISNULL([min], 0) as [min], ISNULL([max], 0) as [max] from table1

--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
create table Employees (EmpID int primary key, Email varchar(100) unique)

--Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
create table Person (ID int primary key, OrderID int, foreign key (OrderID) references OrderDetails(OrderID) on delete cascade on update cascade)
