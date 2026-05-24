
If Exists ( Select null from Sysobjects Where Name = 'Department' and type = 'U')
Drop table Department

CREATE TABLE Department
(
 DepartID int,
 DepartmentName VARCHAR(30)
 ) 

 Insert Into Department(DepartID,DepartmentName) values (1,'IT')
 Insert Into Department(DepartID,DepartmentName) values (2,'HR')
 Insert Into Department(DepartID,DepartmentName) values (3,'Marketing')
 Insert Into Department(DepartID,DepartmentName) values (4,'Operation')
 
If Exists ( Select null from Sysobjects Where Name = 'EmployeeDetails' and type = 'U')
Drop table EmployeeDetails

CREATE TABLE  EmployeeDetails
    (
        EmpID INT  ,
        EmpName VARCHAR(80),
        DeptID INT 
    )

 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (1,'Ram',1)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (2,'Sohan',2)
  Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (3,'Rohan',3)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (4,'Shareen',4)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (5,'Mukesh',6)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (6,'Rakesh',null)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (7,'Mohan',5)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (8,'Shyam',3)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (9,'Ghnashayam',4)
 Insert into EmployeeDetails (EmpID,EmpName,DeptID) Values (10,'Radhe',7)


If Exists ( Select null from Sysobjects Where Name = 'EmpSalary' and type = 'U')
Drop table EmpSalary

 CREATE TABLE EmpSalary 
    (
        EmpID INT  ,
        EmpName VARCHAR(80),
        Empsalary INT,
        DeptID INT 
    )

Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (1,'Ram',1000,1)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (2,'Sohan',2000,2)
  Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (3,'Rohan',3000,3)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (4,'Shareen',4000,4)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (5,'Mukesh',5000,6)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (6,'Rakesh',6000,null)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (11,'Rohit',7000,5)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (12,'Mohit',8000,3)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (13,'Shohit',9000,4)
 Insert into EmpSalary (EmpID,EmpName,Empsalary,DeptID) Values (14,'Gagan',1000,7)
 
 
 
 
 --Select * from Department   
 --Select * from EmployeeDetails   
 --Select * from EmpSalary   
    
  --self join:
 --drop table Emp_Reporting 
 If Exists ( Select null from Sysobjects Where Name = 'Emp_Reporting' and type = 'U')
Drop table Emp_Reporting
 create table Emp_Reporting (EmpID int,empName varchar(15),ManagerID int)
    
    insert into Emp_Reporting
    

select 1,'ravi',2 union all

select 2,'Gaurav', 7 union all

select 3,'sem',5 union all

select 4, 'singh',5  union all
select 5, 'arora',null union all
select 6, 'Ram',2 union all
select 7, 'Tom',5 


---========================================================
If Exists ( Select null from Sysobjects Where Name = 'EmployeeTest' and type = 'U')
Drop table EmployeeTest
create table EmployeeTest  
(  
   EmpId int ,  
   FirstName varchar(100),  
   LastName varchar(100),  
   JoinDate datetime ,  
   Salary int ,  
   Department varchar(20)  
)  

insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department)values(1,'Rakesh','Kalluri','2012-07-01 10:00:00.000',20000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department)values(2,'Shabari','Vempati','2011-05-01 10:00:00.000',25000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department)values(3,'Venkatesh','Bodupaly','2013-04-01 10:00:00.000',15000,'Bpo')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department)values(4,'Surjan','Peddineni','2011-07-01 10:00:00.000',25000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(5,'Nani','Ch','2010-07-01 10:00:00.000',50000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(6,'Raju','Chinna','2012-07-01 10:00:00.000',25000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(7,'Kiran','Kumar','2011-07-01 10:00:00.000',20000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(8,'Raki','Kumar','2012-07-01 10:00:00.000',17000,'Bpo')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(9,'Sri','Vidya','2011-07-01 10:00:00.000',30000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(10,'Fehad','MD','2013-07-01 10:00:00.000',20000,'Bpo')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department)values(11,'Anusha','Kumari','2011-07-01 10:00:00.000',35000,'Software')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department) values(12,'Venky','Naidu','2013-07-01 10:00:00.000',20000,'Bpo')  
insert into EmployeeTest(EmpId, FirstName,LastName,JoinDate,Salary,Department)values(13,'Radha','Kumari','2012-07-01 10:00:00.000',10000,'Bpo')  