--Easy
/*1. Define the following terms: data, database, relational database, and table.
Data - information collected or generated for analysis
Database - an organized collection of data stored and accessed electronically
Relational database - tables of the databese are interlinked and connected
Table - information stored in rows and columns
*/

/*2. List five key features of SQL Server.
1 Data Security
2 High Availability and Disaster Recovery
3 Scalability and Performance
4 Integration Services
5 Advanced Analytics and Reporting
*/

/*What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
Windows authentication  and   SQL Server authentication
*/

--Medium
--Create a new database in SSMS named SchoolDB.
create database SchoolDB

--Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Student (ID int primary key, Name varchar(50), Age int)

--Describe the differences between SQL Server, SSMS, and SQL.
/*
SQL Server - the database system.

SSMS - the app you use to connect to and work with SQL Server.

SQL - the language you write to tell SQL Server what to do.
*/

--Hard
--Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
/*
1. DQL (Data Query Language)
Purpose: To query and fetch data from a database.
Main Command: 'SELECT'
2. DML (Data Manipulation Language)
Purpose: To modify data inside existing tables.
Main Commands: 'INSERT', 'UPDATE', 'DELETE'
3. DDL (Data Definition Language)
Purpose: To define or change the structure of tables and databases.
Main Commands: 'CREATE', 'ALTER', 'DROP', 'TRUNCATE'
4. DCL (Data Control Language)
Purpose: To control access to data (permissions).
Main Commands: 'GRANT', 'REVOKE'
5. TCL (Transaction Control Language)
Purpose: To manage transactions (groups of SQL commands executed together).
Main Commands: 'COMMIT', 'ROLLBACK', 'SAVEPOINT'
*/
select * from Student

INSERT INTO Employees (Name, Age) VALUES ('John Doe', 30);

UPDATE Employees SET Age = 31 WHERE Name = 'John Doe';

DELETE FROM Employees WHERE Name = 'John Doe';

CREATE TABLE Employees (ID INT, Name VARCHAR(100), Age INT);

ALTER TABLE Employees ADD Address VARCHAR(255);

DROP TABLE Employees;

GRANT SELECT ON Employees TO user1;

REVOKE SELECT ON Employees FROM user1;

BEGIN TRANSACTION;
DELETE FROM Employees WHERE Age > 60;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM Employees WHERE Age > 60;
ROLLBACK;

--Write a query to insert three records into the Students table.
insert into Student values (1, 'John', 30)
insert into Student values (2, 'Tom', 25)
insert into Student values (3, 'Anna', 37)

--Create a backup of your SchoolDB database and restore it. (write its steps to submit)
/*
Right click on SchoolDB database go to Tasks and choose Back Up...
Then, Back up window by default identifies a destination to store and click button 'OK'
It will show the following message:
TITLE: Microsoft SQL Server Management Studio
------------------------------
The backup of database 'SchoolDB' completed successfully.
------------------------------
BUTTONS:
OK
------------------------------
*/
