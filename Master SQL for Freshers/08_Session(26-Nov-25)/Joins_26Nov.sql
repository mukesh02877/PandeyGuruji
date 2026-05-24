
Select * from emp1
Select * from emp2

--Inner Join
Select e1.EMPID,e1.name, e2.EmpID, e2.Name
from emp1 e1
Inner join emp2 e2 on e1.EMPID = e2.EmpID

Select e1.EMPID,e1.name, e2.EmpID, e2.Name
from emp1 e1
Inner join emp2 e2 on e1.EMPID = e2.EmpID and e1.name = e2.name

--Left join

Select e1.EMPID,e1.name --, e2.EmpID, e2.Name
from emp1 e1
Left join emp2 e2 on e1.EMPID = e2.EmpID