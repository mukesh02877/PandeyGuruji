

---=============Amazon SQL Interview Questions===============================


/*1. Given a table SELLERS with 3 column SELLER_ID, COUNTRY and JOINING_DATE, write a query to 
identify number of sellers per country and order it in descending order of no. of sellers*/

Create table SELLERS(SELLER_ID int identity(1,1),COUNTRY varchar(100),JOINING_DATE datetime)

Declare @a int, @b int

Set @a = 1
Set @b = 1000

While @a<= @b
  Begin
        Insert into SELLERS(JOINING_DATE)
		Select GETDATE()+@a
		Set @a = @a+1
  End

Select * from SELLERS

  Update SELLERS
  Set COUNTRY = 'India'
  Where SELLER_ID between 1 and 300

   Update SELLERS
  Set COUNTRY = 'USA'
  Where SELLER_ID between 301 and 600

    Update SELLERS
  Set COUNTRY = 'UK'
  Where SELLER_ID between 601 and 900

  Update SELLERS
  Set COUNTRY = 'SA'
  Where SELLER_ID between 901 and 1000

  Select * from SELLERS

--1. 

Select COUNTRY,count(SELLER_ID) as number_Of_sellers from SELLERS
Group by COUNTRY
order by 2 desc 

--2. For the table in question 1 write a query to extract all sellers who joined on a Monday.

Select Datename(dw,JOINING_DATE), * from SELLERS where Datename(dw,JOINING_DATE) = 'Monday'

--3. Given a table EMPLOYEE with two columns EMP_ID and SALARY, how can we extract alternate rows from a table?
Select * from EmployeeTest

Select  row_number() over (order by empid desc) as Ranking ,* into #test from EmployeeTest

Select * from #test where Ranking%2<>0

-- find distinct values without using distinct keyword

Select * from EmpSalary order by 1 

Select * from (Select *, row_number() over (Partition by EmpID,EmpName,Empsalary,DeptID order by empid desc) as Ranking 
                from EmpSalary) k where k.Ranking>1

--4. Given a table EMPLOYEE with two columns EMP_ID and SALARY, extract the employees with the 3rd highest salary.

Select  dense_rank() over (order by Salary desc) as Ranking ,* into #test4 from EmployeeTest

Select * from #test4 where Ranking=3

--5. What is wrong with this SQL query? Correct it so it executes properly.

SELECT SELLER_ID, YEAR(JOINING_DATE)  BILLINGYEAR 
FROM SELLERS
WHERE JOINING_DATE >= 2010;

--6. Assume a schema of EMP ( ID, NAME, DEPTID ) , DEPT ( ID, NAME).
--If there are 10 records in the EMP table and 5 records in the DEPT table, how many rows will be displayed in the result of the following SQL query:
--SELECT * FROM EMP, DEPT

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
  Insert Into Department(DepartID,DepartmentName) values (5,'Admin')
 
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

 SELECT * FROM EmployeeDetails, Department

 --8. Consider a table EMPLOYEE with columns EMP_ID and SALARY with unknown number of records. Write a query to extract top 25% of the records based on salary?

 select DENSE_RANK() over (order by yearlyincome desc) As Rank_Test,* into test8 from dimcustomer 

 declare @max int

 Select @max = (max(Rank_Test)/4) from test8

 Select * from test8 where Rank_Test between 1 and @max 


 --9. Consider a table EMPLOYEE with columns EMP_ID, DEPT_NO and SALARY. Write a query to extract all employees who have 
 --salaries higher than the avg. of their department.

 select * 
 from EmployeeTest e
 Join (Select Department,Avg(salary) as AVGSalary from EmployeeTest
 Group by Department) s on s.Department = e.Department
 where e.salary>s.AVGSalary 


 --10. Consider a table EMPLOYEE with columns EMP_ID and SALARY. Write a select query to output a rank against each record. The rank must be based on the salary(rank 1 for the highest salary)

 Select  dense_rank() over (order by Salary desc) as Ranking ,*  from EmployeeTest

