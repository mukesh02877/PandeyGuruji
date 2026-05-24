

----------------**********Views**********------------
/*
Views are virtual tables that hold data from one or more tables. It is stored in the database. 
A view does not contain any data itself, it is a set of queries that are applied to one or more 
tables that are stored within the database as an object. Views are used for security purposes in 
databases. Views restrict the user from viewing certain columns and rows. In other words, using a 
view we can apply the restriction on accessing specific rows and columns for a specific user. 
A view can be created using the tables of the same database or different databases. It is used 
to implement the security mechanism in the SQL Server.*/

--drop view Employee_Details3
--drop table Employee_Details
CREATE TABLE [dbo].[Employee_Details]
(  
    [Emp_Id] [int] IDENTITY(1,1) NOT NULL,  
    [Emp_Name] [nvarchar](50) NOT NULL,  
    [Emp_City] [nvarchar](50) NOT NULL,  
    [Emp_Salary] [int] NOT NULL)
Insert Into Employee_Details Values('Pankaj','Alwar',25000)  
Insert Into Employee_Details Values('Rahul','Jaipur',26000)  
Insert Into Employee_Details Values('Rajan','Delhi',27000)  
Insert Into Employee_Details Values('Sandeep','Alwar',28000)  
Insert Into Employee_Details Values('Sanjeev','Jaipur',32000)  
Insert Into Employee_Details Values('Narendra','Alwar',34000)  
Insert Into Employee_Details Values('Neeraj','Delhi',29000)  
Insert Into Employee_Details Values('Div','Jaipur',25000)  
Insert Into Employee_Details Values('Tanuj','Alwar',22000)  
Insert Into Employee_Details Values('Nitin','Jaipur',20000) 

Select * from Employee_Details

CREATE TABLE [dbo].[Employee_Contact]
(  
    [Emp_Id] [int] NOT NULL,  
    [MobileNo] [nvarchar](50) NOT NULL  
) 

Insert Into Employee_Contact Values(1,'9813220191')  
Insert Into Employee_Contact Values(2,'9813220192')  
Insert Into Employee_Contact Values(3,'9813220193')  
Insert Into Employee_Contact Values(4,'9813220194')  
Insert Into Employee_Contact Values(5,'9813220195')  
Insert Into Employee_Contact Values(6,'9813220196')  
Insert Into Employee_Contact Values(7,'9813220197')  
Insert Into Employee_Contact Values(8,'9813220198')  
Insert Into Employee_Contact Values(9,'9813220199')  
Insert Into Employee_Contact Values(10,'9813220135') 

select * from Employee_Contact

--1: We can select all columns of a table

Create View Employee_View1  
as  
select * from Employee_Details 

Select * from Employee_View1

--2: We can select specific columns of a table. 

Create View Employee_View2  
as  
select Emp_Id,Emp_Name,Emp_City from Employee_Details 

go
Select * from Employee_View2

--3: We can select columns from a table with specific conditions.

Create View Employee_View3  
as  
select * from Employee_Details where Emp_Salary>25000 
Go
Select * from Employee_View3

--4: We can create a view that will hold the columns of different tables

Create View Employee_View4  
as  
select Employee_Details.Emp_Id,Employee_Details.Emp_Name,Employee_Details.Emp_Salary,Employee_Contact.MobileNo 
from Employee_Details   
Left Outer Join  Employee_Contact   on  Employee_Details .Emp_Id= Employee_Contact.Emp_Id   

Select * from Employee_View4

--Dropping a View
Drop View Employee_View1 


--Getting Information about a view: We can retrieve all the information of a view using the Sp_Helptext system Stored Procedure.

Sp_Helptext Employee_View4  

--Alter View in SQL Server 

Alter View Employee_View4    
as    
select Employee_Details.Emp_Id,Employee_Details.Emp_Name,Employee_Contact.MobileNo   
from Employee_Details     
Left Outer Join  Employee_Contact   on  Employee_Details .Emp_Id= Employee_Contact.Emp_Id 
Go
Select * from Employee_View4



--Renaming the View
Sp_Rename Employee_View4 , V_Employee_View4  

Select * from V_Employee_ViewNew


------------Refreshing a View in SQL Server------------

Create View Employee_View12  
as  
Select * from Employee_Details  
      
--Now add a column in Employee_Details table  
      
Alter Table Employee_Details Add YearlyIncome int 

Select * from Employee_Details  

Select * from Employee_View12

--sp_refreshview is a system-level Stored Procedure that refreshes the metadata of any view

Exec sp_refreshview Employee_View12     

------------SchemaBinding a VIEW ----------------

Create View Employee_Details3  
with SCHEMABINDING  
as  
select Emp_Id,Emp_Name,Emp_Salary,Emp_City from DBO.Employee_Details 


drop table Employee_Details

------------Encrypt a view-----------

sp_helptext Employee_Details3

Create View Employee_Details4  
with Encryption  
as  
select Emp_Id,Emp_Name,Emp_Salary,Emp_City from DBO.Employee_Details 

sp_helptext Employee_Details4