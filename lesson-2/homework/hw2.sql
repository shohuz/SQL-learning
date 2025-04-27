--Basic-Level Tasks (10)
--Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
create table Employees (EmpID int, Name varchar(50), Salary decimal(10,2))

--Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
insert into Employees values (1, 'John', 2345.23)
insert into Employees values (2, 'Tom', 3445.22), (3, 'Anna', 1245.15)

--Update the Salary of an employee where EmpID = 1.
update Employees set Salary = 4567.23 where EmpID = 1

--Delete a record from the Employees table where EmpID = 2.
delete from Employees where EmpID = 2

--Demonstrate the difference between DELETE, TRUNCATE, and DROP commands on a test table.
create table Test (ID int, Name varchar(20))
insert into Test values (1, 'John'),(2, 'Martin'),(3, 'Andry')
select * from Test
/*
ID	Name
1	John
2	Martin
3	Andry
*/
delete from Test where ID = 2
select * from Test
/*
ID	Name
1	John
3	Andry
*/
truncate table Test
select * from Test
/*
ID	Name
*/
drop table Test
select * from Test
/*
Msg 208, Level 16, State 1, Line 38
Invalid object name 'Test'.
*/

--Modify the Name column in the Employees table to VARCHAR(100).
alter table Employees
alter column Name varchar(100)

--Add a new column Department (VARCHAR(50)) to the Employees table.
alter table Employees add Department varchar (50)

--Change the data type of the Salary column to FLOAT.
alter table Employees
alter column Salary float

--Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
create table Departments (DepartmentID int primary key, DepartmnentName varchar(50))

--Remove all records from the Employees table without deleting its structure.
truncate table Employees 

--Intermediate-Level Tasks (6)
--Insert five records into the Departments table using INSERT INTO SELECT from an existing table.
insert into Departments values (1, 'HR'), (2, 'Marketing'), (3, 'Budget'), (4, 'Investment'), (5, 'Audit')

--Update the Department of all employees where Salary > 5000 to 'Management'.
insert into Employees values (2, 'Tom', 6445.22, null), (3, 'Anna', 1245.15, null)
update Employees set Department='Management' where Salary>5000

--Write a query that removes all employees but keeps the table structure intact.
delete from Employees

--Drop the Department column from the Employees table.
alter table Employees
drop column Department

--Rename the Employees table to StaffMembers using SQL commands.
exec sp_rename Employees, StaffMembers

--Write a query to completely remove the Departments table from the database.
drop table Departments

--Advanced-Level Tasks (9)
--Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
create table Products (ProductID int primary key, ProductName varchar(50), Category varchar(50), ProductPrice decimal(10,2), OrderName varchar(20))

--Add a CHECK constraint to ensure Price is always greater than 0.
alter table Products
add constraint chk_ProductPrice_positive check(ProductPrice > 0)

--Modify the table to add a StockQuantity column with a DEFAULT value of 50.
alter table Products
add StockQuantity int default 50

--Rename Category to ProductCategory
exec sp_rename [Products.Category], [ProductCategory]

--Insert 5 records into the Products table using standard INSERT INTO queries.
insert into Products values (1, 'Iphone', 'mobile phone', 1400, 'Alex', 100),
							(2, 'Xiaomi', 'mobile phone', 1200, 'Tom', 200),
							(3, 'Lenovo', 'Laptop', 1000, 'John', 50),
							(4, 'HP', 'Laptop', 950, 'Martin', 60),
							(5, 'Sumsung', 'mobile phone', 1300, 'Anna', 150)

--Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
select * into Products_Backup from Products 

--Rename the Products table to Inventory.
exec sp_rename Products, Inventory

--Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
alter table Inventory
alter column ProductPrice float

--Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5.
alter table Inventory add ProductCode int identity(1000, 5) 
