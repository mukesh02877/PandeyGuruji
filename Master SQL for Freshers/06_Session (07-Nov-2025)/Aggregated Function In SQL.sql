

--AVG

Select * from Dimcustomer

select AVG(YearlyIncome) from Dimcustomer

--this will throw an error

select AVG(YearlyIncome),FirstName from Dimcustomer

--this will not throw an error

Select  Gender, AVG(YearlyIncome) as AVGByGender 
from Dimcustomer 
Group By Gender


Select MaritalStatus,Gender, AVG(YearlyIncome) 
from Dimcustomer 
Group By MaritalStatus,Gender

-- COUNT

Select MaritalStatus, Count(CustomerKey) as MaritalStatus_Count  
from Dimcustomer Group By MaritalStatus

Select Count(CustomerKey)
from Dimcustomer

Select Count(MiddleName)
from Dimcustomer

Select Count(*)
from Dimcustomer

Select Count(1)  --- Better Performance 
from Dimcustomer

Select 1 from Dimcustomer

--Max

Select Gender, MAX(YearlyIncome) from Dimcustomer Group By Gender

--min

Select Gender, min(YearlyIncome) from Dimcustomer Group By Gender



--Sum

Select Gender, Sum(YearlyIncome) as SumofSalary from Dimcustomer Group By Gender

Select  Sum(YearlyIncome) as SumofSalary from Dimcustomer


-- Having Clause

Select MaritalStatus,Gender, AVG(YearlyIncome) 
from Dimcustomer 
Group By MaritalStatus,Gender
Having Gender = 'M'


Select MaritalStatus,Gender, AVG(YearlyIncome) 
from Dimcustomer 
Where Gender = 'M'
Group By MaritalStatus,Gender


Select * from Dimcustomer Where Gender = 'M'

-- Throw an error

Select * from Dimcustomer Having Gender = 'M'
 

 ---  Duplicate values

 select EmpId, FirstName,LastName,JoinDate,Salary,Department,count(*) as TotalCount from EmployeeTest 
 Group by EmpId, FirstName,LastName,JoinDate,Salary,Department
 having count(*) > 1




