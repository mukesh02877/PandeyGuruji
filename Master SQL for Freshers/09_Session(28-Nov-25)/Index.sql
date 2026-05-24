

--Sorting data


CREATE TABLE Employee_Index
(
Emp_ID INT ,
Emp_name Varchar(100),
Emp_Sal int 
)


Select * from Employee_Index where Emp_ID = 3

--- Insert data into table manually in all column

INSERT INTO Employee_Index VALUES (1,'Anees',1000)
INSERT INTO Employee_Index VALUES (5,'Rick',1200)
INSERT INTO Employee_Index VALUES (4,'John',1100);
INSERT INTO Employee_Index VALUES (2,'Stephen',900);
INSERT INTO Employee_Index VALUES (3,'Maria',1400)


Create CLUSTERED index IX_Employee_Index on Employee_Index(Emp_ID)

Create NONCLUSTERED index IX_Employee_Index_Emp_Sal on Employee_Index(Emp_Sal,Emp_name)


--Non cluster index 

CREATE TABLE Employee_NonCIndex
(
Emp_ID INT ,
Emp_name Varchar(100),
Emp_Sal int 
)

Select * from Employee_NonCIndex where Emp_ID = 2

--- Insert data into table manually in all column

INSERT INTO Employee_NonCIndex VALUES (1,'Anees',1000)
INSERT INTO Employee_NonCIndex VALUES (5,'Rick',1200)
INSERT INTO Employee_NonCIndex VALUES (4,'John',1100);
INSERT INTO Employee_NonCIndex VALUES (2,'Stephen',900);
INSERT INTO Employee_NonCIndex VALUES (3,'Maria',1400)


Create NONCLUSTERED index IX_Employee_NonCIndex on Employee_NonCIndex(Emp_ID)
