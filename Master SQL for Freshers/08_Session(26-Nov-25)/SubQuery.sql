

--==================== Subquery in SQL=======================================


Select * from EmployeeDetails   
Select * from EmpSalary  

-- Inner query will execute first then outer query will execute

Select * from EmployeeDetails where Empid in (Select Empid from EmpSalary)

Select * from EmployeeDetails where Empid not in (Select Empid from EmpSalary)



 Select EmpID, EmpName, DeptID 
 from EmployeeDetails   
 Where EmpID in (Select EmpID from EmpSalary)
 
 Select * 
 from FactInternetSales
 where SalesOrderNumber not in ( Select SalesOrderNumber from FactResellerSales)

 Select EmpID, EmpName, DeptID 
 from EmployeeDetails   
 Where EmpID in(Select EmpID from EmpSalary Where Empsalary > 4000)
 

 Select * from EmpSalary
 
 --Nested Sub Query
 
 Select EmpID, EmpName, DeptID 
 from EmployeeDetails   
 Where EmpID in(Select EmpID from EmpSalary Where DeptID in (Select DepartID from Department ))


 
 -- Co related subquery
 
 Select EmpID, EmpName, DeptID 
 from EmployeeDetails   e1 
 Where EmpID in(
 Select EmpID from EmpSalary e2
 where e1.EmpID = e2.EmpID
 )





--==============================Derived table====================================================

-- How to find the Nth Higest Salary using sub Query\ in single select statement

Select * from empSalary

Select * from (Select dense_rank() over (order by empSalary desc) As RNK,* from  empSalary ) K

Select * from (Select dense_rank() over (order by empSalary desc) As RNK,* from  empSalary ) k Where k.RNK =5



-- Filter duplicate value

Select * from EmpSalary order by 1

Select distinct * from EmpSalary order by 1

-- Find the Distinct value without using Distinct function

Select *,  row_number() over (partition by EmpID, EmpName, EmpSalary, 
DeptID order by EmpiD desc) As RNK from EmpSalary



select * from ( Select *,  row_number() over (partition by EmpID, EmpName, EmpSalary, 
DeptID order by EmpiD desc) As RNK from EmpSalary) k
Where k.RNK = 1


-- Find the values which is duplicate

select * from ( Select *,  row_number() over (partition by EmpID, EmpName, EmpSalary, 
DeptID order by EmpiD desc) As RNK from EmpSalary) k
Where k.RNK>1


