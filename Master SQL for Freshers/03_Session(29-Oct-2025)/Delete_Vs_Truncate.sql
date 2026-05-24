

----------------Truncate Vs Delete Vs Drop-------------------------

---Truncate Vs Delete: Used to Remove Data
---Drop: Remove Data as well objects(Table, Stored Procedure, Function, Triggers etc.)


--drop table Emp

CREATE TABLE Emp
(
Emp_ID INT Identity(1,1),  -- Rule set
Emp_name Varchar(100),
Emp_Sal int 
)

INSERT INTO Emp VALUES ('Anees',1000)
INSERT INTO Emp VALUES ('Rick',1200)
INSERT INTO Emp VALUES ('John',1100);
INSERT INTO Emp VALUES ('Stephen',900);
INSERT INTO Emp VALUES ('Maria',1400);

INSERT INTO Emp VALUES ('Karan',1500);

INSERT INTO Emp VALUES ('Tarrio',1700);


Select * from Emp

--Delete
Delete emp where Emp_ID = 5

Delete emp 


--Truncate

Truncate table emp where Emp_ID = 3

Truncate table emp 


drop table Emp



Select * from dimCustomer_Copy

Delete dimCustomer_Copy12
Truncate table dimCustomer_Copy12

Begin Tran
Delete dimCustomer_Copy12
Delete dimCustomer_Copy

Begin Tran
Truncate table dimCustomer_Copy

Rollback


/*

--Delete:
1. We can use Where clause.
2. Delete not reseed identity value\\ Not reset identity value.
3. Delete remove records one by one
4. Delete is slower than truncate


--Truncate
1. We can't use Where clause.
2. Truncate reseed identity value\\ reset identity value -   when new insert happent start with always 1.
3. Truncate lock entire table and remove all records at a time.
4. Truncate is faster than Delete.

*/