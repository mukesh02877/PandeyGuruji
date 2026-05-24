

----=================================Constraints============================
/*
 Constraints are rules and restrictions applied on a column or a table such that unwanted data
 can't be inserted into tables. This ensures the accuracy and reliability of the data in the
 database. We can create constraints on single or multiple columns of any table. Constraints
 maintain the data integrity and accuracy in the table.

SQL Server contains the following 6 types of constraints:

Not Null Constraint
Check Constraint
Default Constraint
Unique Constraint
Primary Constraint
Foreign Constraint

*/

--drop table My_Constraint

-- Not Null and check Constraint

--drop table My_Constraint
Create Table My_Constraint  
(  
   IID int NOT NULL,  
   Name nvarchar(100) ,  
   Age int check(age>18),  
)  

Select * from My_Constraint

Insert into My_Constraint(IID,Name,Age) values (1,'Deepak',28)

Insert into My_Constraint(Name,Age) values ('Manik',38)

Insert into My_Constraint(IID,Age) values (123,38)

Insert into My_Constraint(IID,Name,Age) values (3,'Abc',12)

Insert into My_Constraint(IID,Name,Age) values (3,'Abc',20)

Insert into My_Constraint(IID,Age) values (4,27)

Select * from My_Constraint

Select * from DimCustomer

Update My_Constraint set Name = 'Unknown' where name is null


-- Alter existing table
Alter Table My_Constraint  
Alter Column Name nvarchar(200) not null 

-- Check Constraint
CREATE TABLE Employee_Test
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal int check(Emp_Sal>1000)
)

INSERT INTO Employee_Test VALUES ('Anees',1000);
INSERT INTO Employee_Test VALUES ('Rick',1200);
INSERT INTO Employee_Test VALUES ('John',1100);
INSERT INTO Employee_Test VALUES ('Stephen',900);
INSERT INTO Employee_Test VALUES ('Maria',1400);

Sp_help Employee_Test

-- Drop constraints
alter table Employee_Test drop CONSTRAINT  CK__Employee___Emp_S__662B2B3B

----==========-Default Constraint=================
--drop table Employee1
CREATE TABLE Employee1
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal int check(Emp_Sal>1000),
Country Varchar(100) default ('India')
)

INSERT INTO Employee1(Emp_name,Emp_Sal) VALUES ('Mukesh',1100);

INSERT INTO Employee1(Emp_name,Emp_Sal,Country) VALUES ('Sikher',1100,'USA');


select * from Employee1

--drop table Employee_Unique

--==========Unique Constraint=================----
Create TABLE Employee_Unique
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Mobile bigInt unique, -- not allow duplicate values
Emp_Sal int check(Emp_Sal>1000),
Country Varchar(100) default ('India')
)

Insert Into Employee_Unique(Emp_name,Mobile,Emp_Sal,Country) Values ('Rakesh',9866455299,15000,'Nepal')

Insert Into Employee_Unique(Emp_name,Mobile,Emp_Sal,Country) Values ('Mukesh',9866455299,16000,'USA')

Insert Into Employee_Unique(Emp_name,Emp_Sal,Country) Values ('Gitanjali',18000,'USA')

Insert Into Employee_Unique(Emp_name,Emp_Sal,Country) Values ('Deepak',19000,'India')

Select * from Employee_Unique


-- Primary Key.
/*
A Primary key constraint is applied for uniquely identifying rows in a table. It cannot contain Null values and rest of table data should be unique. 
While creating a table if we do not specify a name to the constraint, sql server automatically assigns a name to the constraint.
*/
--drop table EmployeeDetails

Create table EmployeeDetails
    (
    EmpID int PRIMARY Key ,
    EmpFirstName varchar(80),
    EmpLastName varchar(80),
    Department varchar(30),
    DepartID int
    )


Insert Into EmployeeDetails values (1, 'Mukesh','Pandey','IT',8)

Insert Into EmployeeDetails values (1, 'Siker','Raman','HR',5)

Insert Into EmployeeDetails(EmpFirstName,EmpLastName,Department,DepartID) values ('Siker','Raman','HR',5)


Select * from EmployeeDetails

Select * from Department

Drop table Department

-- Foreign Key Constraint

/*
A Foreign Key Constraint is used to establish a relationship between two tables where one column is a Primary Key of the 
table and the other column from other table is referenced to the Primary Key column. 
*/
--drop table Department
CREATE TABLE Department
(
 DepartID int Primary key,
 DepartmentName VARCHAR(30)
 ) 

 Insert Into Department(DepartID,DepartmentName) values (1,'IT')
 Insert Into Department(DepartID,DepartmentName) values (2,'HR')
 Insert Into Department(DepartID,DepartmentName) values (3,'Marketing')
 Insert Into Department(DepartID,DepartmentName) values (4,'Operation')

 Select * from Department
 --drop table EmployeeDetails

CREATE TABLE  EmployeeDetails
    (
        EmpID INT PRIMARY Key ,
        EmpName VARCHAR(80),
        DeptID INT 
    )

 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (1001,'Ram',1)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (1002,'Sohan',2)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (1003,'Shareen',4)
Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (1004,'Vansh',6)


Select * from EmployeeDetails

------====Foreign Key Constraint applied========
--drop table EmployeeDetails

    CREATE TABLE EmployeeDetails 
    (
        EmpID INT Primary Key ,
        EmpName VARCHAR(80),
        Empsalary INT,
        DepartID INT Foreign Key References Department (DepartID)
    )

--Parent Table: Department
-- Child Table: EmployeeDetails

sp_help EmployeeDetails
sp_help Department

sp_help Dimcustomer

Insert into EmployeeDetails (EmpID,EmpName,DepartID) Values (1001,'Ram',1)
 Insert into EmployeeDetails (EmpID,EmpName,DepartID) Values (1002,'Sohan',2)
 Insert into EmployeeDetails (EmpID,EmpName,DepartID) Values (1003,'Shareen',4)


Insert into EmployeeDetails (EmpID,EmpName,Empsalary,DepartID) Values (1004,'Vansh',11000, 6)

select * from Department
Select * from EmployeeDetails

--We can't drop/delete Parent table before child table
--Parent table:Department
--Child Table: EmployeeDetails

drop table EmployeeDetails
drop table Department

Select * from DimCustomer

--Composite Primary Key: 

Create table Employee_CPK(EMPID int, EMPName Varchar(100), City Varchar(100), Primary Key(EMPID,EMPName))

Insert into  Employee_CPK values (100,'Rahul','Hyderabad')

Insert into  Employee_CPK values (100,'Satvik','New Delhi')  -- Data will insert and not throw an error because composite key combination is unique.

Insert into  Employee_CPK values (100,'Satvik','Hyd')

Insert into  Employee_CPK values (100,'Josh','Hyd')


Select * from Employee_CPK
