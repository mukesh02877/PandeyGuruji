


---------========Common Table Expression(CTE).===============================

/*
Common Table Expressions are also called CTEs. This feature was introduced with SQL Server 2005. 
The CTE is preferred to use as an alternative to a Subquery/derived table.

CTE: Memory, Update data in main, faster then Temp table
Temp Table: Temp DB, we can't Update data in main

*/



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


Select * from EmpSalary order by 1

With  RemoveDuplicate(EmpID,EmpName, EMpSalary,DeptID,RNK)
As
(
Select EmpID,EmpName, EMpSalary,DeptID, Row_number() over ( Partition by EmpID,EmpName, EMpSalary,DeptID 
order by empID) from EmpSalary
)

Delete RemoveDuplicate where rnk>1




 --find the Nth Higest Salary using CTE

With  FindNSalary(EmpID,EmpName, EMpSalary,DeptID,RNK)
As
(
Select EmpID,EmpName, EMpSalary,DeptID, dense_rank() over (order by empSalary desc) from EmpSalary
)

Select * from FindNSalary where RNK = 5



