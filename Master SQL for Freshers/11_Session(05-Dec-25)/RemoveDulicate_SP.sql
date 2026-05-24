

---
Create Proc DeleteDuplicate
As
Begin
With  RemoveDuplicate(EmpID,EmpName, EMpSalary,DeptID,RNK)
As
(
Select EmpID,EmpName, EMpSalary,DeptID, Row_number() over ( Partition by EmpID,EmpName, EMpSalary,DeptID 
order by empID) from EmpSalary
)

Delete RemoveDuplicate where rnk>1

End

---Run
Exec DeleteDuplicate